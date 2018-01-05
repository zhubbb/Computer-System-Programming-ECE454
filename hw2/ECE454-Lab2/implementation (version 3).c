#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include "utilities.h"  // DO NOT REMOVE this line
#include "implementation_reference.h"   // DO NOT REMOVE this line

/***********************************************************************************************************************
 * @param buffer_frame - pointer pointing to a buffer storing the imported 24-bit bitmap image
 * @param width - width of the imported 24-bit bitmap image
 * @param height - height of the imported 24-bit bitmap image
 * @param offset - number of pixels to shift the object in bitmap image up
 * @return - pointer pointing a buffer storing a modified 24-bit bitmap image
 * Note1: White pixels RGB(255,255,255) are treated as background. Object in the image refers to non-white pixels.
 * Note2: You can assume the object will never be moved off the screen
 **********************************************************************************************************************/

struct _three_byte_{
//    unsigned int a : 24;
    char a,b,c;
};
struct info{
    short x,y;
    struct _three_byte_ color;
    
};
//struct _sixty3_byte_{
//    unsigned int h;
//    unsigned long int a,b,c,d,e,f,g;
//    struct _three_byte_ i;
//    
//};


#define mul3(x) ((x<<1)+x)
unsigned char* copyFrame2(unsigned char* src, unsigned char* dst, unsigned width, unsigned height) ;
unsigned char *processMoveUp(unsigned char *buffer_frame, unsigned width, unsigned height, int offset) {
    // allocate memory for temporary image buffer
    //unsigned char *rendered_frame = allocateFrame(width, height);
//return processMoveUpReference(buffer_frame, width, height, offset);
     //store shifted pixels to temporary buffer
//    
    int width3=mul3(width);
    int end_offset= (height - offset)* width3;
    int end= height*width3;
    int margin= offset* width3;
    
    for (int i = 0, i2 = margin; i < end ; i=i+3 , i2=i2+3) {
       
            
           
            
            buffer_frame[i] = buffer_frame[i2];
            buffer_frame[i + 1] = buffer_frame[i2 + 1];
            buffer_frame[i + 2] = buffer_frame[i2 + 2];
        
    }

    // fill left over pixels with white pixels
    for (int i = end_offset ; i < end ; i=i+3) {
         
            buffer_frame[i] = 255;
            buffer_frame[i + 1] = 255;
            buffer_frame[i + 2] = 255;
        
    }

    // copy the temporary buffer back to original frame buffer
   // buffer_frame = copyFrame(rendered_frame, buffer_frame, width, height);

    // free temporary image buffer
    //deallocateFrame(rendered_frame);

    // return a pointer to the updated image buffer
    return buffer_frame;
}

/***********************************************************************************************************************
 * @param buffer_frame - pointer pointing to a buffer storing the imported 24-bit bitmap image
 * @param width - width of the imported 24-bit bitmap image
 * @param height - height of the imported 24-bit bitmap image
 * @param offset - number of pixels to shift the object in bitmap image left
 * @return - pointer pointing a buffer storing a modified 24-bit bitmap image
 * Note1: White pixels RGB(255,255,255) are treated as background. Object in the image refers to non-white pixels.
 * Note2: You can assume the object will never be moved off the screen
 **********************************************************************************************************************/
unsigned char *processMoveRight(unsigned char *buffer_frame, unsigned width, unsigned height, int offset) {
      // allocate memory for temporary image buffer
    unsigned char *rendered_frame = allocateFrame(width, height);
    int position_rendered_row;
    int position_rendered_frame;
    int position_buffer_frame;
    // store shifted pixels to temporary buffer
    for (int row = 0; row < height; ++row) {
        position_rendered_row = row * width * 3;
        for (int column = offset; column < width; ++column) {
            position_rendered_frame = position_rendered_row + column * 3;
            position_buffer_frame = position_rendered_row + (column - offset) * 3;
            rendered_frame[position_rendered_frame] = buffer_frame[position_buffer_frame];
            rendered_frame[position_rendered_frame + 1] = buffer_frame[position_buffer_frame + 1];
            rendered_frame[position_rendered_frame + 2] = buffer_frame[position_buffer_frame + 2];
        }
    }

    // fill left over pixels with white pixels
    for (int row = 0; row < height; ++row) {
        int rowwidth3=row * width * 3 ;
        for (int column = 0; column < offset; ++column) {
            position_rendered_frame = rowwidth3 + column * 3;
            rendered_frame[position_rendered_frame] = 255;
            rendered_frame[position_rendered_frame + 1] = 255;
            rendered_frame[position_rendered_frame + 2] = 255;
        }
    }

    // copy the temporary buffer back to original frame buffer
    buffer_frame = copyFrame(rendered_frame, buffer_frame, width, height);

    // free temporary image buffer
    deallocateFrame(rendered_frame);

    // return a pointer to the updated image buffer
    return buffer_frame;
}

/***********************************************************************************************************************
 * @param buffer_frame - pointer pointing to a buffer storing the imported 24-bit bitmap image
 * @param width - width of the imported 24-bit bitmap image
 * @param height - height of the imported 24-bit bitmap image
 * @param offset - number of pixels to shift the object in bitmap image up
 * @return - pointer pointing a buffer storing a modified 24-bit bitmap image
 * Note1: White pixels RGB(255,255,255) are treated as background. Object in the image refers to non-white pixels.
 * Note2: You can assume the object will never be moved off the screen
 **********************************************************************************************************************/
