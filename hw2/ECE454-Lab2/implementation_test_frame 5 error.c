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
    int x,y;
    struct _three_byte_ color;
    //char pad;
    
};


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



void processAll(char* rendered_frame,struct info* info_array,int obj_size , unsigned width, unsigned height,
                               int x, int y,int rotate_iteration,int mirror_x, int mirror_y) {
    
    struct _three_byte_* r = (struct _three_byte_*)rendered_frame;
     int v1,h1,v2,h2,v3,h3,v4,h4,v5,h5,v6,h6;
    
         
         
    int ix1,ix2,ix3;
    int iy1,iy2,iy3;
    struct info inf1,inf2,inf3,inf4,inf5,inf6;
    struct _three_byte_ c1,c2,c3;
#define unroll_factor 6
    int iter = obj_size/unroll_factor;
    int leftover = obj_size%unroll_factor;
    int offset= obj_size-leftover;
   
    
//    printf("%d,%d,%d\n",iter,leftover,offset);

    
    #define for_looper(statement) for(int j = 0;j<obj_size;++j){\
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
                    case 1: for_looper(rotate_90);break;//fptr=&rotate_90_f;break;//for_looper(rotate_90); break;
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
    
    
            int size= width*height*sizeof(struct _three_byte_);
//        unsigned char* rendered_buffer = allocateFrame(width,height);
//        char rendered_buffer[width*height*3];
        struct info* info_array=  (struct info*)malloc((width * height) * sizeof(struct info));
//        bzero(info_array,zero);
        struct _three_byte_* f = (struct _three_byte_*)frame_buffer;
//         struct _three_byte_* r = (struct _three_byte_*)rendered_buffer;
        
        int white = 0xffffff;
        
        int info_index=0;
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
        

        
 for(int i=0;i< height; ++i  ){
            

             int index=i*width;
            

            
            for(int si=0; si<row_partition_ratio; ++si){
                
                int offset= si*small_width;
                if(memcmp(&f[index+offset],small_white_buffer,small_row_size)){
                    int j2_end= offset+small_width;
                    for(int j2=offset;j2< j2_end; j2=j2+1){
                       
                            c = f[index+j2];
                            if( (char)(c.a^0xff) || (char)(c.b^0xff) || (char)(c.c^0xff) ){
                               info_array[info_index].x=j2;
                               info_array[info_index].y=i;
                               info_array[info_index].color=c;
                               
                               
                                ++info_index;
                           }
                            
                     
//                    ++index;
                    }
                }    
            }
           
            index+=offset1;
            
            if( leftover&&memcmp(&f[index],small_white_buffer,leftover_row_size)){
                
            for(int j=offset1;j <  width; ++j){
                
       
               
                    c = f[index]; //not_bg(c,white)  //c.a!=-1 || c.b !=-1 || c.c!=-1 // (char)(c.a^0xff) || (char)(c.b^0xff) || (char)(c.c^0xff)
               
                    if( (char)(c.a^0xff) || (char)(c.b^0xff) || (char)(c.c^0xff) ){
    //                    printf("a:%d,b:%d,c:%d\n",c.a,c.b,c.c);
                        info_array[info_index].x=j;
                        info_array[info_index].y=i;
                        info_array[info_index].color=c;
                        
                      
                        
                         ++info_index;

                    }
                    ++index;
                  


             
            }
                
            }//the second if brack for leftover rowise
                     
            
//           }//the first if bracket
            
            
        }
        
        info_array= realloc(info_array, info_index * sizeof(struct info));
        
        
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
            if(mirror_x==1){
                switch(temp_rotate){
                    case 0:
                        break ;
                    case 1:
                        rotate += 3;
                        break;
                    case 2:
                        mirror_x = 0;
                        mirror_y = 1;
                        break;
                    case 3:
                        rotate += 1;
                        break;
                     
                }
                
            }else if(mirror_y==1){
                switch(temp_rotate){
                    case 0:
                        break ;
                    case 1:
                        rotate += 3;
                        break;
                    case 2:
                        mirror_x = 1;
                        mirror_y = 0;
                        break;
                    case 3:
                        rotate += 1;
                        break;
                     
                }
                
            }else{
                rotate+=temp_rotate;
            }
            rotate = (4+rotate)%4;
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
            rotate = (4+rotate)%4;
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
                rotate = (4+rotate)%4;
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
                rotate = (4+rotate)%4;
            }
            
            //frame_buffer = processMirrorY(frame_buffer, width, height, sensor_values[sensorValueIdx].value);
//            printBMP(width, height, frame_buffer);
        }
        processed_frames += 1;
        if (processed_frames % 25 == 0) {
            rotate=(rotate+4)%4;
            
//            printf("%d:v\n",shiftvertical);
//            printf("%d:h\n",shifthorizontal);
//            printf("%d:r\n",rotate);
//             printf("%d:x\n",mirror_x);
//            printf("%d:y\n",mirror_y);

                 memset(f,white,size);  
                processAll(frame_buffer,info_array,info_index,width,height,shifthorizontal,shiftvertical,rotate,mirror_x,mirror_y);
//                 memset(r,white,size);
               verifyFrame(frame_buffer, width, height, grading_mode);
             
               
                
                 
                
         
               
             
                
         
            
            
            
        }
//        printf("%d:pro_dirver\n",processed_frames);
    }
  
   // printf("%d\n",rotate);

//    free(rendered_buffer);
    free(info_array);
//    free(white_buffer);
    free(small_white_buffer);
  //  free(tiny_white_buffer);
//    printBMP(width, height, frame_buffer);
    return;
}

