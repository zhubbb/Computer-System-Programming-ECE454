/*
 * This implementation replicates the implicit list implementation
 * provided in the textbook
 * "Computer Systems - A Programmer's Perspective"
 * Blocks are never coalesced or reused.
 * Realloc is implemented directly using mm_malloc and mm_free.
 *
 * NOTE TO STUDENTS: Replace this header comment with your own header
 * comment that gives a high level description of your solution.
 */
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>
#include <string.h>
#include <stdint.h>

#include "mm.h"
#include "memlib.h"

/*********************************************************
 * NOTE TO STUDENTS: Before you do anything else, please
 * provide your team information in the following struct.
 ********************************************************/
team_t team = {
    /* Team name */
    "Tomato",
    /* First member's full name */
    "Xian Zhang",
    /* First member's email address */
    "xian.zhang@mail.utoronto.ca",
    /* Second member's full name (leave blank if none) */
    "Qili Lu",
    /* Second member's email address (leave blank if none) */
    "hzqili@gmail.com"
};

/*************************************************************************
 * Basic Constants and Macros
 * You are not required to use these macros but may find them helpful.
*************************************************************************/
#define WSIZE       sizeof(void *)            /* word size (bytes) */
#define DSIZE       (WSIZE << 1)            /* doubleword size (bytes) */
#define CHUNKSIZE   ((1<<7)+DSIZE)      /* initial heap size (bytes) */ //need to predict the best chunk size e.g binary 1<<9 gives better

#define MAX(x,y) ((x) > (y)?(x) :(y))

/* Pack a size and allocated bit into a word */
#define PACK(size, alloc) ((size) | (alloc))

/* Read and write a word at address p */
#define GET(p)          (*(uintptr_t *)(p))
#define PUT(p,val)      (*(uintptr_t *)(p) = (val))

/* Read the size and allocated fields from address p */
#define GET_SIZE(p)     (GET(p) & ~(DSIZE - 1)) // 16bytes alignment so ignore the last 4 digits
#define GET_ALLOC(p)    (GET(p) & 0x1)

/* Given block ptr bp, compute address of its header and footer */
#define HDRP(bp)        ((char *)(bp) - WSIZE)
#define FTRP(bp)        ((char *)(bp) + GET_SIZE(HDRP(bp)) - DSIZE)

/* Given block ptr bp, compute address of next and previous blocks */
#define NEXT_BLKP(bp) ((char *)(bp) + GET_SIZE(((char *)(bp) - WSIZE)))
#define PREV_BLKP(bp) ((char *)(bp) - GET_SIZE(((char *)(bp) - DSIZE)))

//define the segregated list size
#define LIST_NUM 14
//the size of overhead from link, header, footer
#define MIN_BLK_SIZE (4*WSIZE)

#define GET_NEXT_LINK(bp) (void*)(*(uintptr_t *)(bp))
#define SET_NEXT_LINK(bp, next) PUT(bp,(uintptr_t)next);

#define GET_PREV_LINK(bp) (void*)(*(uintptr_t *)(bp+WSIZE))
#define SET_PREV_LINK(bp, prev) PUT(bp+WSIZE,(uintptr_t)prev);

#define INIT_LINK(bp,prev,next) SET_NEXT_LINK(bp, next); SET_PREV_LINK(bp, prev)

#define SET_HEADER(bp,bsize,alloc) PUT(HDRP(bp), PACK(bsize, alloc))
#define SET_FOOTER(bp,bsize,alloc) PUT(FTRP(bp), PACK(bsize, alloc))
#define INIT_HEADER_FOOTER(bp,bsize,alloc) SET_HEADER(bp,bsize,alloc); SET_FOOTER(bp,bsize,alloc)


//#define ALLOCATED_SIZE(size)  ((((size-1)>>1)<<1) +2)*DSIZE
#define ALLOCATED_SIZE(size) DSIZE * ((size + (DSIZE<<1) -1)/ DSIZE)

#define DROP_FROM_LIST(bp)  void* pl=(void*)GET_PREV_LINK(bp); void* nl=(void*)GET_NEXT_LINK(bp);\
                            SET_NEXT_LINK(pl,nl); SET_PREV_LINK(nl,pl);\


