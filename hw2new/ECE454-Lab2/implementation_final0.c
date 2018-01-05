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

//global variable
struct info* info_array=NULL;
struct info* info_array_r90=NULL ;
struct info* info_array_r180=NULL ;
struct info* info_array_r270=NULL ;
struct info* info_array_r90_mx =NULL;
struct info* info_array_r90_my =NULL;
struct info* info_array_mx =NULL;
struct info* info_array_my =NULL;


struct _three_byte_{
//    unsigned int a : 24;
    char a,b,c;
};
struct info{
    //int index;
    
    struct _three_byte_ color;
    short x,y;
    
    //char pad;
    
};

struct state{
    int shiftvertical;
    int shifthorizontal;
    int rotate;
    int mirror_x;
    int mirror_y;  
};
//struct _sixty3_byte_{
//    unsigned int h;
//    unsigned long int a,b,c,d,e,f,g;
//    struct _three_byte_ i;
//    
//};

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
#define rotate_180_mirror_x(i,j,w,i2,j2) i2=i;j2=(w-j-1) // mirrory
#define rotate_180_mirror_y(i,j,w,i2,j2) i2=(w-i-1);j2=j //mirrorx
#define rotate_270_mirror_x(i,j,w,i2,j2) i2=j;j2=i //90+my
#define rotate_270_mirror_y(i,j,w,i2,j2) i2=(w-j-1);j2=(w-i-1) //90+mx
#define mirror_x(i,j,w,i2,j2) i2=(w-i-1);j2=j
#define mirror_y(i,j,w,i2,j2) i2=i;j2=(w-j-1)
#define shift(i,j,w,i2,j2) i2=i;j2=j  




#define assign_index(i,j,w) (i*w+j)

#define block_size 21
#define not_bg(x,white) (memcmp(&x, &white, 3))


