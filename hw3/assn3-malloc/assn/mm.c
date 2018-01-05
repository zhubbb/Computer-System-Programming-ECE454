/*
 * The solution implement a segregated explicit free list with first fit strategy and some careful adjustment of some numerical value based on the trace statistic.
 * All memory blocks have a size that is multiple of 16 bytes.
 * Headers and footer consist of a size and the last bit is used to indicate the allocation status of this block.
 * Allocated blocks consist of a header and a footer and a payload
 * Free blocks consist of the a header and a footer and two pointers for the next and previous free block.
 * All free blocks are immediately coalesced. 
 * There is only a single heap and it never shrinks.
 * The heap starts with list header followed by a prologue and epilogue.
 * Split policy ensure that the lower part of the block becomes the allocated part.
 * Any new free block is inserted to the end of the corresponding segregated list, with the believe that new free block usually has larger address.
 * Search starts from finding the correct list given the size. Each list stores the free blocks with the same size range.  
 * The first free block find with enough size will be selected. The search will continue to traverse next list with bigger size range until the last list.
 * If no suitable free block can be found then heap will be extended with the given calculated allocated size.
 * 
 * 
 * Allocated Block Structure:
 * +----------------+----------+----------------+
 * |Header(8 bytes) | Payload  | Footer(8 bytes)|
 * +----------------+----------+----------------+
 * 
 * Free Block Structure:
 * +----------------+----------------------+--------------------------+------+----------------+
 * |Header(8 bytes) | Next Pointer(8 bytes)| Previous Pointer(8 bytes)| .... | Footer(8 bytes)|
 * +----------------+----------------------+--------------------------+------+----------------+
 * 
 * 
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
    "XXXXTOMATOXXXX",
    /* First member's full name */
    "Xian Zhang",
    /* First member's email address */
    "xian.zhang@mail.utoronto.ca",
    /* Second member's full name (leave blank if none) */
    "Qili Lu",
    /* Second member's email address (leave blank if none) */
    "qili.lu@mail.utoronto.ca"
};

/*************************************************************************
 * Basic Constants and Macros
 * You are not required to use these macros but may find them helpful.
*************************************************************************/
#define WSIZE       sizeof(void *)          /* word size (bytes) */
#define DSIZE       (WSIZE << 1)            /* doubleword size (bytes) */

//The extra DSZIE ensure that the despite header/footer the actual block has binary size 
#define CHUNKSIZE   ((1<<7)+DSIZE)          /* initial heap size (bytes). */

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

//Given the pointer to a free block, find the pointer to next free block
#define GET_NEXT_LINK(bp) (void*)(*(uintptr_t *)(bp))
//Set the pointer to next free block
#define SET_NEXT_LINK(bp, next) PUT(bp,(uintptr_t)next);

//Given the pointer to a free block, find the pointer to previous free block
#define GET_PREV_LINK(bp) (void*)(*(uintptr_t *)(bp+WSIZE))
//Set the pointer to previous free block
#define SET_PREV_LINK(bp, prev) PUT(bp+WSIZE,(uintptr_t)prev);

/* macro to initialize meta-data information*/
#define INIT_LINK(bp,prev,next) SET_NEXT_LINK(bp, next); SET_PREV_LINK(bp, prev)
#define SET_HEADER(bp,bsize,alloc) PUT(HDRP(bp), PACK(bsize, alloc))
#define SET_FOOTER(bp,bsize,alloc) PUT(FTRP(bp), PACK(bsize, alloc))
#define INIT_HEADER_FOOTER(bp,bsize,alloc) SET_HEADER(bp,bsize,alloc); SET_FOOTER(bp,bsize,alloc)


//Given a size, return the actual allocated amount based on alignment and meta-data
#define ALLOCATED_SIZE(size) DSIZE * ((size + (DSIZE<<1) -1)/ DSIZE)







int mm_check();
                             
//The header of implicit heap list 
void* heap_listp = NULL;
//The headers of segregated lists
void* free_lists[LIST_NUM]; //each list with index i has its size bucket (in words), 0-8 , 9-16, 17-32, ... , 2^(i+2)+1-2^(i+3)


/*
 * Helper function to remove a free block from its list.
 * Input: a pointer to the free block
 */
void inline drop_from_list(void* bp){
    void* pl=GET_PREV_LINK(bp); void* nl=GET_NEXT_LINK(bp);
    SET_NEXT_LINK(pl,nl); 
    SET_PREV_LINK(nl,pl);
}