#define INSERT_LIST(listhead,bp) void* current = GET_NEXT_LINK(listhead); \
                                void* previous=listhead;\
                                while(current!=listhead&&bp>current){\
                                    previous=current;\
                                    current=(void *)GET_NEXT_LINK(current);\
                                }\
                                INIT_LINK(bp,previous,current);\
                                SET_NEXT_LINK(previous,bp);\
                                SET_PREV_LINK(current,bp);\

#define TRUNCATE_BLOCK(bp, asize) size_t bsize=GET_SIZE(HDRP(bp)); size_t rsize = bsize-asize;\
                                if(rsize>=MIN_BLK_SIZE) {\
                                    INIT_HEADER_FOOTER(bp,asize,1);\
                                    void* bp2 = bp+asize;\
                                    INIT_HEADER_FOOTER(bp2,rsize,0);\
                                    INSERT_LIST(free_lists[find_list_index(rsize)],bp2);\
                                }else{\
                                    INIT_HEADER_FOOTER(bp,bsize,1);\
                                }\




                               



void* heap_listp = NULL;
void* heap_endp = NULL;

void* free_lists[LIST_NUM]; //size are 0-8  ... 2^(i+1)

int m=0,r=0,f =0;
void inline drop_from_list(void* bp){
    
    void* pl=GET_PREV_LINK(bp); void* nl=GET_NEXT_LINK(bp);
    SET_NEXT_LINK(pl,nl); 
    SET_PREV_LINK(nl,pl);
}

//LIFO strategy
void inline insert_list(void * listhead, void* bp){
    void* current = listhead;//GET_NEXT_LINK(listhead); 
    void* previous= GET_PREV_LINK(listhead);//listhead;
//    while(current!=listhead&&bp>current){
//        previous=current;
//        current=GET_NEXT_LINK(current);
//    }
    INIT_LINK(bp,previous,current);
    SET_NEXT_LINK(previous,bp);
    SET_PREV_LINK(current,bp);
    
}

int inline find_list_index(size_t size){
    //printf("size: %d\n",size);
    int min = MIN_BLK_SIZE*2;
    if(size){
        int i=0; 
        size=size;
        int limit = LIST_NUM-1;
        while ( (size>min) && (i < limit)){
            ++i; size = size>>1; 
        }
        
      
        //printf("iss %d\n",i);
        return i;
    }
    
    return 0;
    
}
void inline truncate_block(void* bp, size_t asize){
    size_t bsize=GET_SIZE(HDRP(bp)); size_t rsize = bsize-asize;
    if(rsize>=MIN_BLK_SIZE) {
        INIT_HEADER_FOOTER(bp,asize,1);
        void* bp2 = bp+asize;
        INIT_HEADER_FOOTER(bp2,rsize,0);
        insert_list(free_lists[find_list_index(rsize)],bp2);
    }else{
        INIT_HEADER_FOOTER(bp,bsize,1);
    }
    
}

/**********************************************************
 * mm_init
 * Initialize the heap, including "allocation" of the
 * prologue and epilogue
 **********************************************************/
 int mm_init(void)
 {
     
    if ((heap_listp = mem_sbrk(LIST_NUM*MIN_BLK_SIZE+4*WSIZE)) == (void *)-1)
          return -1;

    //initialize empty block for each free list. save the null pointer check
    for(int i=0;i<LIST_NUM;i++){ 
        void* bp = heap_listp+i*MIN_BLK_SIZE+WSIZE;
        INIT_LINK(bp,bp,bp);//circular link to avoid null pointer check
        INIT_HEADER_FOOTER(bp,0,0); 
        free_lists[i]=bp;
    }
    heap_listp=heap_listp+ LIST_NUM*MIN_BLK_SIZE;
    PUT(heap_listp, 0);                         // alignment padding
    PUT(heap_listp + (1 * WSIZE), PACK(DSIZE, 1));   // prologue header
    PUT(heap_listp + (2 * WSIZE), PACK(DSIZE, 1));   // prologue footer
    PUT(heap_listp + (3 * WSIZE), PACK(0, 1));    // epilogue header
    heap_listp += DSIZE;
    heap_endp = heap_listp+DSIZE;
    //mm_check();
    return 0;
 }

/**********************************************************
 * coalesce
 * Covers the 4 cases discussed in the text:
 * - both neighbours are allocated
 * - the next block is available for coalescing
 * - the previous block is available for coalescing
 * - both neighbours are available for coalescing
 **********************************************************/