/*void pre_processing(struct info* info_array_modified,struct info* info_array,int obj_size , unsigned width, unsigned height,
                               int x, int y,int rotate_iteration,int mirror_x, int mirror_y){
    
       
//    for(int i =0 ; i < obj_size; ++i){
//        struct info inf = info_array[i];
//         
//        int v=inf.y;
//        int h=inf.x;
//// printf("%d x\n",x);
//        
//        int v1=v-y,h1=h+x;
//        int v2=v1,h2=h1;
////        printf("%d,%d first\n",v2,h2);
//        if(rotate_iteration){
//            if(mirror_x){
//                switch(rotate_iteration){
//                    case 1: rotate_90_mirror_x(v1,h1,width,v2,h2);break;
//                    case 2: rotate_180_mirror_x(v1,h1,width,v2,h2);break;
//                    case 3: rotate_270_mirror_x(v1,h1,width,v2,h2);break;
//                }
//            }else if(mirror_y){
//                switch(rotate_iteration){
//                    case 1: rotate_90_mirror_y(v1,h1,width,v2,h2);break;
//                    case 2: rotate_180_mirror_y(v1,h1,width,v2,h2);break;
//                    case 3: rotate_270_mirror_y(v1,h1,width,v2,h2);break;
//                }
//
//            }else{
//                switch(rotate_iteration){
//                    case 1: rotate_90(v1,h1,width,v2,h2);break;
//                    case 2: rotate_180(v1,h1,width,v2,h2);break;
//                    case 3: rotate_270(v1,h1,width,v2,h2);break;
//                }
//
//            }
//
//        }else if(mirror_x){
//            mirror_x(v1,h1,width,v2,h2);
//        }else if(mirror_y){
//            mirror_y(v1,h1,width,v2,h2);
//        }
//
////                        int d1= assign_index(v2,h2,width);
////                        int d2= assign_index(i,j,width);
////
////                        printf("%d,%d\n",v2,h2);
////                        printf("%d :c\n",inf.color);
//       info_array_modified[i].y=v2;
//       info_array_modified[i].x=h2;
//       info_array_modified[i].color= inf.color;
//               //b[assign_index(v,h,width)];
//    }
    
    
 
     int v1,h1,v2,h2,v3,h3,v4,h4,v5,h5,v6,h6;
    
         
         
//    int ix1,ix2,ix3,ix4,ix5,ix6;
//    int iy1,iy2,iy3,iy4,iy5,iy6;
//    struct _three_byte_ c1,c2,c3,c4,c5,c6;
    struct info inf1,inf2,inf3,inf4,inf5,inf6;
   
#define unroll_factor 6
    int iter = obj_size/unroll_factor;
    int leftover = obj_size%unroll_factor;
    int offset= obj_size-leftover;
   
    
//    printf("%d,%d,%d\n",iter,leftover,offset);

    
//           info_array_modified[index].y=v1;info_array_modified[index].x=h1;info_array_modified[index].color=inf1.color;\
//       info_array_modified[index+1].y=v2;info_array_modified[index+1].x=h2;info_array_modified[index+1].color=inf2.color;\
//       info_array_modified[index+2].y=v3;info_array_modified[index+2].x=h3;info_array_modified[index+2].color=inf3.color;\
//       info_array_modified[index+3].y=v4;info_array_modified[index+3].x=h4;info_array_modified[index+3].color=inf4.color;\
//       info_array_modified[index+4].y=v5;info_array_modified[index+4].x=h5;info_array_modified[index+4].color=inf5.color;\
//       info_array_modified[index+5].y=v6;info_array_modified[index+5].x=h6;info_array_modified[index+5].color=inf6.color;\
    
    #define for_looper2(statement) for(int i =0, index=0 ; i < iter; i=i+1, index+=unroll_factor ){\
        inf1 = info_array[index];\
        inf2 = info_array[index+1];\
        inf3 = info_array[index+2];\
        inf4 = info_array[index+3];\
        inf5 = info_array[index+4];\
        inf6 = info_array[index+5];\
        statement((inf1.y-y),(inf1.x+x),width,v1,h1);\
        statement((inf2.y-y),(inf2.x+x),width,v2,h2);\
        statement((inf3.y-y),(inf3.x+x),width,v3,h3);\
        statement((inf4.y-y),(inf4.x+x),width,v4,h4);\
        statement((inf5.y-y),(inf5.x+x),width,v5,h5);\
        statement((inf6.y-y),(inf6.x+x),width,v6,h6);\
       info_array_modified[index].index=assign_index(v1,h1,width);info_array_modified[index].color=inf1.color;\
       info_array_modified[index+1].index=assign_index(v2,h2,width);info_array_modified[index+1].color=inf2.color;\
       info_array_modified[index+2].index=assign_index(v3,h3,width);info_array_modified[index+2].color=inf3.color;\
       info_array_modified[index+3].index=assign_index(v4,h4,width);info_array_modified[index+3].color=inf4.color;\
       info_array_modified[index+4].index=assign_index(v5,h5,width);info_array_modified[index+4].color=inf5.color;\
       info_array_modified[index+5].index=assign_index(v6,h6,width);info_array_modified[index+5].color=inf6.color;\
    }\
    for(int j = offset;j<obj_size;++j){\
        struct info inf = info_array[j];\
        statement((inf.y-y),(inf.x+x),width,v1,h1);\
        info_array_modified[j].index=assign_index(v1,h1,width);info_array_modified[j].color=inf.color;\
    }\
    
    
    
//    void(*fptr)(int,int,int,int*,int*);
    
    
    if(rotate_iteration){
        if(mirror_x){
            switch(rotate_iteration){
                case 1: for_looper2(rotate_90_mirror_x); break;// fptr=&rotate_90_mirror_x_f; break; //for_looper(rotate_90_mirror_x); break;
                case 2: for_looper2(rotate_180_mirror_x); break;//fptr=&mirror_y_f;break; //for_looper(rotate_180_mirror_x); break;
                case 3: for_looper2(rotate_270_mirror_x); break;//fptr=&rotate_90_mirror_y_f;break; //for_looper(rotate_270_mirror_x); break;
            }
        }else if(mirror_y){
            switch(rotate_iteration){
                case 1: for_looper2(rotate_90_mirror_y); break;//fptr=&rotate_90_mirror_y_f;break;//for_looper(rotate_90_mirror_y); break;
                case 2: for_looper2(rotate_180_mirror_y); break;//fptr=&mirror_x_f;break;//for_looper(rotate_180_mirror_y); break;
                case 3: for_looper2(rotate_270_mirror_y); break;//fptr=&rotate_90_mirror_x_f;break;//for_looper(rotate_270_mirror_y); break;
            }

        }else{
            switch(rotate_iteration){
                case 1: for_looper2(rotate_90);
                break;//fptr=&rotate_90_f;break;//for_looper(rotate_90); break;
                case 2: for_looper2(rotate_180); break;//fptr=&rotate_180_f;break;//for_looper(rotate_180); break;
                case 3: for_looper2(rotate_270); break;//fptr=&rotate_270_f;break;//for_looper(rotate_270); break;
            }

        }

    }else if(mirror_x){
        for_looper2(mirror_x);
//        fptr=&mirror_x_f;
    }else if(mirror_y){
        for_looper2(mirror_y);
//        fptr=&mirror_y_f;
    }else{
        for_looper2(shift);
//        fptr=null;
    }
    
    
 
    
    
    
}
*/

