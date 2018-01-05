/*****************************************************************************
 * life.c
 * Parallelized and optimized implementation of the game of life resides here
 ****************************************************************************/
#include "life.h"
#include "util.h"
#include "stdio.h"
#include "pthread.h"
#include "string.h"
#include "unistd.h"
#include "stdlib.h"
/*****************************************************************************
 * Helper function definitions
 ****************************************************************************/
#define THREAD_NUM 16

//structure for thread parameter
typedef struct work{
    pthread_mutex_t* upper_lock_other; 
    pthread_mutex_t* upper_lock_self; 
    pthread_mutex_t* lower_lock_other;
    pthread_mutex_t* lower_lock_self;
    
    pthread_barrier_t* barrier;
    
    char* inboard; 
    char* outboard; 
    char* info_buffer;
    char* info_buffer2;
    
    int gens; 
    int ncols,nrows;
    int i1,i2;
    int upperi1,upperi2;
    int loweri1,loweri2;
    
    char upper_bound;
    char lower_bound;

    
}work;

//structure for status map
typedef struct status{
    signed char state;
    char update; 
}status; 

#define STATUS_NUM 32
status status_map[STATUS_NUM];

//helper function header
void init(int nrows, int ncols, char info_buffer[nrows][ncols], char* inboard );
void update_hori_boundary(int nrows,int ncols, char buffer1[nrows][ncols], char buffer2[nrows][ncols] );
void update_verti_boundary(int nrows,int ncols, char buffer1[nrows][ncols], char buffer2[nrows][ncols] );
void memcpy2(void* dest, void* src, size_t size);
void init_status_map();
void *parallel_game_of_life_new (void* param);
char *sequential_game_of_life2 (char* outboard, 
        char* inboard,
        const int nrows,
        const int ncols,
        const int gens_max);
char *sequential_game_of_life_new (char* outboard, 
    const int nrows,
    const int ncols,
    char info_buffer[nrows][ncols],
    char info_buffer2[nrows][ncols],
    const int gens_max);

/*****************************************************************************
 * Game of life implementation
 ****************************************************************************/

/*
 * The high level function be called to start the game
 */
char* game_of_life (char* outboard, 
	      char* inboard,
	      const int nrows,
	      const int ncols,
	      const int gens_max)
{
    
    
    char info_buffer[nrows][ncols];
    char info_buffer2[nrows][ncols];
    
    //initialize the status map
    init_status_map();
    
    //check for the size 
    if(nrows <= 32 ){
        init(nrows,ncols,info_buffer,inboard);
        memcpy(info_buffer2,info_buffer,nrows*ncols);
        return sequential_game_of_life_new (outboard, nrows, ncols,info_buffer,info_buffer2 ,gens_max);
    }
    else if(nrows >10000){
        printf("Maximum size is 10000*10000.\n");
        exit(-1);
    }
    
    //calculate the workload for each thread
    int work_load = nrows/THREAD_NUM;
    int lock_num = (THREAD_NUM<<1);
    pthread_t workers[THREAD_NUM];
    pthread_mutex_t locks[lock_num];
    pthread_barrier_t worker_barrier;
    pthread_barrier_init(&worker_barrier, NULL , THREAD_NUM); 
    
    //initialize locks
    for(int i=0;i< lock_num; ++i){
        pthread_mutex_init(&locks[i],NULL);
    }
    work works[THREAD_NUM]; 
    //initialize thread work
    for(int i=0; i< THREAD_NUM; ++i){
        int upperi1 = i*work_load;
        int upperi2= upperi1+1;
        int loweri1 = upperi1+work_load-1;
        int loweri2 = loweri1-1;
        int i1 = upperi2+1;
        int i2= loweri2-1;
        
        int i_lock = i*2;
        int upper_lock_other = (i_lock-1+lock_num)%lock_num;
        int upper_lock_self = (i_lock);
        
        int lower_lock_other = (i_lock+2)%lock_num;
        int lower_lock_self = (i_lock+1);
        
        works[i].upper_lock_other = &locks[upper_lock_other];
        works[i].upper_lock_self= &locks[upper_lock_self];
        works[i].lower_lock_other = &locks[lower_lock_other];
        works[i].lower_lock_self= &locks[lower_lock_self];
        works[i].barrier=&worker_barrier;
        works[i].outboard = outboard;
        works[i].inboard = inboard;
        works[i].info_buffer = &info_buffer[0][0];
        works[i].info_buffer2 = &info_buffer2[0][0];
                
        works[i].ncols=ncols;
        works[i].nrows=nrows;
        works[i].gens=gens_max;
        works[i].i1=i1;
        works[i].i2=i2;
        works[i].loweri1=loweri1;
        works[i].loweri2=loweri2;
        works[i].upperi1=upperi1;
        works[i].upperi2=upperi2;
        works[i].upper_bound = i==0;
        works[i].lower_bound = i==THREAD_NUM-1;
        
        
        
    }
    //start the thread creation
    for(int i=0; i< THREAD_NUM; ++i){
        pthread_create(&workers[i],NULL,parallel_game_of_life_new,&works[i]);
    }
    //join all the threads
    for(int i=0; i< THREAD_NUM; ++i){
        pthread_join(workers[i],NULL);
    }
    
    return outboard;
  
}