void *coalesce(void *bp)
{ //mm_check();
    void * next =NEXT_BLKP(bp);
    void * prev =PREV_BLKP(bp);
    size_t prev_alloc = GET_ALLOC(HDRP(prev));
    size_t next_alloc = GET_ALLOC(HDRP(next));
    size_t size = GET_SIZE(HDRP(bp));

    
    if(!prev_alloc){
        drop_from_list(prev);
        size += GET_SIZE(HDRP(prev));
        bp = prev;
    }
    if(!next_alloc){
        drop_from_list(next);
        size += GET_SIZE(HDRP(next));
    }
    PUT(HDRP(bp), PACK(size, 0));
    PUT(FTRP(bp), PACK(size, 0));
    return bp;
    
//    if (prev_alloc && next_alloc) {       /* Case 1 */
//        return bp;
//    }
//
//    else if (prev_alloc && !next_alloc) { /* Case 2 */
//        drop_from_list(next);
//        size += GET_SIZE(HDRP(next));
//        PUT(HDRP(bp), PACK(size, 0));
//        PUT(FTRP(bp), PACK(size, 0));
//        //printf("case 1 %zx\n",next);
//        return (bp);
//    }
//
//    else if (!prev_alloc && next_alloc) { /* Case 3 */
//        drop_from_list(prev);
//        size += GET_SIZE(HDRP(prev));
//        PUT(FTRP(bp), PACK(size, 0));
//        PUT(HDRP(prev), PACK(size, 0));
//       
//        return (prev);
//    }
//
//    else {            /* Case 4 */
//        drop_from_list(next);
//        drop_from_list(prev);
//        size += GET_SIZE(HDRP(prev))  +
//            GET_SIZE(FTRP(next))  ;
//        PUT(HDRP(prev), PACK(size,0));
//        PUT(FTRP(next), PACK(size,0));
//        
//        //printf("case 4 %zx\n",next);
//        return (prev);
//    }
}

/**********************************************************
 * extend_heap
 * Extend the heap by "words" words, maintaining alignment
 * requirements of course. Free the former epilogue block
 * and reallocate its new header
 **********************************************************/
void *extend_heap(size_t size)
{//mm_check();
    char *bp;
//    char* prev = PREV_BLKP(heap_endp);
//    
//    if(!GET_ALLOC(HDRP(prev))){
//        size = size - GET_SIZE(HDRP(prev));
//    }
    
    
    //size_t size;

    /* Allocate an even number of words to maintain alignments */
    //size =  words * WSIZE; 
   // //printf("size %d\n",(int)size);
//    //printf("%d\n",ALLOCATED_SIZE(words));
//    //assert(size==ALLOCATED_SIZE(words));
    if ( (bp = mem_sbrk(size)) == (void *)-1 )
        return NULL;

    
    heap_endp = bp+size;//HDRP(NEXT_BLKP(bp));
    
    /* Initialize free block header/footer and the epilogue header */
    PUT(HDRP(bp), PACK(size, 0));                // free block header
    PUT(FTRP(bp), PACK(size, 0));                // free block footer
    
    PUT(HDRP(heap_endp), PACK(0, 1));        // new epilogue header
    
 
    /* Coalesce if the previous block was free */ //coalesce
    return (bp); // only extend necesay block by chekcing the previous free block
}


/**********************************************************
 * find_fit
 * Traverse the heap searching for a block to fit asize
 * Return NULL if no free blocks can handle that size
 * Assumed that asize is aligned
 **********************************************************/
void * find_fit(size_t asize)
{
//    size_t best = -1;
//    void* btp =NULL;
    int i = find_list_index(asize);
    ////printf("aszie %zu\n",(asize));
   
    ////printf("f13 %x\n",free_lists[13]);
    
    void* bp;
    for(;i<LIST_NUM;i++){
        void* listhead= free_lists[i];
        // //printf("%x\n",(listhead));
  //  //printf("%x\n",GET_NEXT_LINK(listhead));
        for(bp = GET_NEXT_LINK(listhead); bp!= listhead; bp = GET_NEXT_LINK(bp)){
            ////printf("%d\n",GET_SIZE(HDRP(bp)));
            size_t csize= GET_SIZE(HDRP(bp));
            if (  asize <= csize )
            {
//                size_t diff = csize-asize;
//                if(diff<best || best <0){
//                    best = diff;
//                    btp = bp;
//                }
                //assert(GET_SIZE(HDRP(bp))>0);
                return bp;
            }
        }
        //if(btp!=NULL) return btp;
    }
    return NULL;
    
    
//    void *bp;
//    for (bp = heap_listp; GET_SIZE(HDRP(bp)) > 0; bp = NEXT_BLKP(bp))
//    {
//        if (!GET_ALLOC(HDRP(bp)) && (asize <= GET_SIZE(HDRP(bp))))
//        {
//            return bp;
//        }
//    }
//    return NULL;
}