unsigned char *processMoveDown(unsigned char *buffer_frame, unsigned width, unsigned height, int offset) {
    int position_rendered_row;
    int position_buffer_row;
    int position_rendered_frame;
    int position_buffer_frame;
    for (int row = height-1; row >= offset; --row) {
        position_rendered_row = row * width * 3;
        position_buffer_row = (row - offset) * width * 3;
        for (int column = 0; column < width; ++column) {
            position_rendered_frame = position_rendered_row + column * 3;
            position_buffer_frame = position_buffer_row + column * 3;
            buffer_frame[position_rendered_frame] = buffer_frame[position_buffer_frame];
            buffer_frame[position_rendered_frame + 1] = buffer_frame[position_buffer_frame + 1];
            buffer_frame[position_rendered_frame + 2] = buffer_frame[position_buffer_frame + 2];
        }
    }

    // fill left over pixels with white pixels
    for (int row = 0; row < offset; ++row) {
        for (int column = 0; column < width; ++column) {
            position_rendered_frame = row * width * 3 + column * 3;
            buffer_frame[position_rendered_frame] = 255;
            buffer_frame[position_rendered_frame + 1] = 255;
            buffer_frame[position_rendered_frame + 2] = 255;
        }
    }

    // return a pointer to the updated image buffer
    return buffer_frame;
}

/***********************************************************************************************************************
 * @param buffer_frame - pointer pointing to a buffer storing the imported 24-bit bitmap image
 * @param width - width of the imported 24-bit bitmap image
 * @param height - height of the imported 24-bit bitmap image
 * @param offset - number of pixels to shift the object in bitmap image right
 * @return - pointer pointing a buffer storing a modified 24-bit bitmap image
 * Note1: White pixels RGB(255,255,255) are treated as background. Object in the image refers to non-white pixels.
 * Note2: You can assume the object will never be moved off the screen
 **********************************************************************************************************************/
unsigned char *processMoveLeft(unsigned char *buffer_frame, unsigned width, unsigned height, int offset) {
      int position_buffer_row;
    int position_rendered_frame;
    int position_buffer_frame;
    // store shifted pixels to temporary buffer
    for (int row = 0; row < height; ++row) {
        position_buffer_row = row * width * 3;
        for (int column = 0; column < (width - offset); ++column) {
            position_rendered_frame = position_buffer_row + column * 3;
            position_buffer_frame = position_buffer_row + (column + offset) * 3;
            
            buffer_frame[position_rendered_frame] = buffer_frame[position_buffer_frame];
            buffer_frame[position_rendered_frame + 1] = buffer_frame[position_buffer_frame + 1];
            buffer_frame[position_rendered_frame + 2] = buffer_frame[position_buffer_frame + 2];
        }
    }

    // fill left over pixels with white pixels
    for (int row = 0; row < height; ++row) {
        for (int column = width - offset; column < width; ++column) {
            position_rendered_frame = row * width * 3 + column * 3;
            buffer_frame[position_rendered_frame] = 255;
            buffer_frame[position_rendered_frame + 1] = 255;
            buffer_frame[position_rendered_frame + 2] = 255;
        }
    }

    // return a pointer to the updated image buffer
    return buffer_frame;
}

/***********************************************************************************************************************
 * @param buffer_frame - pointer pointing to a buffer storing the imported 24-bit bitmap image
 * @param width - width of the imported 24-bit bitmap image
 * @param height - height of the imported 24-bit bitmap image
 * @param rotate_iteration - rotate object inside frame buffer clockwise by 90 degrees, <iteration> times
 * @return - pointer pointing a buffer storing a modified 24-bit bitmap image
 * Note: You can assume the frame will always be square and you will be rotating the entire image
 **********************************************************************************************************************/

#define rotate_90(i,j,w,i2,j2) i2=j;j2=(w-i-1)
#define rotate_180(i,j,w,i2,j2) i2=(w-i-1);j2=(w-j-1)
#define rotate_270(i,j,w,i2,j2) i2=(w-1-j),j2=i
#define rotate_90_mirror_x(i,j,w,i2,j2) i2=(w-j-1);j2=(w-i-1)
#define rotate_90_mirror_y(i,j,w,i2,j2) i2=j;j2=i
#define rotate_180_mirror_x(i,j,w,i2,j2) i2=i;j2=(w-j-1)
#define rotate_180_mirror_y(i,j,w,i2,j2) i2=(w-i-1);j2=j
#define rotate_270_mirror_x(i,j,w,i2,j2) i2=j;j2=i //90+my
#define rotate_270_mirror_y(i,j,w,i2,j2) i2=(w-j-1);j2=(w-i-1) //90+mx
#define mirror_x(i,j,w,i2,j2) i2=(w-i-1);j2=j
#define mirror_y(i,j,w,i2,j2) i2=i;j2=(w-j-1)



#define assign_index(i,j,w) (i*w+j)

#define block_size 21
#define not_bg(x,white) (memcmp(&x, &white, 3))