/*
 * a function to initialize the status map so that we can map the current status to the next generation status.
 */
void init_status_map(){
    for(int i =0  ;i<STATUS_NUM; i++){
        char old_status = i>>4;
        char new_status = (((i&0b01111)|old_status) ==3);
        char update = new_status^old_status;
        status_map[i].state = new_status? 1: -1;
        status_map[i].update = update;
    }
}

/*
 * A function to initialize the information buffer that contains the status of each cell
 * for sequential game of life
 */
void init(int nrows, int ncols, char info_buffer[nrows][ncols], char* inboard ){
    #define BOARD( __board, __i, __j )  (__board[(__i)*ncols + (__j)])  
    for (int i = 0; i < nrows; i++)
    {
        
        for (int j = 0; j < ncols; j++)
        {
            const int inorth = mod (i-1, nrows); 
            const int isouth = mod (i+1, nrows);
            const int jwest = mod (j-1, ncols);
            const int jeast = mod (j+1, ncols);

             char neighbor_count = 
                BOARD (inboard, inorth, jwest) + 
                BOARD (inboard, inorth, j) + 
                BOARD (inboard, inorth, jeast) + 
                BOARD (inboard, i, jwest) +
                BOARD (inboard, i, jeast) + 
                BOARD (inboard, isouth, jwest) +
                BOARD (inboard, isouth, j) + 
                BOARD (inboard, isouth, jeast);

            
            
            char state = BOARD (inboard, i, j)? 1:0 ;
            neighbor_count = neighbor_count + (state<<4);
            info_buffer[i][j] = neighbor_count;

        }
    }
    
}
/*
 * A function to initialize the information buffer that contains the status of each cell
 * for parallel game of life
 */
void init_parallel(int nrows, int ncols, int iinit,int iend, char (*info_buffer)[ncols],char (*info_buffer2)[ncols], char* inboard ){
    
    for (int i = iinit; i < iend; i++)
    {
        int il = i*ncols;
        int inorth = mod (i-1, nrows)*ncols; 
        int isouth = mod (i+1, nrows)*ncols;
        for (int j = 0; j < ncols; j++)
        {
            const int jwest = mod (j-1, ncols);
            const int jeast = mod (j+1, ncols);

             char neighbor_count = 
                 (inboard[ inorth+ jwest]) + 
                 (inboard[ inorth+ j]) + 
                 (inboard[ inorth+ jeast]) + 
                 (inboard[ il+ jwest]) +
                 (inboard[ il+ jeast]) + 
                 (inboard[ isouth+ jwest]) +
                 (inboard[ isouth+ j]) + 
                 (inboard[ isouth+ jeast]);

            
            char state =  inboard[il+ j] ? 1:0 ;
            neighbor_count = neighbor_count + (state<<4);
            info_buffer2[i][j] = neighbor_count;
        }
    }
}

/*
 * A macro to update the neighbor cells by increase or decrease count of that cell
 */
#define UPDATE( i,j,inorth,isouth ,jwest, jeast,buffer2,change) \
    buffer2[i][jwest] += change;\
    buffer2[i][j] = buffer2[i][j] + (change<<4);\
    buffer2[i][jeast] += change;\
    buffer2[inorth][j] += change;\
    buffer2[inorth][jwest] += change;\
    buffer2[inorth][jeast] += change;\
    buffer2[isouth][j] += change;\
    buffer2[isouth][jwest] += change;\
    buffer2[isouth][jeast] += change;\
    
/*
 * Macro to help lock/unlock the mutex locks
 */