/**********************************************************
 * place
 * Mark the block as allocated
 **********************************************************/
void place(void* bp, size_t asize)
{
  /* Get the current block size */
  size_t bsize = GET_SIZE(HDRP(bp));

  PUT(HDRP(bp), PACK(bsize, 1)); //can use an or to simplify it, should use asize and set the rest to free block, if rest >=2
  PUT(FTRP(bp), PACK(bsize, 1));
}

/**********************************************************
 * mm_free
 * Free the block and coalesce with neighbouring blocks
 **********************************************************/
void mm_free(void *bp)
{//mm_check();
//printf("free %zx\n",bp);
//f++;
//printf("freee  :.%d\n",r);
    if(bp == NULL){
      return;
    }
    size_t size = GET_SIZE(HDRP(bp));
    PUT(HDRP(bp), PACK(size,0));
    PUT(FTRP(bp), PACK(size,0));
    bp=coalesce(bp);
    void* list = free_lists[find_list_index(GET_SIZE(HDRP(bp)))];
    insert_list(list,bp);
}


/**********************************************************
 * mm_malloc
 * Allocate a block of size bytes.
 * The type of search is determined by find_fit
 * The decision of splitting the block, or not is determined
 *   in place(..)
 * If no block satisfies the request, the heap is extended
 **********************************************************/
void *mm_malloc(size_t size)
{
//    printf("malloc.%zu\n",size);
//    m++;
//    printf("malloc :.%d\n",m);
    size_t asize; /* adjusted block size */
    size_t extendsize; /* amount to extend heap if no fit */
    char * bp;
	

    /* Ignore spurious requests */
    if (size == 0)
        return NULL;

    /* Adjust block size to include overhead and alignment reqs. */
//    if (size <= DSIZE)
//        asize = 2 * DSIZE;
//    else
    asize = DSIZE * ((size + (DSIZE) + (DSIZE-1))/ DSIZE);//ALLOCATED_SIZE((size/WSIZE))*WSIZE;
   //  //printf("size %d\n",size);
    ////printf("%d\n",asize);
   // //assert(!((asize/WSIZE) & 1));
//     //printf("%d\n",DSIZE * ((size + (DSIZE) + (DSIZE-1))/ DSIZE));
//    //assert(asize==DSIZE * ((size + (DSIZE) + (DSIZE-1))/ DSIZE));
    /* Search the free list for a fit */
    if ((bp = find_fit(asize)) != NULL) {
        //place(bp, asize);
        drop_from_list(bp);
        
//        void* pl=(void*)GET_PREV_LIN  K(bp); void* nl=(void*)GET_NEXT_LINK(bp);
//        
//        SET_NEXT_LINK(pl,nl); SET_PREV_LINK(nl,pl);
        //place(bp, asize);
        truncate_block(bp,asize);
        //mm_check();
//        size_t bsize=GET_SIZE(HDRP(bp)); size_t rsize = bsize-asize;
//                                if(rsize>=MIN_BLK_SIZE) {
//                                    INIT_HEADER_FOOTER(bp,asize,1);
//                                    void* bp2 = NEXT_BLKP(bp);
//                                    INIT_HEADER_FOOTER(bp2,rsize,0);
//                                    //assert(GET_SIZE(HDRP(bp2)) == rsize);
//                                    //assert(GET_SIZE(FTRP(bp2)) == rsize);
//                                
//                                    INSERT_LIST(find_list(rsize),bp2);
//                                }else{
//                                    place(bp, asize);
//                                }
	
	//printf("malloc %d %zx\n",asize,bp);
        
        return bp;
    }

    /* No fit found. Get more memory and place the block */
    extendsize =  MAX(asize, CHUNKSIZE);
    //extendsize = extendsize == CHUNKSIZE? CHUNKSIZE+DSIZE : asize;
    if ((bp = extend_heap(extendsize)) == NULL)
        return NULL;
    //place(bp, asize);
    truncate_block(bp,asize); //coalse need to add to free list
    //assert(GET_SIZE(HDRP(bp))==asize);
	//assert(GET_SIZE(FTRP(bp))==asize);
    //mm_check();
//printf("extend malloc %d %d %zx\n",asize,GET_SIZE(HDRP(bp)),bp);
    return bp;

}