void processAll(unsigned char *buffer_frame, unsigned char* rendered_frame,struct info* info_array,int obj_size , unsigned width, unsigned height,
                               int x, int y,int rotate_iteration,int mirror_x, int mirror_y) {
    
    unsigned int white=  0xffffff;
//    unsigned char* rendered_frame = allocateFrame(width, height);
    
    memset(rendered_frame,white,(width * height * 3) * sizeof(char));
    
    struct _three_byte_* r = (struct _three_byte_*)rendered_frame;
    struct _three_byte_* b = (struct _three_byte_*)buffer_frame;
                         
//    printf("%d w,%d h",width,height);
    
    
    for(int i =0 ; i < obj_size; ++i){
        struct info inf = info_array[i];
         
        int v=inf.y;
        int h=inf.x;
// printf("%d x\n",x);
        
        int v1=v-y,h1=h+x;
        int v2=v1,h2=h1;
//        printf("%d,%d first\n",v2,h2);
        if(rotate_iteration){
            if(mirror_x){
                switch(rotate_iteration){
                    case 1: rotate_90_mirror_x(v1,h1,width,v2,h2);break;
                    case 2: rotate_180_mirror_x(v1,h1,width,v2,h2);break;
                    case 3: rotate_270_mirror_x(v1,h1,width,v2,h2);break;
                }
            }else if(mirror_y){
                switch(rotate_iteration){
                    case 1: rotate_90_mirror_y(v1,h1,width,v2,h2);break;
                    case 2: rotate_180_mirror_y(v1,h1,width,v2,h2);break;
                    case 3: rotate_270_mirror_y(v1,h1,width,v2,h2);break;
                }

            }else{
                switch(rotate_iteration){
                    case 1: rotate_90(v1,h1,width,v2,h2);break;
                    case 2: rotate_180(v1,h1,width,v2,h2);break;
                    case 3: rotate_270(v1,h1,width,v2,h2);break;
                }

            }

        }else if(mirror_x){
            mirror_x(v1,h1,width,v2,h2);
        }else if(mirror_y){
            mirror_y(v1,h1,width,v2,h2);
        }

//                        int d1= assign_index(v2,h2,width);
//                        int d2= assign_index(i,j,width);
//
//                        printf("%d,%d\n",v2,h2);
//                        printf("%d :c\n",inf.color);
       r[assign_index(v2,h2,width)]= inf.color;
               //b[assign_index(v,h,width)];
    }
    

//    for(int i = 0 ; i< height ; i= i + block_size){
//        for(int j = 0; j < width; j = j + block_size){
//            
//            int bound_i = i+block_size;
//            bound_i = bound_i > height ? height : bound_i;
//            int bound_j = j+block_size;
//            bound_j  =  bound_j > width ? width : bound_j;
////             printf(" lll %d bounid\n",bound_i);
//            for(int i2 = i ; i2< bound_i ; ++i2){
//                for(int j2 = j; j2 < bound_j; ++j2){
//                    //since it is guarantee that it is not off screen , we can directly identify the object and apply shift on it.
////                    printf("%d\n",b[assign_index(i2,j2,width)]);
////                    printf("%d;ttt\n",b[memcmp(&white,&b[assign_index(i2,j2,width)], sizeof(struct _three_byte_))]);
//                    
//                    if(not_bg(b[assign_index(i2,j2,width)],white)){
//                        //processing
//                        int v=i2-y;
//                        int h=j2+x;
//// printf("%d x\n",x);
//                        int v2=v,h2=h;
//                        if(rotate_iteration){
//                            if(mirror_x){
//                                switch(rotate_iteration){
//                                    case 1: rotate_90_mirror_x(v,h,width,v2,h2);break;
//                                    case 2: rotate_180_mirror_x(v,h,width,v2,h2);break;
//                                    case 3: rotate_270_mirror_x(v,h,width,v2,h2);break;
//                                }
//                            }else if(mirror_y){
//                                switch(rotate_iteration){
//                                    case 1: rotate_90_mirror_y(v,h,width,v2,h2);break;
//                                    case 2: rotate_180_mirror_y(v,h,width,v2,h2);break;
//                                    case 3: rotate_270_mirror_y(v,h,width,v2,h2);break;
//                                }
//
//                            }else{
//                                switch(rotate_iteration){
//                                    case 1: rotate_90(v,h,width,v2,h2);break;
//                                    case 2: rotate_180(v,h,width,v2,h2);break;
//                                    case 3: rotate_270(v,h,width,v2,h2);break;
//                                }
//                                
//                            }
//                            
//                        }else if(mirror_x){
//                            mirror_x(v,h,width,v2,h2);
//                        }else if(mirror_y){
//                            mirror_y(v,h,width,v2,h2);
//                        }
//                        
////                        int d1= assign_index(v2,h2,width);
////                        int d2= assign_index(i,j,width);
//                        
////                        printf("%d,%d\n",i2,j2);
//                       r[assign_index(v2,h2,width)]=b[assign_index(i2,j2,width)];
//                            
//                        
//                    }
//                    
//                }
//                
//            }
//
//            
//        }
//                
//    }
    
//    buffer_frame = copyFrame2(rendered_frame, buffer_frame, width, height);
    // free temporary image buffer
//    free(rendered_frame);
    
    
}