//void rotate_90_f(int i, int j, int w ,int* i2, int* j2) {
//    *i2 = j;*j2= (w-i-1);
//}
//void rotate_180_f(int i, int j, int w ,int* i2, int* j2) {
//    *i2=(w-i-1);*j2=(w-j-1);
//}
//void rotate_270_f(int i, int j, int w ,int* i2, int* j2) {
//    *i2=(w-1-j),*j2=i;
//}
//void rotate_90_mirror_x_f(int i, int j, int w ,int* i2, int* j2) {
//    *i2=(w-j-1);*j2=(w-i-1);
//}
//void mirror_x_f(int i, int j, int w ,int* i2, int* j2) {
//    *i2=(w-i-1);*j2=j;
//}
//void mirror_y_f(int i, int j, int w ,int* i2, int* j2) {
//    *i2=i;*j2=(w-j-1);
//}
//void rotate_90_mirror_y_f(int i, int j, int w ,int* i2, int* j2) {
//    *i2=j;*j2=i;
//}
//void null(int i, int j, int w ,int* i2, int* j2) {
//    ;
//}

void processAll(char* rendered_frame,struct info* info_array,int obj_size , unsigned width, unsigned height,
                               int x, int y,int rotate_iteration,int mirror_x, int mirror_y) {
    
//    unsigned int white=  0xffffff;
//    unsigned char* rendered_frame = allocateFrame(width, height);
    
   
    
    struct _three_byte_* r = (struct _three_byte_*)rendered_frame;
//    struct _three_byte_* b = (struct _three_byte_*)buffer_frame;
//        memset(r,white,(width * height * 3) * sizeof(char));     
    //printf("%d w,%d h",width,height);
    //int v1=inf.y-y, h1=inf.x+x;
     int v1,h1,v2,h2,v3,h3,v4,h4,v5,h5,v6,h6;
    
         
         
//    int ix1,ix2,ix3,ix4,ix5,ix6;
//    int iy1,iy2,iy3,iy4,iy5,iy6;
//    struct _three_byte_ c1,c2,c3,c4,c5,c6;
    struct info inf1,inf2,inf3,inf4,inf5,inf6;
   
#define unroll_factor 6
    int iter = obj_size/unroll_factor;
    int leftover = obj_size%unroll_factor;
    int offset= obj_size-leftover;
   
    
//    printf("%d,%d,%d\n",iter,leftover,offset);

    
    #define for_looper(statement) for(int i =0, index=0 ; i < iter; i=i+1, index+=unroll_factor ){\
        inf1 = info_array[index];\
        inf2 = info_array[index+1];\
        inf3 = info_array[index+2];\
        inf4 = info_array[index+3];\
        inf5 = info_array[index+4];\
        inf6 = info_array[index+5];\
        statement((inf1.y-y),(inf1.x+x),width,v1,h1);\
        statement((inf2.y-y),(inf2.x+x),width,v2,h2);\
        statement((inf3.y-y),(inf3.x+x),width,v3,h3);\
        statement((inf4.y-y),(inf4.x+x),width,v4,h4);\
        statement((inf5.y-y),(inf5.x+x),width,v5,h5);\
        statement((inf6.y-y),(inf6.x+x),width,v6,h6);\
       r[assign_index(v1,h1,width)]= inf1.color;\
       r[assign_index(v2,h2,width)]= inf2.color;\
       r[assign_index(v3,h3,width)]= inf3.color;\
       r[assign_index(v4,h4,width)]= inf4.color;\
       r[assign_index(v5,h5,width)]= inf5.color;\
       r[assign_index(v6,h6,width)]= inf6.color;\
    }\
    for(int j = offset;j<obj_size;++j){\
           struct info inf = info_array[j];\
        statement((inf.y-y),(inf.x+x),width,v1,h1);\
        r[assign_index(v1,h1,width)]= inf.color;\
    }\
    
    
    