/**********************************************************
 * mm_realloc
 * Implemented simply in terms of mm_malloc and mm_free
 *********************************************************/
void *mm_realloc(void *ptr, size_t size)
{
    //r++;
   // printf("realloc.%zu\n",size);
    // printf("realloc :.%d\n",r);
    //mm_check();
    /* If size == 0 then this is just free, and we return NULL. */
    if(size == 0){
      mm_free(ptr);
      return NULL;
    }
    /* If oldptr is NULL, then this is just malloc. */
    if (ptr == NULL)
      return (mm_malloc(size));
    
    size_t asize = ALLOCATED_SIZE(size); //calculated the re-allocated size
    size_t bsize = GET_SIZE(HDRP(ptr)); // get the current block size
     //when the re-allocated size is smaller
    if(asize<=bsize){
        truncate_block(ptr,asize);
        return ptr;
    }else{ //when the re-allocated size is bigger
        void* next = NEXT_BLKP(ptr);
        void* next_header =  (void*)HDRP(next);
        void* next_next =  NEXT_BLKP(next);
        void* next_next_header =  (void*)HDRP(next_next);
        
        if(GET_ALLOC(next_header)&&GET_SIZE(next_header)==0 ){ //epilogue header
            void* bp= extend_heap(asize-bsize);
            if(bp==NULL){
                return NULL;
            }
            INIT_HEADER_FOOTER(ptr,bsize+GET_SIZE(HDRP(bp)),0);
            truncate_block(ptr,asize);
            return ptr;
            
        }else if(!GET_ALLOC(next_header)){
            size_t nsize = GET_SIZE(next_header);
            size_t msize=bsize+nsize;
            if(msize>=asize){// there is enough space from the next blk
                drop_from_list(next);
                INIT_HEADER_FOOTER(ptr,msize,0);
                truncate_block(ptr,asize);
            }else if(GET_ALLOC(next_next_header)&& GET_SIZE(next_next_header)==0){ // epilogue header is after the immediate free blk
                    void* bp= extend_heap(asize-msize);
                    if(bp==NULL){
                        return NULL;
                    }
                    INIT_HEADER_FOOTER(ptr,msize+GET_SIZE(HDRP(bp)),0);
                    truncate_block(ptr,asize);
            }
            return ptr;
        }else{//have to find a new location
                void *oldptr = ptr;
                void *newptr;
                size_t copySize;
                
                
                newptr = mm_malloc(size);
                if (newptr == NULL)
                  return NULL;
            
                
                /* Copy the old data. */
                copySize = bsize;
                copySize =size < copySize? size:copySize; //can free first but need to store data somewhere
                memcpy(newptr, oldptr, copySize);
                mm_free(oldptr);
                return newptr;
            
        }
    }
    return NULL;

//    void *oldptr = ptr;
//    void *newptr;
//    size_t copySize;
//
//    newptr = mm_malloc(size);
//    if (newptr == NULL)
//      return NULL;
//
//    
//    /* Copy the old data. */
//    copySize = GET_SIZE(HDRP(oldptr));
//    if (size < copySize)
//      copySize = size;
//    memcpy(newptr, oldptr, copySize);
//    mm_free(oldptr);
    
}

/**********************************************************
 * //mm_check
 * Check the consistency of the memory heap
 * Return nonzero if the heap is consistant.
 *********************************************************/
int mm_check(void){

    for(int i = 0; i< LIST_NUM; i++){
        void* head = free_lists[i];
        void* current;
        void* previous = head;
        for(current= GET_NEXT_LINK(head); current != head ; current = GET_NEXT_LINK(current) ){
            if(GET_ALLOC(HDRP(current))){
                printf("Free List number %d contains an allocated block.\n",i);
                //exit(-1);
                return 0;
            }
            if(GET_PREV_LINK(current)!=previous){
                printf("Free List number %d contains a wrong backward link.\n",i);
                //exit(-1);
                return 0;
            }
            if((current)==NULL){
                printf("Free List number %d contains a null link.\n",i);
                //exit(-1);
                return 0;
            }
            previous = current;
        }
        
    }
  return 1;
}