void processRotateCW(unsigned char *buffer_frame, unsigned width, unsigned height,
                               int rotate_iteration) {
    
    
//    return processRotateCWReference(buffer_frame, width, height, rotate_iteration);

    
    
      // allocate memory for temporary image buffer
    unsigned char *rendered_frame = NULL;
    if(rotate_iteration%4){
         rendered_frame = allocateFrame(width, height);
    }


    
    
    
//    int block_size= 21;
//    int width2=width<<1;
    int width3 = mul3(width);
//    int width4 = width<<2;
//    int width5 = width*5;
//    int width6 = width*6;
//    int width7 = width*7;
//    int width8 = width<<3;
//    int width9 = width*9;
//    int width10 = width*10;
//    int width11 = width*11;
//    int width12 = width*12;
//    int width13 = width*13;
//    int width14 = width*14;
//    int width15 = width*15;
//    int width16 = width*16;
    
    int p =0;
    int pr=0;
     struct _three_byte_* r = (struct _three_byte_*)rendered_frame;
    struct _three_byte_* b = (struct _three_byte_*)buffer_frame;
            
            
     struct _sixty3_byte_* r63 = (struct _sixty3_byte_*)   rendered_frame;
     struct _sixty3_byte_* b63 = (struct _sixty3_byte_*)   buffer_frame;
            
    switch(rotate_iteration%4){
    
        case 1://90 degree
            
           
            for(int h=height-1; h>=0 ; h= h-block_size){





                 int h_64=h-block_size+1;
                    h_64=h_64<0?0:h_64;

                for(int w=0;w<width; w= w+block_size){

                   // p=h*width3;
//                       p=h*width; 



                    int w_64=w+block_size;
                    w_64=w_64>width?width:w_64;

                    pr= w*width ;


                    for(int i = h ;i>=h_64 ;--i){
                       
                        int p=i*width;
                        int pr_j=(width-i-1);

                        if(w_64-w==block_size){
//                            for(int j=w ; j<w_64; j=j+3){
//                                pr=j*width;
                            int i2=0;
                            int j2=0;
//                                rotate_90(i,w,width,i2,j2);
                                
                      
                       
//                                r[assign_index(i2,j2,width)] = b[p+w] ;
//                                 printf("%B\n",t);
//                            unsigned int x=  0b111111111111111111111111;
//                            unsigned int x2=  0b111111111110001111111111;
//                           int rs= memcmp(&x, &x2, 3);
//                       printf("%d\n",rs);
                            
                                r[pr+pr_j] = b[p+w] ;
                                r[pr+pr_j+width] = b[p+w+1] ;
                                r[pr+pr_j+width*2] = b[p+w+2] ;
                                r[pr+pr_j+width*3] = b[p+w+3] ;
                                r[pr+pr_j+width*4] = b[p+w+4] ;
                                r[pr+pr_j+width*5] = b[p+w+5] ;
                                r[pr+pr_j+width*6] = b[p+w+6] ;
                                r[pr+pr_j+width*7] = b[p+w+7] ;
                                r[pr+pr_j+width*8] = b[p+w+8] ;
                                r[pr+pr_j+width*9] = b[p+w+9] ;
                                r[pr+pr_j+width*10] = b[p+w+10] ;
                                r[pr+pr_j+width*11] = b[p+w+11] ;
                                r[pr+pr_j+width*12] = b[p+w+12] ;
                                r[pr+pr_j+width*13] = b[p+w+13] ;
                                r[pr+pr_j+width*14] = b[p+w+14] ;
                                r[pr+pr_j+width*15] = b[p+w+15] ;
                                r[pr+pr_j+width*16] = b[p+w+16] ;
                                r[pr+pr_j+width*17] = b[p+w+17] ;
                                r[pr+pr_j+width*18] = b[p+w+18] ;
                                r[pr+pr_j+width*19] = b[p+w+19] ;
                                r[pr+pr_j+width*20] = b[p+w+20] ;
                               





//                            }
                        }else{
                            for(int j=w ; j<w_64; ++j){
                                pr=j*width;
                                r[pr+pr_j] = b[p+j] ;

                            }
                        }
                      

                    }


                }

            }
            break;
        case 2://180 degree
            
  
            for(int h=0; h< height ; h= h+block_size){



                 int h_64=h+block_size;
                    h_64=h_64>height?height:h_64;

                for(int w=0;w<width; w= w+block_size){

                    p=h*width3;




                    int w_64_half=w+(block_size);
                    w_64_half=w_64_half>width? width:w_64_half;
//                    w_64_half=(w+w_64_half)/2;
                   

                    int window_size = (w_64_half-w)*2;


                    for(int i = h ;i<h_64 ;++i){
                        pr= (height-i-1)*width3;

                        


                        for(int j=w ; j<w_64_half; ++j){
                            int pr_j=(width-j-1)*3;

                            int pj=p+mul3(j);
                            //int prj=pr+pr_j;

                            
                            int reverse_w = width-w-1;
                            
                            //first rotate
                            
                      
                          
//                           rendered_frame[pj] =  buffer_frame[pr+pr_j] ;
//                            rendered_frame[pj+1] =  buffer_frame[pr+pr_j+1] ;
//                             rendered_frame[pj+2] =  buffer_frame[pr+pr_j+2] ;
                             
                        
                           rendered_frame[pr+pr_j] = buffer_frame[pj];
                           rendered_frame[pr+pr_j+1] = buffer_frame[pj+1];
                           rendered_frame[pr+pr_j+2] = buffer_frame[pj+2];
                           
//                              rendered_frame[pr+pr_j+3] = buffer_frame[pj+3];
//                           rendered_frame[pr+pr_j+4] = buffer_frame[pj+4];
//                           rendered_frame[pr+pr_j+5] = buffer_frame[pj+5];
                           
                           //second rotate
//                           rendered_frame[pr+(-window_size+1+2*reverse_w)*3-pr_j]= buffer_frame[p+(window_size-1-j+2*w)*3];
//                           rendered_frame[pr+(-window_size+1+2*reverse_w)*3-pr_j+1]= buffer_frame[p+(window_size-1-j+2*w)*3+1];
//                           rendered_frame[pr+(-window_size+1+2*reverse_w)*3-pr_j+2]= buffer_frame[p+(window_size-1-j+2*w)*3+2];
                                   
                           
                           
                           

                           

                        }
                        p = p+width3;

                    }


                }


            }
            break;
            
        case 3: //rotate 270 degree
            
            //almost perfect
            for(int i = 0 ; i< height ; i= i + block_size){
                for(int j = 0; j < width; j = j + block_size){
                    
                    int bound_i = i+block_size;
                    bound_i = bound_i > height ? height : bound_i;
                    int bound_j = j+block_size;
                    bound_j  =  bound_j > width ? width : bound_j;
                   // printf("%d\n",bound_j);
                    
                    for(int i2 = i ; i2< bound_i; ++i2 ){
                        int rcolumn_index =  i2 * 3;
                        int row_index = i2*width3;
                        int column_index = j*3; 
                        for(int j2= j; j2< bound_j;++j2){
                            
                            int rrow_index = (width-j2-1)*width3;        
//                            int column_index = j2*3;
                            
                            
                            rendered_frame[rrow_index+rcolumn_index]=buffer_frame[row_index+column_index];
                            rendered_frame[rrow_index+rcolumn_index+1]=buffer_frame[row_index+column_index+1];
                            rendered_frame[rrow_index+rcolumn_index+2]=buffer_frame[row_index+column_index+2];
                            
                            column_index+=3; 
                            
                            
                        }
                        
                    }
                    
                    
                    
                    
                }
                
                
            }
            
            
            break;
        case 0:
            return;
            break ;
            
            
            
    }
    
        
        
        
        
    
    

    // there is no leftover//must be square. it did save cache hit. but the time is no improving. the overhead is copy_buffer, cannnot free buffer frame since it is used twice 
//due to the way verify frame is called , you need at least 25 frame to pass the test. e.g CW,1 * 25 times
    //    if(height>block_size || width>block_size){
//        
//        int hl=height%block_size;
//        int wl=width%block_size;
//
//
//        p = (hl-1)*width;
//        for(int i=hl-1;i>=0;--i){
//            pr = (width-wl)*width;
//            int pr_j= width-i-1;
//            for(int j= width-wl; j< width;++j){
//
//                rendered_frame[pr+pr_j] = buffer_frame[p+j];
//
//                pr+=width;
//
//
//            }
//            p=p-width;
//        }
//    }
    
    
   
    if(rendered_frame!=NULL){
        buffer_frame = copyFrame2(rendered_frame, buffer_frame, width, height);
        // free temporary image buffer
        free(rendered_frame);
    }
//    deallocateFrame(buffer_frame);
   
    
    // return a pointer to the updated image buffer
   // return buffer_frame; //do we allow to return rendered_frame.
}