#define LOCK(l) pthread_mutex_lock(l)
#define UNLOCK(l) pthread_mutex_unlock(l)


/*
 * This is the function to be called when size of the board is less than 32*32.
 * For sequential run of the game of life.
 */
char *sequential_game_of_life_new (char* outboard, 
        const int nrows,
        const int ncols,
        char info_buffer[nrows][ncols],
        char info_buffer2[nrows][ncols],
        const int gens_max)
{
    int curgen, i, j;

    char (*buffer1)[ncols]= info_buffer;
    char (*buffer2)[ncols]= info_buffer2;

    for (curgen = 0; curgen < gens_max; curgen++)
    {
        
        for (i = 1; i < nrows-1; i++)
        {
            
            int inorth = i-1; 
            int isouth = i+1;
            for (j = 1; j < ncols-1; j++)
            {
                int info_key= buffer1[i][j];
                status new_status =  status_map[info_key]; 
                int update = new_status.update;
                int jwest = j-1;
                int jeast = j+1;

                if(update){
                   int new_state = new_status.state;
                   UPDATE(i,j,inorth,isouth,jwest,jeast,buffer2,new_state);
                }
            }

        }
        update_hori_boundary(nrows,ncols,buffer1,buffer2); 
        update_verti_boundary(nrows,ncols,buffer1,buffer2); 
      
        memcpy(buffer1,buffer2,nrows*ncols);

    }
    //update the outboard according to information buffer
    for (i = 0; i < nrows; i++)
    {
        int il= (i)*(ncols);
        for (j = 0; j < ncols; j++)
        {
            outboard[il+j]=(buffer2[i][j]>16);
        }   
    }
    return outboard;
}

/*
 * Macro to check boundary, if it is out of boundary then return the correct index
 */
#define LOWBOUND(i,max) i<0?max-1:i
#define HIGHBOUND(i,max) i>=max?0:i

/*
 * The function to update the information buffer for the horizontal boundary when run sequential game of life.
 * Separate the boundary update to avoid unnecessary boundary check 
 */
void  update_hori_boundary(int nrows,int ncols, char buffer1[nrows][ncols], char buffer2[nrows][ncols] ){
    for(int j = 0 ;j <ncols; j++){
        int i = 0;
        int info_key= buffer1[i][j];
        status new_status =  status_map[info_key]; 
        int update = new_status.update;

        int inorth = nrows-1;
        int isouth = 1;
        int jwest =  LOWBOUND (j-1, ncols);
        int jeast =  HIGHBOUND (j+1, ncols);
        if(update){
            int new_state =  new_status.state;
            UPDATE(i,j,inorth,isouth,jwest,jeast,buffer2,new_state);
        }

        i = nrows-1;
        info_key= buffer1[i][j];
        new_status =  status_map[info_key]; 
        update = new_status.update;
        inorth = nrows-2;
        isouth = 0;
        jwest =  LOWBOUND (j-1, ncols);
        jeast =  HIGHBOUND (j+1, ncols);
        if(update){
            int new_state =  new_status.state;
            UPDATE(i,j,inorth,isouth,jwest,jeast,buffer2,new_state);
        }
    }
}
/*
 * The function to update the information buffer for the upper boundary
 * when run Parallel game of life.
 * Separate the boundary update to avoid unnecessary boundary check 
 */
void  update_upper_hori_boundary_parallel(int nrows,int ncols, char buffer1[nrows][ncols], char buffer2[nrows][ncols],pthread_mutex_t* lockself,pthread_mutex_t* lockother,int found   ){
    for(int j = 0 ;j <ncols; j++){
        int i = 0;
        int info_key= buffer1[i][j];
        status new_status =  status_map[info_key]; 
        int update = new_status.update;

        int inorth = nrows-1;
        int isouth = 1;
        int jwest =  LOWBOUND (j-1, ncols);
        int jeast =  HIGHBOUND (j+1, ncols);
        if(update){
            int change = new_status.state;

            LOCK(lockself);
            buffer2[i][jwest] += change;
            buffer2[i][jeast] += change;
            buffer2[i][j] = buffer2[i][j] + (change<<4);
            UNLOCK(lockself);

            LOCK(lockother);
            buffer2[inorth][j] += change;
            buffer2[inorth][jeast] += change;
            buffer2[inorth][jwest] += change;
            UNLOCK(lockother);
            if(!found){
                buffer2[isouth][j] += change;
                buffer2[isouth][jwest] += change;
                buffer2[isouth][jeast] += change;     
            }
        }
            
    }
}
/*
 * The function to update the information buffer for the lower boundary 
 * when run Parallel game of life.
 * Separate the boundary update to avoid unnecessary boundary check 
 */