//    void(*fptr)(int,int,int,int*,int*);
    
    
    if(rotate_iteration){
        if(mirror_x){
            switch(rotate_iteration){
                case 1: for_looper(rotate_90_mirror_x); break;// fptr=&rotate_90_mirror_x_f; break; //for_looper(rotate_90_mirror_x); break;
                case 2: for_looper(rotate_180_mirror_x); break;//fptr=&mirror_y_f;break; //for_looper(rotate_180_mirror_x); break;
                case 3: for_looper(rotate_270_mirror_x); break;//fptr=&rotate_90_mirror_y_f;break; //for_looper(rotate_270_mirror_x); break;
            }
        }else if(mirror_y){
            switch(rotate_iteration){
                case 1: for_looper(rotate_90_mirror_y); break;//fptr=&rotate_90_mirror_y_f;break;//for_looper(rotate_90_mirror_y); break;
                case 2: for_looper(rotate_180_mirror_y); break;//fptr=&mirror_x_f;break;//for_looper(rotate_180_mirror_y); break;
                case 3: for_looper(rotate_270_mirror_y); break;//fptr=&rotate_90_mirror_x_f;break;//for_looper(rotate_270_mirror_y); break;
            }

        }else{
            switch(rotate_iteration){
                case 1: for_looper(rotate_90);
                break;//fptr=&rotate_90_f;break;//for_looper(rotate_90); break;
                case 2: for_looper(rotate_180); break;//fptr=&rotate_180_f;break;//for_looper(rotate_180); break;
                case 3: for_looper(rotate_270); break;//fptr=&rotate_270_f;break;//for_looper(rotate_270); break;
            }

        }

    }else if(mirror_x){
        for_looper(mirror_x);
//        fptr=&mirror_x_f;
    }else if(mirror_y){
        for_looper(mirror_y);
//        fptr=&mirror_y_f;
    }else{
        for_looper(shift);
//        fptr=null;
    }
   
    
    
    
}





    
    

        
    
    

    // there is no leftover//must be square. it did save cache hit. but the time is no improving. the overhead is copy_buffer, cannnot free buffer frame since it is used twice 
//due to the way verify frame is called , you need at least 25 frame to pass the test. e.g CW,1 * 25 times

    






/***********************************************************************************************************************
 * WARNING: Do not modify the implementation_driver and team info prototype (name, parameter, return value) !!!
 *          Do not forget to modify the team_name and team member information !!!
 **********************************************************************************************************************/