unsigned char* copyFrame2(unsigned char* src, unsigned char* dst, unsigned width, unsigned height) {
    int size = height * width *3; //# of bytes
#define uint32_t unsigned int //in ug machine the size of unsigned int is 4 bytes
#define uint8_t char
    
    
   memcpy(dst,src,size);
    
    
//    int step_size = sizeof(uint32_t); //4 bytes aligned will be faster
//    
//
//    uint8_t *dst_8=(uint8_t*) dst;
//    uint8_t *src_8=(uint8_t*) src;
//    int alignment_iter = (size % step_size);  //copy a few bytes to make it aligned
//    for (int index = 0; index < alignment_iter; ++index)
//    {
//        *dst_8 = *src_8;
//        ++dst_8;
//        ++src_8;
//    }
//    
//    
//    
//    
//    
//    uint32_t *dst_32 = (uint32_t*) dst_8;
//    uint32_t *src_32 = (uint32_t*) src;
//    
//    
//    int iter = (size / step_size);
//    
//    for(int index = 0; index < iter; index+=3)
//    {
//        *dst_32++ = *src_32++;
//        *dst_32++ = *src_32++;
//        *dst_32++ = *src_32++;
//       
//        
//     
//        
//       
//    }

    
    
   
    
    
    
//    for (int i =0 ; i < end ; i=i+16){
//        
//       
//        dst[i] = src[i];
//        dst[i+1] = src[i+1];
//        dst[i+2] = src[i+2];
//        dst[i+3] = src[i+3];
//        dst[i+4] = src[i+4];
//        dst[i+5] = src[i+5];
//        dst[i+6] = src[i+6];
//        dst[i+7] = src[i+7];
//        dst[i+8] = src[i+8];
//        dst[i+9] = src[i+9];
//        dst[i+10] = src[i+10];
//        dst[i+11] = src[i+11];
//        dst[i+12] = src[i+12];
//        dst[i+13] = src[i+13];
//        dst[i+14] = src[i+14];
//        dst[i+15] = src[i+15];
//        
//         
//    }
    
   //dont need copy?
    return dst;
}
/***********************************************************************************************************************
 * @param buffer_frame - pointer pointing to a buffer storing the imported 24-bit bitmap image
 * @param width - width of the imported 24-bit bitmap image
 * @param height - height of the imported 24-bit bitmap image
 * @param rotate_iteration - rotate object inside frame buffer counter clockwise by 90 degrees, <iteration> times
 * @return - pointer pointing a buffer storing a modified 24-bit bitmap image
 * Note: You can assume the frame will always be square and you will be rotating the entire image
 **********************************************************************************************************************/
void processRotateCCW(unsigned char *buffer_frame, unsigned width, unsigned height,
                                int rotate_iteration) {
    
    
    processRotateCW(buffer_frame,width,height,4-(rotate_iteration%4));


    
  
}

/***********************************************************************************************************************
 * @param buffer_frame - pointer pointing to a buffer storing the imported 24-bit bitmap image
 * @param width - width of the imported 24-bit bitmap image
 * @param height - height of the imported 24-bit bitmap image
 * @param _unused - this field is unused
 * @return
 **********************************************************************************************************************/


unsigned char *processMirrorX(unsigned char *buffer_frame, unsigned int width, unsigned int height, int _unused) {

    int position_rendered_frame=0;
    int position_buffer_frame=0;
    int position_rendered_row=0;
    int position_buffer_row=0;//(height-1)*height*3;
//    int height3= height*3;
    int temp1;
    int temp2;
    int temp3;
#define swap(x,y,t) t=x;x=y;y=t
    // store shifted pixels to temporary buffer
    
//    int halt1 = (height>>1)*width*3;
//    int halt2 = height - halt1;
//    for(int i= 0 ; i < halt1 ; i++){
//        swap(buffer_frame[i+halt2], buffer_frame[i],temp1);
//        swap(buffer_frame[i +halt2 +1] , buffer_frame[i + 1],temp2);
//        swap(buffer_frame[i + halt2 +2] , buffer_frame[i + 2],temp3);
//    }
    
    for (int row = 0; row < height/2; ++row) {
        position_rendered_row = row * height*3;
        position_buffer_row = (height - row - 1) * height*3;
        for (int column = 0; column < width; ++column) {
            position_rendered_frame = position_rendered_row + column * 3;
            position_buffer_frame = position_buffer_row + column * 3;
            
            swap(buffer_frame[position_rendered_frame], buffer_frame[position_buffer_frame],temp1);
//            temp1 = buffer_frame[position_rendered_frame];
//            buffer_frame[position_rendered_frame]= buffer_frame[position_buffer_frame];
//            buffer_frame[position_buffer_frame]=temp1;
            
            swap(buffer_frame[position_rendered_frame + 1] , buffer_frame[position_buffer_frame + 1],temp2);
            swap(buffer_frame[position_rendered_frame + 2] , buffer_frame[position_buffer_frame + 2],temp3);
        }
//        position_rendered_row+=height3;
//        position_buffer_row-=height3;
    }
    return buffer_frame;
    
    
    
}

/***********************************************************************************************************************
 * @param buffer_frame - pointer pointing to a buffer storing the imported 24-bit bitmap image
 * @param width - width of the imported 24-bit bitmap image
 * @param height - height of the imported 24-bit bitmap image
 * @param _unused - this field is unused
 * @return
 **********************************************************************************************************************/