void  update_lower_hori_boundary_parallel(int nrows,int ncols, char buffer1[nrows][ncols], char buffer2[nrows][ncols],pthread_mutex_t* lockself,pthread_mutex_t* lockother ,int found  ){
        for(int j = 0 ;j <ncols; j++){
            int i = nrows-1;
            int info_key= buffer1[i][j];
            status new_status =  status_map[info_key]; 
            int update = new_status.update;
           
            int inorth = nrows-2;
            int isouth = 0;
            int jwest =  LOWBOUND (j-1, ncols);
            int jeast =  HIGHBOUND (j+1, ncols);
            if(update){
                int change = new_status.state;
                
                LOCK(lockself);
                buffer2[i][jwest] += change;
                buffer2[i][jeast] += change;
                buffer2[i][j] = buffer2[i][j] + (change<<4);
                UNLOCK(lockself);
                if(!found){
                    buffer2[inorth][j] += change;
                    buffer2[inorth][jeast] += change;
                    buffer2[inorth][jwest] += change;
                }
                LOCK(lockother);
                buffer2[isouth][j] += change;
                buffer2[isouth][jwest] += change;
                buffer2[isouth][jeast] += change;    
                UNLOCK(lockother);
            }
            
        }
}
/*
 * The function to update the information buffer for the second upper line of the thread workload
 * when run Parallel game of life.
 * Use a separate function since this part require different lock than others
 */
void  update_row_parallel_upperself(int nrows,int ncols,int i,char buffer1[nrows][ncols], char buffer2[nrows][ncols], pthread_mutex_t* lock, int found ){
    int j_end=ncols-1;
    // To avoid boundary check, the corner piece is calculated separately
    int j = 0;
    int inorth = i-1;
    int isouth = i+1;
    int jwest =  j_end;
    int jeast =  1;
    int info_key= buffer1[i][j];
    status new_status =  status_map[info_key]; 
    int update = new_status.update;
    if(update){
        int change = new_status.state;
        LOCK(lock);
        buffer2[inorth][j] += change;
        buffer2[inorth][jeast] += change;
        buffer2[inorth][jwest] += change;
        UNLOCK(lock);
        if(!found){
            buffer2[i][jwest] += change;
            buffer2[i][jeast] += change;
            buffer2[i][j] = buffer2[i][j] + (change<<4);
            buffer2[isouth][j] += change;
            buffer2[isouth][jwest] += change;
            buffer2[isouth][jeast] += change;
        }
    }

    for(int j = 1 ;j <j_end; j++){
        int info_key= buffer1[i][j];
        status new_status =  status_map[info_key];  
        int update = new_status.update;

        int jwest =  j-1;
        int jeast =  j+1;
        if(update){
            int change = new_status.state;
           
            LOCK(lock);
            buffer2[inorth][j] += change;
            buffer2[inorth][jeast] += change;
            buffer2[inorth][jwest] += change;
            UNLOCK(lock);
            if(!found){
                buffer2[i][jwest] += change;
                buffer2[i][jeast] += change;
                buffer2[i][j] = buffer2[i][j] + (change<<4);
                buffer2[isouth][j] += change;
                buffer2[isouth][jwest] += change;
                buffer2[isouth][jeast] += change;
            }
        }
    }
    // To avoid boundary check, the corner piece is calculated separately
    j = j_end;
    jwest =  j_end-1;
    jeast =  0;
    info_key= buffer1[i][j];
    new_status =  status_map[info_key]; 
    update = new_status.update;
    if(update){
        int change = new_status.state;
        LOCK(lock);
        buffer2[inorth][j] += change;
        buffer2[inorth][jeast] += change;
        buffer2[inorth][jwest] += change;
        UNLOCK(lock);
        if(!found){
            buffer2[i][jwest] += change;
            buffer2[i][jeast] += change;
            buffer2[i][j] = buffer2[i][j] + (change<<4);
            buffer2[isouth][j] += change;
            buffer2[isouth][jwest] += change;
            buffer2[isouth][jeast] += change;
        }

    }
    
}
/*
 * The function to update the information buffer for the upper line of the thread workload
 * when run Parallel game of life.
 * Use a separate function since this part require different lock than others
 */
