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
/*****************************************************************************
 * Helper function definitions
 ****************************************************************************/
#define THREAD_NUM 8
#define SCHDULER_THREAD 1

typedef struct work{
    pthread_mutex_t* upper_lock_other; //8B
    pthread_mutex_t* upper_lock_self; 
    pthread_mutex_t* lower_lock_other;
    pthread_mutex_t* lower_lock_self;
    //32B
    
    pthread_barrier_t* barrier;//8B
    
    
    char* outboard; //8B
    char* info_buffer;
    char* info_buffer2;
    //24B
    
    int gens; //4B
    int ncols,nrows;
    int i1,i2;
    int upperi1,upperi2;
    int loweri1,loweri2;
    
    int padding[6];
    
    char upper_bound;
    char lower_bound;

    
}work;

typedef struct info{
    char neighbour_count;
//    char new_count;
    char state;
}info;

typedef struct status{
    signed char state;
    char update; 
}status; 

#define STATUS_NUM 32
status status_map[STATUS_NUM];

void init(int nrows, int ncols, char info_buffer[nrows][ncols], char* inboard );
void  update_hori_boundary(int nrows,int ncols, char buffer1[nrows][ncols], char buffer2[nrows][ncols] );
void  update_verti_boundary(int nrows,int ncols, char buffer1[nrows][ncols], char buffer2[nrows][ncols] );
void memcpy2(void* dest, void* src, size_t size);