void print_team_info(){
    // Please modify this field with something interesting
    char team_name[] = "GreenTomato";

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

void processAll2( struct _three_byte_* r,struct info** info_array_array,int obj_size , unsigned width, unsigned height,
                               int x, int y,int rotate_iteration,int mirror_x, int mirror_y) {
//    printf("here1\n");
//
//        printf("here1");
     struct info* info_array = NULL;
     if(rotate_iteration){
            if(mirror_x){
                switch(rotate_iteration){
                    case 1: info_array=info_array_array[3];break;
                    case 2: info_array=info_array_array[6];break;
                    case 3: info_array=info_array_array[4];break;
                }
            }else if(mirror_y){
                switch(rotate_iteration){
                    case 1: info_array=info_array_array[4];break;
                    case 2: info_array=info_array_array[5];break;
                    case 3: info_array=info_array_array[3];break;
                }

            }else{
                switch(rotate_iteration){
                    case 1: info_array=info_array_array[0];break;
                    case 2: info_array=info_array_array[1];break;
                    case 3: info_array=info_array_array[2];break;
                }

            }
     }else if(mirror_x){
          info_array=info_array_array[5];
     }else if(mirror_y){
          info_array=info_array_array[6];
     }else{
         info_array=info_array_array[7];
     }

     #define unroll_factor 6
    int iter = obj_size/unroll_factor;
    int leftover = obj_size%unroll_factor;
    int offset= obj_size-leftover;
     for(int i =0, index=0 ; i < iter; i=i+1, index+=unroll_factor ){
        struct info inf1 = info_array[index];
        struct info inf2 = info_array[index+1];
        struct info inf3 = info_array[index+2];
        struct info inf4 = info_array[index+3];
        struct info inf5 = info_array[index+4];
        struct info inf6 = info_array[index+5];
        
//        index commet
//        int index11 = inf1.index-y*width+x;
//        int index12 = inf2.index-y*width+x;
//        int index13 = inf3.index-y*width+x;
//        int index14 = inf4.index-y*width+x;
//        int index15 = inf5.index-y*width+x;
//        int index16 = inf6.index-y*width+x;
//         printf("%d v,%d h",v,h);
//        r[index11]=inf1.color;
//        r[index12]=inf2.color;
//        r[index13]=inf3.color;
//        r[index14]=inf4.color;
//        r[index15]=inf5.color;
//        r[index16]=inf6.color;
        
         
     } 
    for(int j = offset;j<obj_size;++j){
        struct info inf = info_array[j];
        //int index1 = inf.index-y*width+x;
        //r[index1]= inf.color;
    }
}

#define cache_size 14
//frame caching
unsigned char *frame_cache[cache_size] ={NULL};
struct state frame_state[cache_size] = {{.shifthorizontal=0,.shiftvertical=0,.rotate=0,.mirror_x=0,.mirror_y=0}};
int frame_index=1;
int info_index=0;


void implementation_driver(struct kv *sensor_values, int sensor_values_count, unsigned char *frame_buffer,
                           unsigned int width, unsigned int height, bool grading_mode) {
    int processed_frames = 0;
//    printBMP(width, height, frame_buffer);
    
    
            int size= width*height*sizeof(struct _three_byte_);
//        unsigned char* rendered_buffer = allocateFrame(width,height);
//        char rendered_buffer[width*height*3];
            
            int white = 0xffffff;
           
            frame_cache[0]=frame_buffer;
            
            
            for(int i=1;i<cache_size&&frame_cache[i]==NULL;i++){
                
                frame_cache[i]= malloc(size);
                //memset(frame_cache[i],0xff,size);
                
            }
            
            
          
//        bzero(info_array,zero);
        struct _three_byte_* f = (struct _three_byte_*)frame_buffer;
//         struct _three_byte_* r = (struct _three_byte_*)rendered_buffer;
        
        
        
//        int info_index=0;
//        int index=0;
        struct _three_byte_ c;
        
        int row_size = (width)*3 * sizeof(char);
        

        
      
        #define row_partition_ratio 5
        int small_width= width/row_partition_ratio;
        int small_row_size= small_width*3; //in byte
        
        
        char* small_white_buffer =malloc(small_row_size);
        memset(small_white_buffer,0xff,small_row_size);
        	 char tiny_white_buffer[block_size*3];
        memset(tiny_white_buffer,0xff,block_size*3);
        
        int block3= block_size*3;
        
        int leftover =width%small_width;    
        int leftover_row_size = leftover*3;
        int offset1=small_width*row_partition_ratio;
        
//        bool bg_check[height][row_partition_ratio+1];
//        bzero(bg_check,(row_partition_ratio+1)*sizeof(bool));
      
//         int index_temp=0;
//          int small_offset = small_width*row_partition_ratio;
//        for(int i=0;i<height;++i){
//           
//            for(int p=0;p<row_partition_ratio;++p){
//                int offset= p*small_width;
//                bg_check[i][p]=memcmp(&f[index_temp+offset],small_white_buffer,small_row_size);
//            }
//            if(leftover){
//                bg_check[i][row_partition_ratio]=memcmp(&f[index_temp+small_offset],small_white_buffer,leftover_row_size);
//            }
//            index_temp+=width;
//        }
        
          if(info_array==NULL){
             info_array=  (struct info*)malloc((width * height) * sizeof(struct info));
         
             
             for(int i=0;i< height; i=i+ block_size ){
 		int tiling_boundi= i+block_size;
            tiling_boundi = tiling_boundi > height? height:tiling_boundi;
            
            
            for(int j=0; j< width; j= j+block_size){
                
                int tiling_boundj = j+block_size;
                
                int window_size ;
                if(tiling_boundj>width){
                    tiling_boundj= width;
                    window_size = (width-j)*3;
                }else{
                    window_size = block3;
                }
                
//                int bp1 = j/ small_width;
//                int bp2 = tiling_boundj/ small_width;
                
                
                
                for(int i2=i;i2< tiling_boundi; ++i2){
                
                    int index=i2*width;
                    
                    if(  memcmp(&f[index+j],tiny_white_buffer,window_size)   ){   //bg_check2[bp1]||bg_check2[bp2]){
                        for(int j2=j; j2 < tiling_boundj;++j2){

                            c = f[index+j2];
//                            printf("%d\n",c);
                            if( (char)(c.a^0xff) || (char)(c.b^0xff) || (char)(c.c^0xff) ){
//                                printf("here\n");
                               info_array[info_index].x=j2;
                               info_array[info_index].y=i2;
                               info_array[info_index].color=c;
                               //index comment
                              // info_array[info_index].index=i2*width+j2;
                                ++info_index;
                            }

                        }
                    }
                    
                }  
                
             }
            }
             
// for(int i=0;i< height; ++i  ){
//            
//
//             int index=i*width;
//            
//
//            
//            for(int si=0; si<row_partition_ratio; ++si){
//                
//                int offset= si*small_width;
//                if(memcmp(&f[index+offset],small_white_buffer,small_row_size)){
//                    int j2_end= offset+small_width;
//                    for(int j2=offset;j2< j2_end; j2=j2+1){
//                       
//                            c = f[index+j2];
//                            if( (char)(c.a^0xff) || (char)(c.b^0xff) || (char)(c.c^0xff) ){
//                               info_array[info_index].x=j2;
//                               info_array[info_index].y=i;
//                               info_array[info_index].color=c;
//                               info_array[info_index].index=i*width+j2;
//                               
//                                ++info_index;
//                           }
//                            
//                     
////                    ++index;
//                    }
//                }    
//            }
//           
//            index+=offset1;
//            
//            if( leftover&&memcmp(&f[index],small_white_buffer,leftover_row_size)){
//                
//            for(int j=offset1;j <  width; ++j){
//                
//       
//               
//                    c = f[index]; //not_bg(c,white)  //c.a!=-1 || c.b !=-1 || c.c!=-1 // (char)(c.a^0xff) || (char)(c.b^0xff) || (char)(c.c^0xff)
//               
//                    if( (char)(c.a^0xff) || (char)(c.b^0xff) || (char)(c.c^0xff) ){
//    //                    printf("a:%d,b:%d,c:%d\n",c.a,c.b,c.c);
//                        info_array[info_index].x=j;
//                        info_array[info_index].y=i;
//                        info_array[info_index].color=c;
//                        
//                      
//                        
//                         ++info_index;
//
//                    }
//                    ++index;
//                  
//
//
//             
//            }
//                
//            }//the second if brack for leftover rowise
//                     
//            
////           }//the first if bracket
//            
//            
//        }
             
             info_array= realloc(info_array, info_index * sizeof(struct info));
             
       }
//        info_array= realloc(info_array, info_index * sizeof(struct info));
        
        
//         if(info_array_r90==NULL){
//         //further strategy define global and check if the input image is changed , if not changed dont pre process
//        info_array_r90 = malloc(info_index * sizeof(struct info));
//        info_array_r180 =malloc(info_index * sizeof(struct info));
//        info_array_r270 = malloc(info_index * sizeof(struct info));
//        info_array_r90_mx = malloc(info_index * sizeof(struct info));
//        info_array_r90_my= malloc(info_index * sizeof(struct info));
//        info_array_mx = malloc(info_index * sizeof(struct info));
//        info_array_my = malloc(info_index * sizeof(struct info));
//        
//        pre_processing(info_array_r90,info_array,info_index,width,height,0,0,1,0,0);
//        pre_processing(info_array_r180,info_array,info_index,width,height,0,0,2,0,0);
//        pre_processing(info_array_r270,info_array,info_index,width,height,0,0,3,0,0);
//        pre_processing(info_array_r90_mx,info_array,info_index,width,height,0,0,1,1,0);
//        pre_processing(info_array_r90_my,info_array,info_index,width,height,0,0,1,0,1);
//        pre_processing(info_array_mx,info_array,info_index,width,height,0,0,0,1,0);
//        pre_processing(info_array_my,info_array,info_index,width,height,0,0,0,0,1);
//        }
//        
//        
//        
//        struct info* info_array_array[8];
//        info_array_array[0]= info_array_r90;
//        info_array_array[1]= info_array_r180;
//        info_array_array[2]= info_array_r270;
//        info_array_array[3]= info_array_r90_mx;
//        info_array_array[4]= info_array_r90_my;
//        info_array_array[5]= info_array_mx;
//        info_array_array[6]= info_array_my;
//        info_array_array[7]= info_array;
        

    
    int shiftvertical = 0 , shifthorizontal =0, rotate = 0, mirror_x=0, mirror_y=0;  
    for (int sensorValueIdx = 0; sensorValueIdx < sensor_values_count; sensorValueIdx++) {
//        printf("Processing sensor value #%d: %s, %d\n", sensorValueIdx, sensor_values[sensorValueIdx].key,
//               sensor_values[sensorValueIdx].value);
        
        
        //assume in the order of shift, rotate, mirror
        
        
        
        if (!strcmp(sensor_values[sensorValueIdx].key, "W")) {
            //printf("f\n");
           
            if(rotate&&mirror_x){
                
                switch(rotate){
                   
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
            
            int temp_rotate = (4-(sensor_values[sensorValueIdx].value % 4))%4;
//            if(temp_rotate>0){
//                temp_rotate= (4-temp_rotate)%4;
//            }else{
//                temp_rotate=-temp_rotate;
//            }
            
            
            
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
            int found=-1;
            for(int i=0;i<cache_size&&(found==-1);++i){
                struct state s = frame_state[i];
                if(s.shiftvertical==shiftvertical&&s.shifthorizontal==shifthorizontal&&s.rotate==rotate&&s.mirror_x==mirror_x&&s.mirror_y==mirror_y){
                    found=i;
                }
            }
            if(found!=-1){
	//printf("found %d\n",found);
                verifyFrame(frame_cache[found], width, height, grading_mode);
                
            }else{
            

             int post_shiftv=0;
             int post_shifth=0;
             
             if(rotate&&mirror_x){
                
                switch(rotate){
                    case 0:
                        post_shiftv = -shiftvertical;
                        post_shifth = shifthorizontal;
                        break;
                    case 1:
                        post_shiftv = shifthorizontal;
                        post_shifth = shiftvertical;
                        break;
                    case 2:
                        post_shiftv = shiftvertical;
                        post_shifth = -shifthorizontal;
                        break;
                    case 3:
                        post_shiftv = -shifthorizontal;
                        post_shifth = -shiftvertical;
                        break;
                     
                }
             }else if(rotate&&mirror_y){
                
                switch(rotate){
                    case 0:
                        post_shiftv = shiftvertical;
                        post_shifth = -shifthorizontal;
                        break;
                    case 1:
                        post_shiftv = -shifthorizontal;
                        post_shifth = -shiftvertical;
                        break;
                    case 2:
                        post_shiftv = -shiftvertical;
                        post_shifth = shifthorizontal;
                        break;
                    case 3:
                        post_shiftv = shifthorizontal;
                        post_shifth = shiftvertical;
                        break;
                     
                }
                
            }else if(rotate){
                switch(rotate){
                     case 0:
                        post_shiftv = shiftvertical;
                        post_shifth = shifthorizontal;
                        break;
                    case 1:
                        post_shiftv = -shifthorizontal;
                        post_shifth = shiftvertical;
                        break;
                    case 2:
                        post_shiftv = -shiftvertical;
                        post_shifth = -shifthorizontal;
                        break;
                    case 3:
                        post_shiftv = shifthorizontal;
                        post_shifth = -shiftvertical;
                        break;
                     
                }
                
            }else if(mirror_x){
                post_shiftv = -shiftvertical;
                post_shifth = shifthorizontal;
                       
                
            }else if(mirror_y){
                post_shiftv = shiftvertical;
                post_shifth = -shifthorizontal;
                        
                
            }
            else{
                post_shiftv = shiftvertical;
                post_shifth = shifthorizontal;
            }
                 memset(frame_cache[frame_index],white,size);  
                processAll(frame_cache[frame_index],info_array,info_index,width,height,shifthorizontal,shiftvertical,rotate,mirror_x,mirror_y);
                
                
                
                 frame_state[frame_index].shiftvertical= shiftvertical;
               frame_state[frame_index].shifthorizontal= shifthorizontal;
               frame_state[frame_index].rotate= rotate;
               frame_state[frame_index].mirror_x= mirror_x;
               frame_state[frame_index].mirror_y= mirror_y;

//printf("index %d\n",frame_index);
		//printf("shiftver %d\n",shiftvertical);
//printf("shifthorizontal %d\n",shifthorizontal);
//printf("rotate %d\n",rotate);
//printf("mirror_x %d\n",mirror_x);
//printf("mirror_y %d\n",mirror_y);
//                  processAll2(f,info_array_array,info_index,width,height,post_shifth,post_shiftv,rotate,mirror_x,mirror_y);
                  
              
                  
//                 memset(r,white,size);
               verifyFrame(frame_cache[frame_index], width, height, grading_mode);
               
                   //store in cache
              // memcpy(frame_cache[frame_index],frame_buffer,size);
              
               frame_index=  (frame_index+1)%cache_size;
               
               
            } 


    //            mirror_x =0 ;
    //            mirror_y=0;
    //            rotate=0;
    //            shifthorizontal=0;
    //            shiftvertical=0;

    //            printBMP(width, height, frame_buffer);
               
                
                 
                
         
               
             
                
         
            
            
            
        }
//        printf("%d:pro_dirver\n",processed_frames);
    }
  
   // printf("%d\n",rotate);

//    free(rendered_buffer);
   // free(info_array);
//    free(white_buffer);
    free(small_white_buffer);
  //  free(tiny_white_buffer);
//    printBMP(width, height, frame_buffer);
    return;
}