void  update_row_parallel_upperother(int nrows,int ncols,int i,char buffer1[nrows][ncols], char buffer2[nrows][ncols], pthread_mutex_t* lockself,pthread_mutex_t* lockother,int found ){
    int j_end=ncols-1;
    // To avoid boundary check, the corner piece is calculated separately
    int j = 0;
    int inorth = i-1;
    int isouth = i+1;
    int jwest =  j_end;
    int jeast =  1;
    int info_key= buffer1[i][j];
    status new_status =  status_map[info_key]; 
    int update = new_status.update;
    if(update){
        int change =new_status.state;

        LOCK(lockself);
        buffer2[i][jwest] += change;
        buffer2[i][jeast] += change;
        buffer2[i][j] = buffer2[i][j] + (change<<4);
        UNLOCK(lockself);

        LOCK(lockother);
        buffer2[inorth][j] += change;
        buffer2[inorth][jeast] += change;
        buffer2[inorth][jwest] += change;
        UNLOCK(lockother);
        if(!found){
            buffer2[isouth][j] += change;
            buffer2[isouth][jwest] += change;
            buffer2[isouth][jeast] += change;      
        }
    }
    
    for(int j = 1 ;j <j_end; j++){
        int info_key= buffer1[i][j];
        status new_status =  status_map[info_key]; 
        int update = new_status.update;

        int jwest =  j-1;
        int jeast =  j+1;
        if(update){
            int change = new_status.state;

            LOCK(lockself);
            buffer2[i][jwest] += change;
            buffer2[i][jeast] += change;
            buffer2[i][j] = buffer2[i][j] + (change<<4);
            UNLOCK(lockself);

            LOCK(lockother);
            buffer2[inorth][j] += change;
            buffer2[inorth][jeast] += change;
            buffer2[inorth][jwest] += change;
            UNLOCK(lockother);

            if(!found){
            buffer2[isouth][j] += change;
            buffer2[isouth][jwest] += change;
            buffer2[isouth][jeast] += change;      
            }     

        }

    }
    // To avoid boundary check, the corner piece is calculated separately
    j = j_end;
    jwest =  j_end-1;
    jeast =  0;
    info_key= buffer1[i][j];
    new_status =  status_map[info_key];
     update = new_status.update;
    if(update){
        int change = new_status.state;

        LOCK(lockself);
        buffer2[i][jwest] += change;
        buffer2[i][jeast] += change;
        buffer2[i][j] = buffer2[i][j] + (change<<4);
        UNLOCK(lockself);

        LOCK(lockother);
        buffer2[inorth][j] += change;
        buffer2[inorth][jeast] += change;
        buffer2[inorth][jwest] += change;
        UNLOCK(lockother);

        if(!found){
          buffer2[isouth][j] += change;
          buffer2[isouth][jwest] += change;
          buffer2[isouth][jeast] += change;      
        }

    }
    
}
/*
 * The function to update the information buffer for the second lower line of the thread workload
 * when run Parallel game of life.
 * Use a separate function since this part require different lock than others
 */
void  update_row_parallel_lowerself(int nrows,int ncols,int i,char buffer1[nrows][ncols], char buffer2[nrows][ncols], pthread_mutex_t* lock ,int found){
    int j_end=ncols-1;
    // To avoid boundary check, the corner piece is calculated separately
    int j = 0;
    int inorth = i-1;
    int isouth = i+1;
    int jwest =  j_end;
    int jeast =  1;
    int info_key= buffer1[i][j];
    status new_status =  status_map[info_key]; 
    int update = new_status.update;
    if(update){
        int change = new_status.state;
        if(!found){
        buffer2[i][jwest] += change;
        buffer2[i][jeast] += change;
        buffer2[i][j] = buffer2[i][j] + (change<<4);

        buffer2[inorth][j] += change;
        buffer2[inorth][jeast] += change;
        buffer2[inorth][jwest] += change;
        }
        LOCK(lock);
        buffer2[isouth][j] += change;
        buffer2[isouth][jwest] += change;
        buffer2[isouth][jeast] += change;
        UNLOCK(lock);
 
    }
    
    for(int j = 1 ;j <j_end; j++){
        int info_key= buffer1[i][j];
        status new_status =  status_map[info_key]; 
        int update = new_status.update;

        int jwest =  j-1;
        int jeast =  j+1;
        if(update){
            int change = new_status.state;
            if(!found){
            buffer2[i][jwest] += change;
            buffer2[i][jeast] += change;
            buffer2[i][j] = buffer2[i][j] + (change<<4);

            buffer2[inorth][j] += change;
            buffer2[inorth][jeast] += change;
            buffer2[inorth][jwest] += change;
            }
            LOCK(lock);
            buffer2[isouth][j] += change;
            buffer2[isouth][jwest] += change;
            buffer2[isouth][jeast] += change;
            UNLOCK(lock);
        }

    }
    // To avoid boundary check, the corner piece is calculated separately
    j = j_end;
    jwest =  j_end-1;
    jeast =  0;
    info_key= buffer1[i][j];
    new_status =  status_map[info_key]; 
    update = new_status.update;
    if(update){
        int change =new_status.state;
        if(!found){
        buffer2[i][jwest] += change;
        buffer2[i][jeast] += change;
        buffer2[i][j] = buffer2[i][j] + (change<<4);

        buffer2[inorth][j] += change;
        buffer2[inorth][jeast] += change;
        buffer2[inorth][jwest] += change;
        }
        LOCK(lock);
        buffer2[isouth][j] += change;
        buffer2[isouth][jwest] += change;
        buffer2[isouth][jeast] += change;
        UNLOCK(lock);

    }
}
/*
 * The function to update the information buffer for the lower line of the thread workload
 * when run Parallel game of life.
 * Use a separate function since this part require different lock than others
 */