unsigned char *processMirrorY(unsigned char *buffer_frame, unsigned width, unsigned height, int _unused) {
     // allocate memory for temporary image buffer
    unsigned char *rendered_frame = allocateFrame(width, height);
    int position_rendered_frame;
    int position_buffer_frame;
    int position_rendered_row;
    int curr_pos;
    int leftover;
    // store shifted pixels to temporary buffer
    for (int row = 0; row < height; ++row) {
        position_rendered_row = row * height * 3; 
        position_rendered_frame = position_rendered_row;
        position_buffer_frame = position_rendered_row + (width - 1) * 3;
        int column = 20;
        while (column < width ) {
            rendered_frame[position_rendered_frame+59] = buffer_frame[position_buffer_frame-55];
            curr_pos=0;
            do {                           
                rendered_frame[position_rendered_frame] = buffer_frame[position_buffer_frame];
                rendered_frame[position_rendered_frame + 1] = buffer_frame[position_buffer_frame + 1];
                rendered_frame[position_rendered_frame + 2] = buffer_frame[position_buffer_frame + 2];
                position_rendered_frame +=3;
                position_buffer_frame-=3;
                ++curr_pos;
            } while (curr_pos < 20);
            position_rendered_frame = position_rendered_row + column * 3;
            position_buffer_frame = position_rendered_row + (width - column - 1) * 3;         
            column+=20;
        }
        leftover = 20 - (column - width);
        position_rendered_frame = position_rendered_row + (column-20) * 3;
        position_buffer_frame = position_rendered_row + (width - (column-20) - 1) * 3;
        rendered_frame[position_rendered_frame+ leftover*3 - 1] = buffer_frame[position_buffer_frame-(leftover - 2)*3+1];
        curr_pos=0;
        do {                           
            rendered_frame[position_rendered_frame] = buffer_frame[position_buffer_frame];
            rendered_frame[position_rendered_frame + 1] = buffer_frame[position_buffer_frame + 1];
            rendered_frame[position_rendered_frame + 2] = buffer_frame[position_buffer_frame + 2];
            position_rendered_frame +=3;
            position_buffer_frame-=3;
            ++curr_pos;
        } while (curr_pos < leftover);
        
    }

    // copy the temporary buffer back to original frame buffer
    buffer_frame = copyFrame2(rendered_frame, buffer_frame, width, height);

    // free temporary image buffer
    deallocateFrame(rendered_frame);

    // return a pointer to the updated image buffer
    return buffer_frame;
}

/***********************************************************************************************************************
 * WARNING: Do not modify the implementation_driver and team info prototype (name, parameter, return value) !!!
 *          Do not forget to modify the team_name and team member information !!!
 **********************************************************************************************************************/
void print_team_info(){
    // Please modify this field with something interesting
    char team_name[] = "Egg Tomato";

    // Please fill in your information
    char student1_first_name[] = "Xian";
    char student1_last_name[] = "Zhang";
    char student1_student_number[] = "1000564766";

    // Please fill in your partner's information
    // If yon't have partner, do not modify this
    char student2_first_name[] = "Qili";
    char student2_last_name[] = "Lu";
    char student2_student_number[] = "1000354537";

    // Printing out team information
    printf("*******************************************************************************************************\n");
    printf("Team Information:\n");
    printf("\tteam_name: %s\n", team_name);
    printf("\tstudent1_first_name: %s\n", student1_first_name);
    printf("\tstudent1_last_name: %s\n", student1_last_name);
    printf("\tstudent1_student_number: %s\n", student1_student_number);
    printf("\tstudent2_first_name: %s\n", student2_first_name);
    printf("\tstudent2_last_name: %s\n", student2_last_name);
    printf("\tstudent2_student_number: %s\n", student2_student_number);
}

/***********************************************************************************************************************
 * WARNING: Do not modify the implementation_driver and team info prototype (name, parameter, return value) !!!
 *          You can modify anything else in this file
 ***********************************************************************************************************************
 * @param sensor_values - structure stores parsed key value pairs of program instructions
 * @param sensor_values_count - number of valid sensor values parsed from sensor log file or commandline console
 * @param frame_buffer - pointer pointing to a buffer storing the imported  24-bit bitmap image
 * @param width - width of the imported 24-bit bitmap image
 * @param height - height of the imported 24-bit bitmap image
 * @param grading_mode - turns off verification and turn on instrumentation
 ***********************************************************************************************************************
 *
 **********************************************************************************************************************/