/*
 * Helper function to insert a free block to a given list.
 * Free block is inserted to the end of the free list so that older block is likely to be found based on first fit
 * Input: a pointer to a list head, a pointer to the free block
 */
void inline insert_list(void * listhead, void* bp){
    void* current = listhead;
    void* previous= GET_PREV_LINK(listhead);

    INIT_LINK(bp,previous,current);
    SET_NEXT_LINK(previous,bp);
    SET_PREV_LINK(current,bp);
    
}
/*
 * Helper function to find a the index of the segregated list a free block belongs to.
 * Input: size of the free block
 */
int inline find_list_index(size_t size){
    int min = MIN_BLK_SIZE<<1;
    if(size){
        int i=0; 
        size=size;
        int limit = LIST_NUM-1;
        while ( (size>min) && (i < limit)){
            ++i; min = min<<1; 
        }
        return i;
    }
    return 0;
    
}
/*
 * Helper function to split a free block if there is enough size.
 * Lower part is allocated and the another part is inserted to free block list.
 * Input: pointer of the free block, the allocation size used to split the block
 */
void inline truncate_block(void* bp, size_t asize){
    size_t bsize=GET_SIZE(HDRP(bp)); size_t rsize = bsize-asize;
    // check if there is enough space to split the block
    if(rsize>=MIN_BLK_SIZE) {
        void* bp2 = bp+asize;
        // lower part is allocated
        INIT_HEADER_FOOTER(bp,asize,1);
        // higher part is set as free block.
        INIT_HEADER_FOOTER(bp2,rsize,0);
        //the free part is inserted back to the list
        insert_list(free_lists[find_list_index(rsize)],bp2); 
    }else{
        // if no enough size to split then the whole block will be allocated
        INIT_HEADER_FOOTER(bp,bsize,1);
    }
    
}

/**********************************************************
 * mm_init
 * Initialize the heap, including prologue and epilogue
 * Plus the header block for each free list preceding the prologue
 **********************************************************/
 int mm_init(void)
 {
     
    if ((heap_listp = mem_sbrk(LIST_NUM*MIN_BLK_SIZE+4*WSIZE)) == (void *)-1)
          return -1;

    //initialize empty block as the first block for each free list. Save the null pointer check
    for(int i=0;i<LIST_NUM;i++){ 
        //calculate the pointer for each header block
        void* bp = heap_listp+i*MIN_BLK_SIZE+WSIZE;
        
        //Use a circular link to connect the first block back to itself to avoid null pointer check
        INIT_LINK(bp,bp,bp);
        INIT_HEADER_FOOTER(bp,0,0); // the size of header block is 0
        free_lists[i]=bp;// assigned the header block to the header of list
    }
    
    heap_listp=heap_listp+ LIST_NUM*MIN_BLK_SIZE;
    PUT(heap_listp, 0);                         // alignment padding
    PUT(heap_listp + (1 * WSIZE), PACK(DSIZE, 1));   // prologue header
    PUT(heap_listp + (2 * WSIZE), PACK(DSIZE, 1));   // prologue footer
    PUT(heap_listp + (3 * WSIZE), PACK(0, 1));    // epilogue header
    heap_listp += DSIZE;

    //mm_check();
    return 0;
 }

/**********************************************************
 * coalesce
 * it is used to immediately coalesce the neighbour free blocks 
 * It can handle all possible cases:
 * - both neighbours are allocated
 * - the next block is available for coalescing
 * - the previous block is available for coalescing
 * - both neighbours are available for coalescing
 * Input: pointer to a free block
 **********************************************************/
void *coalesce(void *bp)
{
    void * next =NEXT_BLKP(bp);
    void * prev =PREV_BLKP(bp);
    size_t prev_alloc = GET_ALLOC(HDRP(prev));
    size_t next_alloc = GET_ALLOC(HDRP(next));
    size_t size = GET_SIZE(HDRP(bp));
    
    if(!prev_alloc){
        //if the previous block is free then we will take it out from the free list and coalesce it
        drop_from_list(prev);
        //recalculate the new size after coalesce a free block
        size += GET_SIZE(HDRP(prev));
        //set the pointer to the previous block.
        bp = prev; 
    }
    if(!next_alloc){
        //same of next block
        drop_from_list(next);
        size += GET_SIZE(HDRP(next));
    }
    
    //set the meta-data information for the new free block after coalescing
    PUT(HDRP(bp), PACK(size, 0));
    PUT(FTRP(bp), PACK(size, 0));
    return bp;
   
}

/**********************************************************
 * extend_heap
 * Extend the heap by size(bytes), assume size is aligned
 * Input: extended size
 **********************************************************/