void  update_row_parallel_lowerother(int nrows,int ncols,int i,char buffer1[nrows][ncols], char buffer2[nrows][ncols], pthread_mutex_t* lockself,pthread_mutex_t* lockother, int found ){
    int j_end=ncols-1;
    // To avoid boundary check, the corner piece is calculated separately.
    int j = 0;
    int inorth = i-1;
    int isouth = i+1;
    int jwest =  j_end;
    int jeast =  1;
    int info_key= buffer1[i][j];
    status new_status =  status_map[info_key]; 
    int update = new_status.update;
    if(update){
        int change = new_status.state;
        LOCK(lockself);
        buffer2[i][jwest] += change;
        buffer2[i][jeast] += change;
        buffer2[i][j] = buffer2[i][j] + (change<<4);
        UNLOCK(lockself);

        if(!found){
        buffer2[inorth][j] += change;
        buffer2[inorth][jeast] += change;
        buffer2[inorth][jwest] += change;
        }

        LOCK(lockother);
        buffer2[isouth][j] += change;
        buffer2[isouth][jwest] += change;
        buffer2[isouth][jeast] += change;      
        UNLOCK(lockother);

    }
            
    for(int j = 1 ;j <j_end; j++){
        int info_key= buffer1[i][j];
        status new_status =  status_map[info_key]; 
        int update = new_status.update;

        int jwest =  j-1;
        int jeast =  j+1;
        if(update){
         
            int change = new_status.state;

            LOCK(lockself);
            buffer2[i][jwest] += change;
            buffer2[i][jeast] += change;
            buffer2[i][j] = buffer2[i][j] + (change<<4);
            UNLOCK(lockself);

            if(!found){
            buffer2[inorth][j] += change;
            buffer2[inorth][jeast] += change;
            buffer2[inorth][jwest] += change;
            }

            LOCK(lockother);
            buffer2[isouth][j] += change;
            buffer2[isouth][jwest] += change;
            buffer2[isouth][jeast] += change;      
            UNLOCK(lockother);
        }

    }
    // To avoid boundary check, the corner piece is calculated separately.
    j = j_end;
    jwest =  j_end-1;
    jeast =  0;
    info_key= buffer1[i][j];
    new_status =  status_map[info_key]; 
    update = new_status.update;
    if(update){
        int change = new_status.state;

        LOCK(lockself);
        buffer2[i][jwest] += change;
        buffer2[i][jeast] += change;
        buffer2[i][j] = buffer2[i][j] + (change<<4);
        UNLOCK(lockself);

        if(!found){
        buffer2[inorth][j] += change;
        buffer2[inorth][jeast] += change;
        buffer2[inorth][jwest] += change;
        }

        LOCK(lockother);
        buffer2[isouth][j] += change;
        buffer2[isouth][jwest] += change;
        buffer2[isouth][jeast] += change;      
        UNLOCK(lockother);
    }
}
/*
 * A function to calculate the corner cell of a workload.
 * To avoid boundary check, the corner piece is calculated separately.
 */