void *parallel_game_of_life_new (void* param);
char*
sequential_game_of_life2 (char* outboard, 
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



//
char*
game_of_life (char* outboard, 
	      char* inboard,
	      const int nrows,
	      const int ncols,
	      const int gens_max)
{
//     return sequential_game_of_life2 (outboard, inboard, nrows, ncols, gens_max);
    
    if(nrows<=32 || ncols<=32){
        return sequential_game_of_life (outboard, inboard, nrows, ncols, gens_max);
    }
    
   
    int new_rows = nrows;
    int new_cols= ncols;
    char info_buffer[new_rows][new_cols];
    char info_buffer2[new_rows][new_cols];
    
    
    init(new_rows,new_cols,info_buffer,inboard);
    memcpy(info_buffer2,info_buffer,nrows*ncols);
//    for(int i = 0 ; i< ncols;i++){
//    for(int j = 0 ;j<ncols;j++){
////        if(outboard[i]==90){
//            printf("i %d, j %d , %d , %d\n",i,j,info_buffer2[i][j],info_buffer[i][j]);
////            break;
////        }
//    }
//    }
    
    int work_load = nrows/THREAD_NUM;
    int lock_num = (THREAD_NUM<<1);
    //create threads
    pthread_t workers[THREAD_NUM];
    pthread_mutex_t locks[lock_num];
    pthread_barrier_t worker_barrier;
    pthread_barrier_init(&worker_barrier, NULL , THREAD_NUM); //let main thread do the boundary job?
    
    //init lock
    for(int i=0;i< lock_num; ++i){
        pthread_mutex_init(&locks[i],NULL);
    }
    //init workload
    work works[THREAD_NUM]; // need  to add padding to avoid false sharing
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
    
    
    //init thread
    for(int i=0; i< THREAD_NUM; ++i){
        pthread_create(&workers[i],NULL,parallel_game_of_life_new,&works[i]);
    }
    for(int i=0; i< THREAD_NUM; ++i){
        pthread_join(workers[i],NULL);
    }
    
//    sequential_game_of_life_new ( outboard, new_rows, new_cols,info_buffer,info_buffer2 ,gens_max );
//    for(int i = 0 ;i<ncols*nrows;i++){
//        if(outboard[i]==90){
//            printf("i %d, j %d , %d\n",i/ncols,i%ncols,outboard[i]);
//            break;
//        }
//    }
    return outboard;//sequential_game_of_life_new ( outboard, new_rows, new_cols,info_buffer,info_buffer2 ,gens_max );
  
}



void init(int nrows, int ncols, char info_buffer[nrows][ncols], char* inboard ){
    
    for(int i =0  ;i<STATUS_NUM; i++){
        char old_status = i>>4;
        char new_status = (((i&0b01111)|old_status) ==3);
        char update = new_status^old_status;
        status_map[i].state = new_status? 1: -1;
        status_map[i].update = update;
    }
    
    
//    const int LDA = ncols;
#define BOARD( __board, __i, __j )  (__board[(__i)*ncols + (__j)])   

    
    for (int i = 0; i < nrows; i++)
    {
        for (int j = 0; j < ncols; j++)
        {
            const int inorth = mod (i-1, nrows); // for i = 1  , i==0 seperately loop to avoid bounding issue , separte thread? no sepearte thread just first check and another loop if found
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
            
//            info_buffer[i][j].state = BOARD (inboard, i, j) ;//alivep (neighbor_count, BOARD (inboard, i, j));
//            BOARD(outboard, i, j) = alivep (neighbor_count, BOARD (inboard, i, j)); //return ((x)|state)==3
//            printf("state: %d\n",state);
//            printf("state: %d\n",neighbor_count-(state<<4));
//            printf("state: %d\n",info_buffer[i][j].neighbour_count);
//            exit(-1);
        }
    }
    
    
    
//    memcpy(&info_buffer[0][1],&info_buffer[nrows-2][1],ncols-2);
//    memcpy(&info_buffer[nrows-1][1],&info_buffer[1][1],ncols-2);
    
//     memset(&info_buffer[0][1],0,ncols-2);
//    memset(&info_buffer[nrows-1][1],0,ncols-2);
    
//    for(int i = 1 ;i <ncols-1; i++){
//        info_buffer[0][i].neighbour_count =  0;
//        info_buffer[nrows-1][i].neighbour_count =  0;
//    }
//    
//    for(int i = 1 ;i <nrows-1; i++){
////        info_buffer[i][0] =  info_buffer[i][ncols-2];
////        info_buffer[i][ncols-1] =  info_buffer[i][1];
//        info_buffer[i][0].neighbour_count =  0;
//        info_buffer[i][ncols-1].neighbour_count =  0;
//    }
    
}




#define SWAP_BUFFER(buffer1,buffer2) char (*temp)[ncols] = buffer1; buffer1 = buffer2; buffer2 = temp;



#define UPDATE( i,j,inorth,isouth ,jwest, jeast,buffer2,change) \
    buffer2[i][jwest] += change;\
    buffer2[i][jeast] += change;\
    buffer2[inorth][j] += change;\
    buffer2[isouth][j] += change;\
    buffer2[inorth][jwest] += change;\
    buffer2[isouth][jwest] += change;\
    buffer2[inorth][jeast] += change;\
    buffer2[isouth][jeast] += change;\
    buffer2[i][j] = buffer2[i][j] + (change<<4);\

//    buffer2[i][j].state = new_state

#define LOCK(l) pthread_mutex_lock(l)
#define UNLOCK(l) pthread_mutex_unlock(l)


char *sequential_game_of_life_new (char* outboard, 
        const int nrows,
        const int ncols,
        char info_buffer[nrows][ncols],
        char info_buffer2[nrows][ncols],
        const int gens_max)
{
    /* HINT: in the parallel decomposition, LDA may not be equal to
       nrows! */
//    const int LDA = nrows;
    int curgen, i, j;

    
    char (*buffer1)[ncols]= info_buffer;
    char (*buffer2)[ncols]= info_buffer2;
    
//    typedef struct coord{
//        short i;
//        short j;
//    } coord;
    
//    int size =  nrows*ncols;
//    coord update_list[size]; 
    
    
//    coord update_list[nrows][ncols];
//    coord update_list[nrows][ncols];
//    coord head;
//    
//    void insert(int i , int j){
//        coord temp = head;
//        if(update_list[i][j].i>-1){
//            update_list[i][j] = temp;
//        }
//        head.i = i;
//        head.j=j;
//        
//    }
    
//    void get_next(int i, int j, int* i2, int*j2){
//        *i2=update_list[i][j].i;
//        *j2=update_list[i][j].j;
//            
//        
//    }
    
    
//    char update_row[nrows];
//    char update_row2[nrows];
//    
//    char update_list[nrows];
//    char update_list2[nrows];
    
//    for(int i = 0;i<nrows;i++){
//        update_row[i]=1;
//    }
//    for(int i = 0;i<nrows;i++){
//        update_row2[i]=0;
//    }
//    memset(update_row2,0,nrows);
//    int size = 0;
//    char record[nrows][ncols]; //use a loook up table for 100 times latter ? fail for moving obj
    for (curgen = 0; curgen < gens_max; curgen++)
    {
        /* HINT: you'll be parallelizing these loop(s) by doing a
           geometric decomposition of the output */
//        size = 0;
//        head.i=0;
//        head.j=0;
        
        for (i = 1; i < nrows-1; i++)
        {
            
//            if(update_row[i]==0) //only 630 row is not changed? almost every row is changing every time
//              printf("update_row %d i:%d\n",update_row[i],i);
//            if(1){
                int inorth = i-1; //mod (i-1, nrows); // for i = 1  , i==0 seperately loop to avoid bounding issue , separte thread? no sepearte thread just first check and another loop if found
                int isouth = i+1;//mod (i+1, nrows);
                for (j = 1; j < ncols-1; j++)
                {

//                    char state = buffer1[i][j].state;
                    int info_key= buffer1[i][j];
                    status new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
                   
                    int update = new_status.update;

//                    printf("count %d\n",neighbour_count);
//                    printf("update %d\n",update);

//                     int inorth = i-1; //mod (i-1, nrows); // for i = 1  , i==0 seperately loop to avoid bounding issue , separte thread? no sepearte thread just first check and another loop if found
//                     int isouth = i+1;//mod (i+1, nrows);
                     int jwest = j-1;//mod (j-1, ncols);
                     int jeast = j+1;//mod (j+1, ncols);

                    if(update){
                       int new_state = new_status.state;
    //                     record[i][j]=update;
                       UPDATE(i,j,inorth,isouth,jwest,jeast,buffer2,new_state);
                      
    //                   update_list[size].i=i
    //                   update_list[size].j=j; //and neighbour into //remove same coord
    //                   insert(i,j);
    //                   ++size;
    //                   update_list[i][j] = 1; //and neighbour


                    }

                }
//                if(update_once){
////                    if(update_row2[i]==0)
////                     printf("update_row222 %d\n",update_row2[i]);
//                    update_row2[i-1]=update_once;
//                    update_row2[i]=update_once;
//                    update_row2[i+1]=update_once;
//                }
               
//            }
           
            //every 1000 iter check if mov obj exit, if not only need to consider flip obj
        }
//        memcpy(update_row,update_row2,nrows);
//        memset(update_row2,0,nrows);
//       


        update_hori_boundary(nrows,ncols,buffer1,buffer2); //0.11%
        update_verti_boundary(nrows,ncols,buffer1,buffer2); //0.79%
      
//        SWAP_BUFFER(buffer1,buffer2);
        memcpy(buffer1,buffer2,nrows*ncols);
//        for (i = 0; i < nrows; i++)
//        {
////            int il= i*ncols;
//            for (j = 0; j < ncols; j++)
//            {
//                if(record[i][j]){
//                    buffer1[i][j]=buffer2[i][j];
//                    record[i][j]=0;
//                }
//                
//
//            }
//
//        }
        
//        SWAP_BOARDS( outboard, inboard );

    }
//    int size_update=0;
//    int i = head.i ; int j =head.j;
//    while(size>0){
//        
//        char state = buffer1[i][j].state;
//        int neighbour_count= buffer1[i][j].neighbour_count;
//        char new_state = (char)((neighbour_count|state)==3); 
//        int update = state^new_state;
//        const int inorth = mod (i-1, nrows); 
//        const int isouth = mod (i+1, nrows);
//        const int jwest = mod (j-1, ncols);
//        const int jeast = mod (j+1, ncols);
//        if(update){
//           UPDATE(i,j,inorth,isouth,jwest,jeast,buffer2,new_state);
//           insert(i,j);
//           --size_update;
//        }
//        get_next(i,j,&i,&j);
//        
//        
//    }
//    size = size_update;
    
    
    
    /* 
     * We return the output board, so that we know which one contains
     * the final result (because we've been swapping boards around).
     * Just be careful when you free() the two boards, so that you don't
     * free the same one twice!!! 
     */
    
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

void memcpy2(void* dest, void* src, size_t size){
    memcpy(dest,src,size);
}


#define LOWBOUND(i,max) i<0?max-1:i
#define HIGHBOUND(i,max) i>=max?0:i
void  update_hori_boundary(int nrows,int ncols, char buffer1[nrows][ncols], char buffer2[nrows][ncols] ){
        for(int j = 0 ;j <ncols; j++){
            int i = 0;
            int info_key= buffer1[i][j];
            status new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
            int update = new_status.update;
           
            int inorth = nrows-1;//mod (i-1, nrows); 
            int isouth = 1;//mod (i+1, nrows);
            int jwest =  LOWBOUND (j-1, ncols);
            int jeast =  HIGHBOUND (j+1, ncols);
            if(update){
                int new_state =  new_status.state;
                UPDATE(i,j,inorth,isouth,jwest,jeast,buffer2,new_state);
            }
             
            i = nrows-1;
            info_key= buffer1[i][j];
            new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
            update = new_status.update;
            inorth = nrows-2;//mod (i-1, nrows); 
            isouth = 0;//mod (i+1, nrows);
            jwest =  LOWBOUND (j-1, ncols);
            jeast =  HIGHBOUND (j+1, ncols);
            if(update){
                int new_state =  new_status.state;
                UPDATE(i,j,inorth,isouth,jwest,jeast,buffer2,new_state);
            }
            
        }
}
void  update_upper_hori_boundary_parallel(int nrows,int ncols, char buffer1[nrows][ncols], char buffer2[nrows][ncols],pthread_mutex_t* lockself,pthread_mutex_t* lockother   ){
        for(int j = 0 ;j <ncols; j++){
            int i = 0;
            int info_key= buffer1[i][j];
            status new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
            int update = new_status.update;
           
            int inorth = nrows-1;//mod (i-1, nrows); 
            int isouth = 1;//mod (i+1, nrows);
            int jwest =  LOWBOUND (j-1, ncols);
            int jeast =  HIGHBOUND (j+1, ncols);
            if(update){
//                int new_state =  new_status.state;
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
                
                buffer2[isouth][j] += change;
                buffer2[isouth][jwest] += change;
                buffer2[isouth][jeast] += change;      
            }
            
        }
}

void  update_lower_hori_boundary_parallel(int nrows,int ncols, char buffer1[nrows][ncols], char buffer2[nrows][ncols],pthread_mutex_t* lockself,pthread_mutex_t* lockother   ){
        for(int j = 0 ;j <ncols; j++){
            int i = nrows-1;
            int info_key= buffer1[i][j];
            status new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
            int update = new_status.update;
           
            int inorth = nrows-2;//mod (i-1, nrows); 
            int isouth = 0;//mod (i+1, nrows);
            int jwest =  LOWBOUND (j-1, ncols);
            int jeast =  HIGHBOUND (j+1, ncols);
            if(update){
//                char new_state =  new_status.state;
                int change = new_status.state;
                
                LOCK(lockself);
                buffer2[i][jwest] += change;
                buffer2[i][jeast] += change;
                buffer2[i][j] = buffer2[i][j] + (change<<4);
                UNLOCK(lockself);
                
                buffer2[inorth][j] += change;
                buffer2[inorth][jeast] += change;
                buffer2[inorth][jwest] += change;
              
                LOCK(lockother);
                buffer2[isouth][j] += change;
                buffer2[isouth][jwest] += change;
                buffer2[isouth][jeast] += change;    
                UNLOCK(lockother);
            }
            
        }
}
void  update_row_parallel_upperself(int nrows,int ncols,int i,char buffer1[nrows][ncols], char buffer2[nrows][ncols], pthread_mutex_t* lock ){
    int j_end=ncols-1;
    
      //leff end
    int j = 0;
    int inorth = i-1;//mod (i-1, nrows); 
    int isouth = i+1;//mod (i+1, nrows);
    int jwest =  j_end;//LOWBOUND (j-1, ncols);
    int jeast =  1;//HIGHBOUND (j+1, ncols);
    int info_key= buffer1[i][j];
    status new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
    int update = new_status.update;
    if(update){
//            char new_state =  new_status.state;
            int change = new_status.state;
            buffer2[i][jwest] += change;
            buffer2[i][jeast] += change;
//            buffer2[i][j] = buffer2[i][j] + (change<<4);
            LOCK(lock);
            buffer2[inorth][j] += change;
            buffer2[inorth][jeast] += change;
            buffer2[inorth][jwest] += change;
            UNLOCK(lock);
            buffer2[isouth][j] += change;
            buffer2[isouth][jwest] += change;
            buffer2[isouth][jeast] += change;
            
            buffer2[i][j] = buffer2[i][j] + (change<<4);

    }

    
    for(int j = 1 ;j <j_end; j++){
        int info_key= buffer1[i][j];
        status new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
        int update = new_status.update;

//        int inorth = i-1;//mod (i-1, nrows); 
//        int isouth = i+1;//mod (i+1, nrows);
        int jwest =  j-1;//LOWBOUND (j-1, ncols);
        int jeast =  j+1;//HIGHBOUND (j+1, ncols);
        if(update){
//            char new_state =  new_status.state;
            int change = new_status.state;
            buffer2[i][jwest] += change;
            buffer2[i][jeast] += change;
            buffer2[i][j] = buffer2[i][j] + (change<<4);
            LOCK(lock);
            buffer2[inorth][j] += change;
            buffer2[inorth][jeast] += change;
            buffer2[inorth][jwest] += change;
            UNLOCK(lock);
            buffer2[isouth][j] += change;
            buffer2[isouth][jwest] += change;
            buffer2[isouth][jeast] += change;


        }

    }
    
     //right end
    j = j_end;
    jwest =  j_end-1;//LOWBOUND (j-1, ncols);
    jeast =  0;//HIGHBOUND (j+1, ncols);
    info_key= buffer1[i][j];
    new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
    update = new_status.update;
    if(update){
//            char new_state =  new_status.state;
            int change = new_status.state;
            buffer2[i][jwest] += change;
            buffer2[i][jeast] += change;
            buffer2[i][j] = buffer2[i][j] + (change<<4);
            LOCK(lock);
            buffer2[inorth][j] += change;
            buffer2[inorth][jeast] += change;
            buffer2[inorth][jwest] += change;
            UNLOCK(lock);
            buffer2[isouth][j] += change;
            buffer2[isouth][jwest] += change;
            buffer2[isouth][jeast] += change;


    }
    
}
void  update_row_parallel_upperother(int nrows,int ncols,int i,char buffer1[nrows][ncols], char buffer2[nrows][ncols], pthread_mutex_t* lockself,pthread_mutex_t* lockother ){
    int j_end=ncols-1;
    
    //leff end
    int j = 0;
    int inorth = i-1;//mod (i-1, nrows); 
    int isouth = i+1;//mod (i+1, nrows);
    int jwest =  j_end;//LOWBOUND (j-1, ncols);
    int jeast =  1;//HIGHBOUND (j+1, ncols);
    int info_key= buffer1[i][j];
    status new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
    int update = new_status.update;
    if(update){
//            char new_state =  new_status.state;
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

            buffer2[isouth][j] += change;
            buffer2[isouth][jwest] += change;
            buffer2[isouth][jeast] += change;      
    }
    
    for(int j = 1 ;j <j_end; j++){
        int info_key= buffer1[i][j];
        status new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
        int update = new_status.update;

//        int inorth = i-1;//mod (i-1, nrows); 
//        int isouth = 1+1;//mod (i+1, nrows);
        int jwest =  j-1;//LOWBOUND (j-1, ncols);
        int jeast =  j+1;//HIGHBOUND (j+1, ncols);
        if(update){
//            char new_state =  new_status.state;
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

            buffer2[isouth][j] += change;
            buffer2[isouth][jwest] += change;
            buffer2[isouth][jeast] += change;      

        }

    }
    
    //right end
    j = j_end;

    jwest =  j_end-1;//LOWBOUND (j-1, ncols);
    jeast =  0;//HIGHBOUND (j+1, ncols);
    info_key= buffer1[i][j];
    new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
     update = new_status.update;
    if(update){
//          char new_state =  new_status.state;
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

          buffer2[isouth][j] += change;
          buffer2[isouth][jwest] += change;
          buffer2[isouth][jeast] += change;      

    }
    
}
void  update_row_parallel_lowerself(int nrows,int ncols,int i,char buffer1[nrows][ncols], char buffer2[nrows][ncols], pthread_mutex_t* lock ){
    int j_end=ncols-1;
    
    
    //leff end
    int j = 0;
    int inorth = i-1;//mod (i-1, nrows); 
    int isouth = i+1;//mod (i+1, nrows);
    int jwest =  j_end;//LOWBOUND (j-1, ncols);
    int jeast =  1;//HIGHBOUND (j+1, ncols);
    int info_key= buffer1[i][j];
    status new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
    int update = new_status.update;
    if(update){
//            char new_state =  new_status.state;
            int change = new_status.state;
            buffer2[i][jwest] += change;
            buffer2[i][jeast] += change;
            buffer2[i][j] = buffer2[i][j] + (change<<4);

            buffer2[inorth][j] += change;
            buffer2[inorth][jeast] += change;
            buffer2[inorth][jwest] += change;
            LOCK(lock);
            buffer2[isouth][j] += change;
            buffer2[isouth][jwest] += change;
            buffer2[isouth][jeast] += change;
            UNLOCK(lock);
 
    }
    
    for(int j = 1 ;j <j_end; j++){
        int info_key= buffer1[i][j];
        status new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
        int update = new_status.update;

//        int inorth = i-1;//mod (i-1, nrows); 
//        int isouth = 1+1;//mod (i+1, nrows);
        int jwest =  j-1;//LOWBOUND (j-1, ncols);
        int jeast =  j+1;//HIGHBOUND (j+1, ncols);
        if(update){
//            char new_state =  new_status.state;
            int change = new_status.state;
            buffer2[i][jwest] += change;
            buffer2[i][jeast] += change;
            buffer2[i][j] = buffer2[i][j] + (change<<4);

            buffer2[inorth][j] += change;
            buffer2[inorth][jeast] += change;
            buffer2[inorth][jwest] += change;
            LOCK(lock);
            buffer2[isouth][j] += change;
            buffer2[isouth][jwest] += change;
            buffer2[isouth][jeast] += change;
            UNLOCK(lock);

        }

    }
    
    //right end
     j = j_end;
   
     jwest =  j_end-1;//LOWBOUND (j-1, ncols);
     jeast =  0;//HIGHBOUND (j+1, ncols);
     info_key= buffer1[i][j];
     new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
     update = new_status.update;
    if(update){
//            char new_state =  new_status.state;
            int change =new_status.state;
            buffer2[i][jwest] += change;
            buffer2[i][jeast] += change;
            buffer2[i][j] = buffer2[i][j] + (change<<4);

            buffer2[inorth][j] += change;
            buffer2[inorth][jeast] += change;
            buffer2[inorth][jwest] += change;
            LOCK(lock);
            buffer2[isouth][j] += change;
            buffer2[isouth][jwest] += change;
            buffer2[isouth][jeast] += change;
            UNLOCK(lock);

    }
        
    
    
}
void  update_row_parallel_lowerother(int nrows,int ncols,int i,char buffer1[nrows][ncols], char buffer2[nrows][ncols], pthread_mutex_t* lockself,pthread_mutex_t* lockother ){
    int j_end=ncols-1;
    
    //leff end
    int j = 0;
    int inorth = i-1;//mod (i-1, nrows); 
    int isouth = i+1;//mod (i+1, nrows);
    int jwest =  j_end;//LOWBOUND (j-1, ncols);
    int jeast =  1;//HIGHBOUND (j+1, ncols);
    int info_key= buffer1[i][j];
    status new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
    int update = new_status.update;
    if(update){
//            char new_state =  new_status.state;
            int change = new_status.state;
            LOCK(lockself);
            buffer2[i][jwest] += change;
            buffer2[i][jeast] += change;
            buffer2[i][j] = buffer2[i][j] + (change<<4);
            UNLOCK(lockself);


            buffer2[inorth][j] += change;
            buffer2[inorth][jeast] += change;
            buffer2[inorth][jwest] += change;

            LOCK(lockother);
            buffer2[isouth][j] += change;
            buffer2[isouth][jwest] += change;
            buffer2[isouth][jeast] += change;      
            UNLOCK(lockother);

    }
            
    for(int j = 1 ;j <j_end; j++){
        int info_key= buffer1[i][j];
        status new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
        int update = new_status.update;

//            int inorth = i-1;//mod (i-1, nrows); 
//            int isouth = 1+1;//mod (i+1, nrows);
        int jwest =  j-1;//LOWBOUND (j-1, ncols);
        int jeast =  j+1;//HIGHBOUND (j+1, ncols);
        if(update){
//            char new_state =  new_status.state;
            int change = new_status.state;// new_state? 1:-1;

            LOCK(lockself);
            buffer2[i][jwest] += change;
            buffer2[i][jeast] += change;
            buffer2[i][j] = buffer2[i][j] + (change<<4);
            UNLOCK(lockself);


            buffer2[inorth][j] += change;
            buffer2[inorth][jeast] += change;
            buffer2[inorth][jwest] += change;

            LOCK(lockother);
            buffer2[isouth][j] += change;
            buffer2[isouth][jwest] += change;
            buffer2[isouth][jeast] += change;      
            UNLOCK(lockother);
        }

    }
    
     //right end
     j = j_end;
   
     jwest =  j_end-1;//LOWBOUND (j-1, ncols);
     jeast =  0;//HIGHBOUND (j+1, ncols);
     info_key= buffer1[i][j];
     new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
     update = new_status.update;
     if(update){
//            char new_state =  new_status.state;
            int change = new_status.state;//new_state? 1:-1;

            LOCK(lockself);
            buffer2[i][jwest] += change;
            buffer2[i][jeast] += change;
            buffer2[i][j] = buffer2[i][j] + (change<<4);
            UNLOCK(lockself);


            buffer2[inorth][j] += change;
            buffer2[inorth][jeast] += change;
            buffer2[inorth][jwest] += change;

            LOCK(lockother);
            buffer2[isouth][j] += change;
            buffer2[isouth][jwest] += change;
            buffer2[isouth][jeast] += change;      
            UNLOCK(lockother);
    }
}

void  update_verti_boundary_parallel(int nrows,int ncols,int iinit,int iend, char buffer1[nrows][ncols], char buffer2[nrows][ncols] ){
    int j_end = ncols-1;
    for(int i = iinit ;i < iend ; i++){
        int j = 0;
        int info_key= buffer1[i][j];
        status new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
        int update = new_status.update;

        int inorth = i-1;//mod (i-1, nrows);
        int isouth = i+1;//mod (i+1, nrows);
        int jwest =  ncols-1;//mod (j-1, ncols);
        int jeast =  1;//mod (j+1, ncols);

        if(update){
            int new_state =  new_status.state;
            UPDATE(i,j,inorth,isouth,jwest,jeast,buffer2,new_state);
        }

        j = j_end;
        info_key= buffer1[i][j];
        new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
        update = new_status.update;

        inorth = i-1;//mod (i-1, nrows);
        isouth = i+1;//mod (i+1, nrows);
        jwest =  ncols-2; //mod (j-1, ncols);
        jeast =  0;//mod (j+1, ncols);

        if(update){
            int new_state =  new_status.state;
            UPDATE(i,j,inorth,isouth,jwest,jeast,buffer2,new_state);
        }

    }
    
}

void  update_verti_boundary(int nrows,int ncols, char buffer1[nrows][ncols], char buffer2[nrows][ncols] ){
    for(int i = 1 ;i <nrows-1; i++){
        int j = 0;
        int info_key= buffer1[i][j];
        status new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
        int update = new_status.update;

        int inorth = i-1;//mod (i-1, nrows);
        int isouth = i+1;//mod (i+1, nrows);
        int jwest =  ncols-1;//mod (j-1, ncols);
        int jeast =  1;//mod (j+1, ncols);

        if(update){
            int new_state =  new_status.state;
            UPDATE(i,j,inorth,isouth,jwest,jeast,buffer2,new_state);
        }

        j = ncols-1;
        info_key= buffer1[i][j];
        new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
        update = new_status.update;

        inorth = i-1;//mod (i-1, nrows);
        isouth = i+1;//mod (i+1, nrows);
        jwest =  ncols-2; //mod (j-1, ncols);
        jeast =  0;//mod (j+1, ncols);

        if(update){
            int new_state =  new_status.state;
            UPDATE(i,j,inorth,isouth,jwest,jeast,buffer2,new_state);
        }

    }
}



//
//#define SWAP_BOARDS( b1, b2 )  do { \
//  char* temp = b1; \
//  b1 = b2; \
//  b2 = temp; \
//} while(0)
//
//#define BOARD( __board, __i, __j )  (__board[(__i)*LDA + (__j)])
//
//    char*
//sequential_game_of_life2 (char* outboard, 
//        char* inboard,
//        const int nrows,
//        const int ncols,
//        const int gens_max)
//{
//    /* HINT: in the parallel decomposition, LDA may not be equal to
//       nrows! */
//    const int LDA = nrows;
//    int curgen, i, j;
//
//    for (curgen = 0; curgen < gens_max; curgen++)
//    {
//        /* HINT: you'll be parallelizing these loop(s) by doing a
//           geometric decomposition of the output */
//        for (i = 0; i < nrows; i++)
//        {
//            for (j = 0; j < ncols; j++)
//            {
//                const int inorth = mod (i-1, nrows); // for i = 1  , i==0 seperately loop to avoid bounding issue , separte thread? no sepearte thread just first check and another loop if found
//                const int isouth = mod (i+1, nrows);
//                const int jwest = mod (j-1, ncols);
//                const int jeast = mod (j+1, ncols);
//
//                const char neighbor_count = 
//                    BOARD (inboard, inorth, jwest) + 
//                    BOARD (inboard, inorth, j) + 
//                    BOARD (inboard, inorth, jeast) + 
//                    BOARD (inboard, i, jwest) +
//                    BOARD (inboard, i, jeast) + 
//                    BOARD (inboard, isouth, jwest) +
//                    BOARD (inboard, isouth, j) + 
//                    BOARD (inboard, isouth, jeast);
//
//                BOARD(outboard, i, j) = alivep (neighbor_count, BOARD (inboard, i, j)); //return ((x)|state)==3
//
//            }
//        }
//        SWAP_BOARDS( outboard, inboard );
//
//    }
//    /* 
//     * We return the output board, so that we know which one contains
//     * the final result (because we've been swapping boards around).
//     * Just be careful when you free() the two boards, so that you don't
//     * free the same one twice!!! 
//     */
//    return inboard;
//}

//pthread_mutex_t glock = PTHREAD_MUTEX_INITIALIZER ;
//#define lockg LOCK(&glock)
//#define unlockg UNLOCK(&glock)
void *parallel_game_of_life_new (void* _param_)
{
    /* HINT: in the parallel decomposition, LDA may not be equal to
       nrows! */
//    const int LDA = nrows;
    
//    clock_t start = clock();
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
    
//    printf("%d\n",offset);
    
//    printf("%d, %d, %d, %d, %d, %d\n",upperi1,upperi2,loweri2,loweri1, i_init, i_end);
    
    for (curgen = 0; curgen < gens_max; curgen++)
    {
        /* HINT: you'll be parallelizing these loop(s) by doing a
           geometric decomposition of the output */
//        size = 0;
//        head.i=0;
//        head.j=0;
//        lockg;
//        int cccc =0 ;
        if(upper_bound){
//             printf("%d\n",offset);
            update_upper_hori_boundary_parallel(nrows,ncols,buffer1,buffer2,upper_lock_self,upper_lock_other); 
        }else{
//             printf("%d %d\n",upperi1, pthread_self());
            update_row_parallel_upperother(nrows,ncols,upperi1,buffer1,buffer2,upper_lock_self,upper_lock_other);
//            update_row_parallel_upperself(nrows,ncols,upperi1,buffer1,buffer2,upper_lock_self);
        }
        
        update_row_parallel_upperself(nrows,ncols,upperi2,buffer1,buffer2,upper_lock_self);
//        printf("%d, %d, %d, %d\n",upperi1,upperi2,loweri2,loweri1);
//        unlockg;
        
        
        for (int i = i_init; i < i_end; i++)
        {
            
//            if(update_row[i]==0) //only 630 row is not changed? almost every row is changing every time
//              printf("update_row %d i:%d\n",update_row[i],i);
//            if(1){
            
                int inorth = i-1; //mod (i-1, nrows); // for i = 1  , i==0 seperately loop to avoid bounding issue , separte thread? no sepearte thread just first check and another loop if found
                int isouth = i+1;//mod (i+1, nrows);
                for (int j = 1; j < ncols-1; j++)
                {

//                    char state = buffer1[i][j].state;
                    int info_key= buffer1[i][j];
                    status new_status =  status_map[info_key]; //(char)((neighbour_count|state)==3); 
                   
                    int update = new_status.update;

//                    printf("count %d\n",neighbour_count);
//                    printf("update %d\n",update);

                   
                     int jwest = j-1;//mod (j-1, ncols);
                     int jeast = j+1;//mod (j+1, ncols);

                    if(update){
                       int new_state = new_status.state;
    //                     record[i][j]=update;
                       UPDATE(i,j,inorth,isouth,jwest,jeast,buffer2,new_state);
                      
//                       cccc++;

                    }

                }

        }
        
//        lockg;
        update_row_parallel_lowerself(nrows,ncols,loweri2,buffer1,buffer2,lower_lock_self);
        if(lower_bound){
//             printf("%d\n",offset);
            update_lower_hori_boundary_parallel(nrows,ncols,buffer1,buffer2,lower_lock_self,lower_lock_other); 
        }else{
//            printf("%d %d\n",loweri1, pthread_self());
            update_row_parallel_lowerother(nrows,ncols,loweri1,buffer1,buffer2,lower_lock_self,lower_lock_other);
//            update_row_parallel_lowerself(nrows,ncols,loweri1,buffer1,buffer2,lower_lock_self);
        }
        

//        update_hori_boundary(nrows,ncols,buffer1,buffer2); //0.11%
//        update_verti_boundary(nrows,ncols,buffer1,buffer2); //0.79%
        update_verti_boundary_parallel(nrows,ncols,i_init,i_end,buffer1,buffer2);
//        SWAP_BUFFER(buffer1,buffer2);
        
//        unlockg;
//        printf("barreir111 %d\n",pthread_self());
        pthread_barrier_wait(barrier);
        
//        printf("count %d\n",cccc);
//        lockg;
        memcpy(buffer1+offset,buffer2+offset,amount);
//        unlockg;
        pthread_barrier_wait(barrier);
        
//        if(memcmp(buffer1,buffer2,nrows*ncols))
//            printf("wrong\n");
    }
//    lockg;
//    pthread_barrier_wait(barrier);
//     printf("%d, %d, %d, %d, %d, %d\n",upperi1,upperi2,loweri2,loweri1, i_init, i_end);
    for (int i = upperi1; i <= loweri1; i++)
    {
        int il= (i)*(ncols);
//        int accm = 0;
        for (int j = 0; j < ncols; j++)
        {
            outboard[il+j]=(buffer2[i][j]>16);
//            if(i<5 && j<100)
//            printf("%d %d %d %d\n",i,j,buffer2[i][j],outboard[il+j]);
//            accm +=(buffer2[i][j]>16);
        }
//        printf("%d %d\n",i,accm);
            
    }
    

//clock_t end = clock();
//! Get thread clock Id
//pthread_getcpuclockid(pthread_self(), &threadClockId);
//! Using thread clock Id get the clock time
//clock_gettime(threadClockId, &currTime);


//printf("thread id %lu spent %lf\n",pthread_self(),(((double)(end-start))/CLOCKS_PER_SEC));
//printf("%lu\n",sizeof(pthread_t));    


//    unlockg;
//    pthread_exit(NULL);
//    return outboard;
}