void *extend_heap(size_t size)
{
    char *bp;
    if ( (bp = mem_sbrk(size)) == (void *)-1 )
        return NULL;
    /* Initialize free block header/footer and the epilogue header */
    PUT(HDRP(bp), PACK(size, 0));                // free block header
    PUT(FTRP(bp), PACK(size, 0));                // free block footer
    PUT(HDRP(bp+size), PACK(0, 1));             // new epilogue header
    
    return bp;
}


/**********************************************************
 * find_fit
 * Traverse the segregated lists searching for a block to fit asize
 * First fit strategy is used to speed up.
 * Any list has smaller size bucket than asize is ignored.
 * The first list to search is the list with size range just cover the asize.
 * Return NULL if no free blocks can handle that size
 * Assumed that asize is aligned
 * Input: required size that is aligned
 **********************************************************/
void * find_fit(size_t asize)
{
    //find the index of the first list to search
    int i = find_list_index(asize);
    void* bp;
    //keep looking for larger index if the first list has no suitable free block
    for(;i<LIST_NUM;i++){
        void* listhead= free_lists[i];
        //traverse through the list to find a suitable free block
        for(bp = GET_NEXT_LINK(listhead); bp!= listhead; bp = GET_NEXT_LINK(bp)){
            size_t csize= GET_SIZE(HDRP(bp));
            if (  asize <= csize )
            {             
                return bp;
            }
        }
    }
    //return null if not a single free block with enough size can be found.
    return NULL;
}


/**********************************************************
 * mm_free
 * Free the block and coalesce with neighbouring blocks
 * Input: pointer to an allocated block
 **********************************************************/
void mm_free(void *bp)
{
    if(bp == NULL){
      return;
    }
    size_t size = GET_SIZE(HDRP(bp));
    // set meta data
    PUT(HDRP(bp), PACK(size,0)); 
    PUT(FTRP(bp), PACK(size,0));
    // immediate coalesce after free.
    bp=coalesce(bp);
    void* list = free_lists[find_list_index(GET_SIZE(HDRP(bp)))];
    insert_list(list,bp);
}


/**********************************************************
 * mm_malloc
 * Allocate a block of size bytes.The search is first fit. 
 * If block is larger, we truncate it to minimize internal fragmentation
 * If no block satisfies the request, the heap is extended
 * Input: size we want to malloc, not necessary to be aligned
 **********************************************************/
void *mm_malloc(size_t size)
{
    size_t asize; /* adjusted block size */
    size_t extendsize; /* amount to extend heap if no fit */
    char * bp;
	

    /* Ignore spurious requests */
    if (size == 0)
        return NULL;

    /* Adjust block size to include overhead and alignment reqs. */
    asize =ALLOCATED_SIZE(size);

    /* Search the free list for a fit */
    if ((bp = find_fit(asize)) != NULL) {
        //remove the block from the free list
        drop_from_list(bp);
        //if the block is larger, then truncate will split it
        truncate_block(bp,asize);
        
        return bp;
    }

    /* No fit found. Get more memory and place the block */
    extendsize =  MAX(asize, CHUNKSIZE);
    if ((bp = extend_heap(extendsize)) == NULL)
        return NULL;
    truncate_block(bp,asize); 
    return bp;

}

/**********************************************************
 * mm_realloc
 * Implemented to minimize the chance of assigning new pointer,
 * to avoid memcpy
 * Input: the original pointer for the memory block and the new size
 *********************************************************/