void implementation_driver(struct kv *sensor_values, int sensor_values_count, unsigned char *frame_buffer,
                           unsigned int width, unsigned int height, bool grading_mode) {
    int processed_frames = 0;
//    printBMP(width, height, frame_buffer);
    
    
    //        int size= width*height;
        unsigned char* rendered_buffer = allocateFrame(width,height);
        
        struct info* info_array= (struct info*)malloc((width * height) * sizeof(struct info));
//        bzero(info_array,zero);
        struct _three_byte_* f = (struct _three_byte_*)frame_buffer;
        
        int white = 0xffffff;
        
        int info_index=0;
        for(int i=0;i< height;++i ){
            int index=i*width;
            for(int j=0;j <  width;++j){
                struct _three_byte_ c = f[index+j]; //not_bg(c,white)  //c.a!=-1 || c.b !=-1 || c.c!=-1 // (char)(c.a^0xff) || (char)(c.b^0xff) || (char)(c.c^0xff)
//                  printf("%d\n",sizeof(struct _three_byte_));
//                 printf("a:%d,r:%d\n",c.a,(char)(c.a^0xff));
                if( (char)(c.a^0xff) || (char)(c.b^0xff) || (char)(c.c^0xff) ){
//                    printf("a:%d,b:%d,c:%d\n",c.a,c.b,c.c);
                    info_array[info_index].x=j;
                    info_array[info_index].y=i;
                    info_array[info_index].color=c;
                    
//                    printf("i:%d,j:%d\n",i,j);
                     ++info_index;
                }
                
                
               
            }
        }
        
//        for(int i = 0 ; i< info_index;i++){
//            printf("x:%d,y:%d\n",info_array[i].x,info_array[i].y);
//            printf("c:%d\n",info_array[i].color);
//        }
//        exit(-1);
//        free(&info_array[info_index]);

        
//        struct info* info_array2= (struct info*)malloc((info_index) * sizeof(struct info));
//        memcpy(info_array2,info_array,info_index* sizeof(struct info));
//        free(info_array);
    
    int shiftvertical = 0 , shifthorizontal =0, rotate = 0, mirror_x=0, mirror_y=0;  
    for (int sensorValueIdx = 0; sensorValueIdx < sensor_values_count; sensorValueIdx++) {
//        printf("Processing sensor value #%d: %s, %d\n", sensorValueIdx, sensor_values[sensorValueIdx].key,
//               sensor_values[sensorValueIdx].value);
        
        

        
        
        
        //assume in the order of shift, rotate, mirror
        
        
        if (!strcmp(sensor_values[sensorValueIdx].key, "W")) {
            //printf("f\n");
           
            if(rotate&&mirror_x){
                
                switch(rotate){
                    case 0:
                        shiftvertical -= sensor_values[sensorValueIdx].value;
                        break;
                    case 1:
                        shifthorizontal += sensor_values[sensorValueIdx].value;
                        break;
                    case 2:
                        shiftvertical += sensor_values[sensorValueIdx].value;
                        break;
                    case 3:
                        shifthorizontal -= sensor_values[sensorValueIdx].value;
                        break;
                     
                }
                
                
            }else if(rotate){
                switch(rotate){
                    case 0:
                        shiftvertical += sensor_values[sensorValueIdx].value;
                        break;
                    case 1:
                        shifthorizontal -= sensor_values[sensorValueIdx].value;
                        break;
                    case 2:
                        shiftvertical -=sensor_values[sensorValueIdx].value;
                        break;
                    case 3:
                        shifthorizontal += sensor_values[sensorValueIdx].value;
                        break;
                     
                }
                
            }else if(mirror_x){
                shiftvertical-=sensor_values[sensorValueIdx].value;
                
            }else {
                shiftvertical+= sensor_values[sensorValueIdx].value;
            }
            
            
            
            //frame_buffer = processMoveUp(frame_buffer, width, height, sensor_values[sensorValueIdx].value);
//            printBMP(width, height, frame_buffer);
        } else if (!strcmp(sensor_values[sensorValueIdx].key, "A")) {
            if(rotate&&mirror_y){
                
                switch(rotate){
                    case 0:
                        shifthorizontal += sensor_values[sensorValueIdx].value;
                        break;
                    case 1:
                        shiftvertical += sensor_values[sensorValueIdx].value;
                        break;
                    case 2:
                        shifthorizontal -= sensor_values[sensorValueIdx].value;
                        break;
                    case 3:
                        shiftvertical -= sensor_values[sensorValueIdx].value;
                        break;
                     
                }
                
            }else if(rotate){
                switch(rotate){
                    case 0:
                        shifthorizontal -= sensor_values[sensorValueIdx].value;
                        break;
                    case 1:
                        shiftvertical -= sensor_values[sensorValueIdx].value;
                        break;
                    case 2:
                        shifthorizontal +=sensor_values[sensorValueIdx].value;
                        break;
                    case 3:
                        shiftvertical += sensor_values[sensorValueIdx].value;
                        break;
                     
                }
                
            }else if(mirror_y){
                shifthorizontal+=sensor_values[sensorValueIdx].value;
                
            }else{
                shifthorizontal-= sensor_values[sensorValueIdx].value;
            }
            
            
            
            //frame_buffer = processMoveLeft(frame_buffer, width, height, sensor_values[sensorValueIdx].value);
//            printBMP(width, height, frame_buffer);
        } else if (!strcmp(sensor_values[sensorValueIdx].key, "S")) {
            
             if(rotate&&mirror_x){
                
                switch(rotate){
                    case 0:
                        shiftvertical += sensor_values[sensorValueIdx].value;
                        break;
                    case 1:
                        shifthorizontal -= sensor_values[sensorValueIdx].value;
                        break;
                    case 2:
                        shiftvertical -= sensor_values[sensorValueIdx].value;
                        break;
                    case 3:
                        shifthorizontal += sensor_values[sensorValueIdx].value;
                        break;
                     
                }
                
                
            }else if(rotate){
                switch(rotate){
                    case 0:
                        shiftvertical -= sensor_values[sensorValueIdx].value;
                        break;
                    case 1:
                        shifthorizontal += sensor_values[sensorValueIdx].value;
                        break;
                    case 2:
                        shiftvertical +=sensor_values[sensorValueIdx].value;
                        break;
                    case 3:
                        shifthorizontal -= sensor_values[sensorValueIdx].value;
                        break;
                     
                }
                
            }else if(mirror_x){
                shiftvertical+=sensor_values[sensorValueIdx].value;
                
            }else {
                shiftvertical-= sensor_values[sensorValueIdx].value;
            }
            
            
            
            //frame_buffer = processMoveDown(frame_buffer, width, height, sensor_values[sensorValueIdx].value);
//            printBMP(width, height, frame_buffer);
        } else if (!strcmp(sensor_values[sensorValueIdx].key, "D")) {
            
            if(rotate&&mirror_y){
                switch(rotate){
                    case 0:
                        shifthorizontal -= sensor_values[sensorValueIdx].value;
                        break;
                    case 1:
                        shiftvertical -= sensor_values[sensorValueIdx].value;
                        break;
                    case 2:
                        shifthorizontal +=sensor_values[sensorValueIdx].value;
                        break;
                    case 3:
                        shiftvertical += sensor_values[sensorValueIdx].value;
                        break;
                     
                }
                
                
                
            }else if(rotate){
                switch(rotate){
                    case 0:
                        shifthorizontal += sensor_values[sensorValueIdx].value;
                        break;
                    case 1:
                        shiftvertical += sensor_values[sensorValueIdx].value;
                        break;
                    case 2:
                        shifthorizontal -= sensor_values[sensorValueIdx].value;
                        break;
                    case 3:
                        shiftvertical -= sensor_values[sensorValueIdx].value;
                        break;
                     
                }
                
            }else if(mirror_y){
                shifthorizontal-=sensor_values[sensorValueIdx].value;
                
            }else{
                shifthorizontal+= sensor_values[sensorValueIdx].value;
            }
            
            
            
            //frame_buffer = processMoveRight(frame_buffer, width, height, sensor_values[sensorValueIdx].value);
//            printBMP(width, height, frame_buffer);
        } else if (!strcmp(sensor_values[sensorValueIdx].key,"CW")) {
            
            int temp_rotate = (4+(sensor_values[sensorValueIdx].value % 4))%4;
//            printf("temp:%d\n",temp_rotate);
            if(mirror_x){
                switch(temp_rotate){
                    case 0:
                        break ;
                    case 1:
                        rotate += 3;
                        break;
                    case 2:
                        mirror_x -= 1;
                        mirror_y += 1;
                        break;
                    case 3:
                        rotate += 1;
                        break;
                     
                }
                
            }else if(mirror_y){
                switch(temp_rotate){
                    case 0:
                        break ;
                    case 1:
                        rotate += 3;
                        break;
                    case 2:
                        mirror_x += 1;
                        mirror_y -= 1;
                        break;
                    case 3:
                        rotate += 1;
                        break;
                     
                }
                
            }else{
                rotate+=temp_rotate;
            }
            rotate = rotate % 4;
            mirror_x = mirror_x % 2;
            mirror_y = mirror_y % 2;
            
            // processRotateCW(frame_buffer, width, height, sensor_values[sensorValueIdx].value);
//            printBMP(width, height, frame_buffer);
        } else if (!strcmp(sensor_values[sensorValueIdx].key, "CCW")) {
            
            int temp_rotate = (sensor_values[sensorValueIdx].value % 4);
            if(temp_rotate>0){
                temp_rotate= (4-temp_rotate)%4;
            }else{
                temp_rotate=-temp_rotate;
            }
            
            
            
            if(mirror_x){
                switch(temp_rotate){
                    case 0:
                        break ;
                    case 1:
                        rotate += 3;
                        break;
                    case 2:
                        mirror_x -= 1;
                        mirror_y += 1;
                        break;
                    case 3:
                        rotate += 1;
                        break;
                     
                }
                
            }else if(mirror_y){
                switch(temp_rotate){
                    case 0:
                        break ;
                    case 1:
                        rotate += 3;
                        break;
                    case 2:
                        mirror_x += 1;
                        mirror_y -= 1;
                        break;
                    case 3:
                        rotate += 1;
                        break;
                     
                }
                
            }else{
                rotate+=temp_rotate;
            }
            rotate = rotate % 4;
            mirror_x = mirror_x % 2;
            mirror_y = mirror_y % 2;
          
             //processRotateCCW(frame_buffer, width, height, sensor_values[sensorValueIdx].value);
//            printBMP(width, height, frame_buffer);
        } else if (!strcmp(sensor_values[sensorValueIdx].key, "MX")) {
            
            mirror_x+=1;
            mirror_x = mirror_x % 2;
            if(mirror_x&&mirror_y){
                mirror_y=0;
                mirror_x=0;
                rotate+=2;
                rotate=rotate%4;
            }
            
            //frame_buffer = processMirrorX(frame_buffer, width, height, sensor_values[sensorValueIdx].value);
//            printBMP(width, height, frame_buffer);
        } else if (!strcmp(sensor_values[sensorValueIdx].key, "MY")) {
            mirror_y+=1;
            mirror_y = mirror_y % 2;
            if(mirror_x&&mirror_y){
                mirror_y=0;
                mirror_x=0;
                rotate+=2;
                rotate=rotate%4;
            }
            
            //frame_buffer = processMirrorY(frame_buffer, width, height, sensor_values[sensorValueIdx].value);
//            printBMP(width, height, frame_buffer);
        }
        processed_frames += 1;
        if (processed_frames % 25 == 0) {
            rotate = (4+rotate)%4; //handle negative
           // old part ///////////////////////////// 
//            if(shiftvertical>0){
//                processMoveUp(frame_buffer,width,height,shiftvertical);
//            }else if(shiftvertical<0){
//                processMoveDown(frame_buffer,width,height,-shiftvertical);
//            }else{
//                ;
//            }
//            
//            if(shifthorizontal>0){
//                processMoveRight(frame_buffer,width,height,shifthorizontal);
//            }else if(shifthorizontal<0){
//                processMoveLeft(frame_buffer,width,height,-shifthorizontal);
//            }else{
//                ;
//            }
//            
//                        
//            processRotateCW(frame_buffer, width, height, rotate);
//           
//            if(mirror_x){
//                processMirrorX(frame_buffer, width, height,  0);
//            }
//            else if(mirror_y){
//                processMirrorY(frame_buffer, width, height, 0);
//            }
            
             // old part ///////////////////////////// 
            
//            printf("%d:v\n",shiftvertical);
//            printf("%d:h\n",shifthorizontal);
//            printf("%d:r\n",rotate);
//             printf("%d:x\n",mirror_x);
//            printf("%d:y\n",mirror_y);
//             printf("%d:test\n",(-13%4));
            
            processAll(frame_buffer,rendered_buffer,info_array,info_index,width,height,shifthorizontal,shiftvertical,rotate,mirror_x,mirror_y);
            
     
           
//            mirror_x =0 ;
//            mirror_y=0;
//            rotate=0;
//            shifthorizontal=0;
//            shiftvertical=0;
            
//            printBMP(width, height, frame_buffer);
            verifyFrame(rendered_buffer, width, height, grading_mode);
        }
//        printf("%d:pro_dirver\n",processed_frames);
    }
    
    
   // printf("%d\n",rotate);

        
//    printBMP(width, height, frame_buffer);
    return;
}