void inline update_verti_boundary_i_j0(int nrows,int ncols, int i , char buffer1[nrows][ncols], char buffer2[nrows][ncols] ){

        int j = 0;
        int info_key= buffer1[i][j];
        status new_status =  status_map[info_key];
        int update = new_status.update;

        int inorth = i-1;
        int isouth = i+1;
        int jwest =  ncols-1;
        int jeast =  1;

        if(update){
            int new_state =  new_status.state;
            UPDATE(i,j,inorth,isouth,jwest,jeast,buffer2,new_state);
        }

}
/*
 * A function to calculate the corner cell of a workload.
 * To avoid boundary check, the corner piece is calculated separately.
 */
void inline update_verti_boundary_i_jl(int nrows,int ncols, int i, char buffer1[nrows][ncols], char buffer2[nrows][ncols] ){
        int j = ncols-1;
        int info_key= buffer1[i][j];
        status new_status =  status_map[info_key];
        int update = new_status.update;
        int inorth = i-1;
        int isouth = i+1;
        int jwest =  ncols-2; 
        int jeast =  0;
        
        if(update){
            int new_state =  new_status.state;
            UPDATE(i,j,inorth,isouth,jwest,jeast,buffer2,new_state);
        }


}
/*
 * A function to calculate vertical boundary for sequential game of life.
 */
void  update_verti_boundary(int nrows,int ncols, char buffer1[nrows][ncols], char buffer2[nrows][ncols] ){
    for(int i = 1 ;i <nrows-1; i++){
        int j = 0;
        int info_key= buffer1[i][j];
        status new_status =  status_map[info_key]; 
        int update = new_status.update;

        int inorth = i-1;
        int isouth = i+1;
        int jwest =  ncols-1;
        int jeast =  1;

        if(update){
            int new_state =  new_status.state;
            UPDATE(i,j,inorth,isouth,jwest,jeast,buffer2,new_state);
        }
        j = ncols-1;
        info_key= buffer1[i][j];
        new_status =  status_map[info_key]; 
        update = new_status.update;

        inorth = i-1;
        isouth = i+1;
        jwest =  ncols-2;
        jeast =  0;

        if(update){
            int new_state =  new_status.state;
            UPDATE(i,j,inorth,isouth,jwest,jeast,buffer2,new_state);
        }

    }
}
/*
 * The function call to start the the parallel workload for each thread.
 * Each thread is assigned multiple whole line of rows according to the total size.
 * Locks are assigned when calculate the borders between each thread.
 * Loop unrolling is used when calculate the inner loop.
 */