void *mm_realloc(void *ptr, size_t size)
{
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
     //when the re-allocated size is smaller, we can use the old pointer
    if(asize<=bsize){
        truncate_block(ptr,asize);
        return ptr;
    }else{ //when the re-allocated size is bigger, we will check if there is free block after it
        void* next = NEXT_BLKP(ptr);
        void* next_header =  (void*)HDRP(next);
        void* next_next =  NEXT_BLKP(next);
        void* next_next_header =  (void*)HDRP(next_next);
        //if the next block is epilogue block, we can extend the heap
        if(GET_ALLOC(next_header)&&GET_SIZE(next_header)==0 ){ 
            void* bp= extend_heap(asize-bsize);
            if(bp==NULL){
                return NULL;
            }
            INIT_HEADER_FOOTER(ptr,bsize+GET_SIZE(HDRP(bp)),0);
            truncate_block(ptr,asize);
            return ptr;
        // if the next block is free, then we might use it
        }else if(!GET_ALLOC(next_header)){
            size_t nsize = GET_SIZE(next_header);
            size_t msize=bsize+nsize;
            if(msize>=asize){// if the next block is free, and there is enough space from the next blk
                drop_from_list(next);
                INIT_HEADER_FOOTER(ptr,msize,0);
                truncate_block(ptr,asize);
            // else if the immediate next free block is not big enough, but there is epilogue block after it, we can extend the heap
            }else if(GET_ALLOC(next_next_header)&& GET_SIZE(next_next_header)==0){ 
                    void* bp= extend_heap(asize-msize);
                    if(bp==NULL){
                        return NULL;
                    }
                    INIT_HEADER_FOOTER(ptr,msize+GET_SIZE(HDRP(bp)),0);
                    truncate_block(ptr,asize);
            }
            return ptr;
        }else{//else, have to find a new location
                void *oldptr = ptr;
                void *newptr;
                size_t copySize;
                
                newptr = mm_malloc(size);
                if (newptr == NULL)
                  return NULL;

                /* Copy the old data. */
                copySize = bsize;
                copySize =size < copySize? size:copySize; 
                memcpy(newptr, oldptr, copySize);
                mm_free(oldptr);
                return newptr;
            
        }
    }
    return NULL;
    
}

/**********************************************************
 * mm_check
 * Check the consistency of the memory heap
 * This function check the consistency of the freelist and heap memory
 * To be specific, we check the following:
 * -if every block in the free list marked as free
 * -if every free block actually in the free list
 * -if the pointers in the free list point to valid free blocks
 * -if there is any contiguous free blocks escaping coalesce
 * -if every free block is inside free list
 * -if two allocated block overlap
 * Return nonzero if the heap is consistant.
 *********************************************************/
int mm_check(void){

    for(int i = 0; i< LIST_NUM; i++){
        void* head = free_lists[i];
        void* current;
        void* previous = head;
        for(current= GET_NEXT_LINK(head); current != head ; current = GET_NEXT_LINK(current) ){
            //check if every block in the free list marked as free
            if(GET_ALLOC(HDRP(current))){
                printf("Free List number %d contains an allocated block.\n",i);
                return 0;
            }
            /*The following 4 check if the pointers in the free list point to valid free blocks*/
            if(GET_PREV_LINK(current)!=previous){
                printf("Free List number %d contains a wrong backward link.\n",i);
                return 0;
            }
            if((current)==NULL){
                printf("Free List number %d contains a null link.\n",i);
                return 0;
            }
            if(0 != GET_SIZE(HDRP(current)) % DSIZE)
            {
                printf("Free block is not aligned\n");
                return 0;
            }
            if(*(uint32_t*)HDRP(current) != *(uint32_t*)FTRP(current))
            {
                printf("Header does not match footer\n");
                return 0;
            }
            previous = current;
        }
        
    }
    void* curr_block = heap_listp;
    //caculate the end address of the heap
    void* heap_end = HDRP(free_lists[0]) + mem_heapsize();
    int is_prev_free = 0 ;
    int found_in_free=0;
    char* prev_allocated_footer_address=NULL;
    
    while(GET_SIZE(HDRP(curr_block)))
    {
        //this check pointers in a heap block point to valid heap addresses
        if(curr_block>heap_end)
        {
            printf("Block pointer is not valid\n");
            return 0;
        }    
        if(!GET_ALLOC(HDRP(curr_block))){
            //check are there any contiguous free blocks that somehow escaped coalescing
            if(is_prev_free)
            {
                printf("There is two continuous free block.\n");
                return 0;
            }
            void* head = free_lists[find_list_index(GET_SIZE(HDRP(curr_block)))];
            void* curr_free_blk = GET_NEXT_LINK(head);
            //This check if every free block is inside free list
            //Notice: This part is slow
            while(curr_free_blk!=head)
            {
                if(curr_free_blk == curr_block)
                {
                    found_in_free = 1;
                    break;
                }
                curr_free_blk = GET_NEXT_LINK(curr_free_blk);
            }
            if(!found_in_free)
            {
                printf("Free block not found in free list\n");
                return 0;
            }
            found_in_free=0;
            is_prev_free = 1;
        }
        else
        {
             //check if two allocated block overlap
            if(HDRP(curr_block) < prev_allocated_footer_address)
            {
                printf("Two allocated block overlapped\n");
                return 0;
            }
            is_prev_free = 0;
            prev_allocated_footer_address = FTRP(curr_block);
        }
        
        curr_block = NEXT_BLKP(curr_block);
        
    }
  return 1;
}