void *parallel_game_of_life_new (void* _param_)
{
    
    work* param= (work*)_param_;
    
    int curgen;

    int nrows = param->nrows;
    int ncols = param->ncols;
    int gens_max = param->gens;
    int i_init= param->i1;
    int i_end= param->i2+1;
    int upperi1 = param->upperi1;
    int upperi2 = param->upperi2;
    int loweri1 = param->loweri1;
    int loweri2 = param->loweri2;
    char* outboard= param->outboard;
    pthread_barrier_t* barrier =  param->barrier;
    
    char (*buffer1)[ncols]= (char(*)[ncols])param->info_buffer;
    char (*buffer2)[ncols]= (char(*)[ncols])param->info_buffer2;
    char upper_bound = param->upper_bound;
    char lower_bound = param->lower_bound;
    
    pthread_mutex_t* upper_lock_self= param->upper_lock_self; 
    pthread_mutex_t* upper_lock_other= param->upper_lock_other; 
    pthread_mutex_t* lower_lock_self= param->lower_lock_self; 
    pthread_mutex_t* lower_lock_other= param->lower_lock_other; 

    
    int offset = (upperi1);
    int amount = (loweri1-upperi1+1)*ncols;
    
    #define frame_num 2

    //once the generation is larger than the threshold we decide it is in stable stage and frame buffer will be used.
    #define threshold_gen 5000
    
    //frame buffer to save calculation
    char* inframe[frame_num];
    char* outframe[frame_num];
    int amount2 = (loweri2 - upperi2+1)*ncols;

    for(int i = 0 ;i<frame_num;i++){
        inframe[i]=malloc(amount);
        outframe[i]=malloc(amount);
    }
    int inframe_index=0;
    

    init_parallel(nrows,ncols,upperi1,loweri1+1,buffer1,buffer2,param->inboard);
    pthread_barrier_wait(barrier);
    
    
    for (curgen = 0; curgen < gens_max; curgen++)
    {
        int found =0 ;
        //Try to find if this frame is shown before
        //if a frame buffer match is found then we can get the frame result directly without calculation
        if(curgen>threshold_gen){
            for(int i =0;i<frame_num;i++){
                if((memcmp(buffer2+offset,inframe[i],amount)==0)){
                    found =1;
                    memcpy(buffer1+upperi1,buffer2+upperi1,ncols);
                    memcpy(buffer1+upperi2,buffer2+upperi2,ncols);
                    memcpy(buffer1+loweri2,buffer2+loweri2,ncols);
                    memcpy(buffer1+loweri1,buffer2+loweri1,ncols);

                    memcpy(buffer2+upperi2,outframe[i]+ncols,amount2);
                    break;
                }
            }
            if(!found){
                memcpy(inframe[inframe_index],buffer2+offset,amount);
                memcpy(buffer1+offset,buffer2+offset,amount);
            }
        }else{
            memcpy(buffer1+offset,buffer2+offset,amount);
        }
       
       
        //barrier to synchronize between different threads at each generation
        pthread_barrier_wait(barrier);
        
        //update the upper row separately to avoid border/boundary check
        if(upper_bound){
            update_upper_hori_boundary_parallel(nrows,ncols,buffer1,buffer2,upper_lock_self,upper_lock_other,found); 
        }else{
            update_row_parallel_upperother(nrows,ncols,upperi1,buffer1,buffer2,upper_lock_self,upper_lock_other,found);
        }
        update_row_parallel_upperself(nrows,ncols,upperi2,buffer1,buffer2,upper_lock_self,found);
        
        
        //if a frame buffer match is found then we can get the frame result directly without calculation
        if(!found){
            for (int i = i_init; i < i_end; i++)
            {

                update_verti_boundary_i_j0(nrows,ncols,i,buffer1,buffer2);
                int inorth = i-1; 
                int isouth = i+1;
                int j;
                for (j = 1; j < ncols-2; j=j+2)
                {
                    int info_key= buffer1[i][j];
                    status new_status =  status_map[info_key];
                    int update = new_status.update;

                    int info_key2= buffer1[i][j+1];
                    status new_status2 =  status_map[info_key2];
                    int update2= new_status2.update;
                    if(update){
                       int jwest = j-1;
                       int jeast = j+1;
                       int new_state = new_status.state;
                       UPDATE(i,j,inorth,isouth,jwest,jeast,buffer2,new_state);
                    }

                    if(update2){
                       int jwest = j;
                       int jeast = j+2;
                       int new_state2 = new_status2.state;
                       UPDATE(i,(j+1),inorth,isouth,jwest,jeast,buffer2,new_state2);
                    }

                }
                for ( ;j < ncols-1; j=j+1)
                {
                    int info_key= buffer1[i][j];
                    status new_status =  status_map[info_key];
                    int update = new_status.update;
                    if(update){
                       int jwest = j-1;
                       int jeast = j+1;
                       int new_state = new_status.state;
                       UPDATE(i,j,inorth,isouth,jwest,jeast,buffer2,new_state);
                    }
                }
                update_verti_boundary_i_jl(nrows,ncols,i,buffer1,buffer2);

            }
        }
        
        //update the lower row separately to avoid border/boundary check
        update_row_parallel_lowerself(nrows,ncols,loweri2,buffer1,buffer2,lower_lock_self,found);
        if(lower_bound){
            update_lower_hori_boundary_parallel(nrows,ncols,buffer1,buffer2,lower_lock_self,lower_lock_other,found); 
        }else{
            update_row_parallel_lowerother(nrows,ncols,loweri1,buffer1,buffer2,lower_lock_self,lower_lock_other,found);
        }
        
        //another barrier to wait for each thread to finish updating before proceed to next generation
        pthread_barrier_wait(barrier);
        
        
        if(curgen>threshold_gen&&!found){ 
            //store the frame into frame buffer if there is not match found.
            
            memcpy(outframe[inframe_index],buffer2+offset,amount);
            inframe_index=(inframe_index+1)%frame_num;
            
        }
    }
    
    //All generation is finished. update the outboard with information buffer.
    for (int i = upperi1; i <= loweri1; i++)
    {
        int il= (i)*(ncols);
        for (int j = 0; j < ncols; j++)
        {
            outboard[il+j]=(buffer2[i][j]>16);
        }
    }
   
    pthread_exit(NULL);
    return 0;
}