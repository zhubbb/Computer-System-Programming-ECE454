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
    
    struct _three_byte_ color;
    char pad;
    short x,y;
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


#define assign_index(i,j,w) (i*w+j)

#define block_size 21
#define not_bg(x,white) (memcmp(&x, &white, 3))


void processAll_reference(unsigned char* rendered_frame,struct info* info_array,int obj_size , unsigned width, unsigned height,
                               int x, int y,int rotate_iteration,int mirror_x, int mirror_y) {
    
//    unsigned int white=  0xffffff;
//    unsigned char* rendered_frame = allocateFrame(width, height);
    
   
    
    struct _three_byte_* r = (struct _three_byte_*)rendered_frame;
//    struct _three_byte_* b = (struct _three_byte_*)buffer_frame;
//        memset(r,white,(width * height * 3) * sizeof(char));  
//    printf("%d w,%d h",width,height);
    
            int v;
        int h;
// printf("%d x\n",x);
        
        int v1,h1;
        int v2,h2;
struct info inf;
void assign_color(){
	r[assign_index(v2,h2,width)]= inf.color;
}



void index_cal(){

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


}

    for(int i =0 ; i < obj_size; ++i){
        inf = info_array[i];
         
      v=inf.y;
       h=inf.x;
// printf("%d x\n",x);
        
        v1=v-y,h1=h+x;
        v2=v1,h2=h1;
//        printf("%d,%d first\n",v2,h2);
       index_cal();
assign_color();
//                        int d1= assign_index(v2,h2,width);
//                        int d2= assign_index(i,j,width);
//
//                        printf("%d,%d\n",v2,h2);
//                        printf("%d :c\n",inf.color);
      
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




    
    

        
    
    

    // there is no leftover//must be square. it did save cache hit. but the time is no improving. the overhead is copy_buffer, cannnot free buffer frame since it is used twice 
//due to the way verify frame is called , you need at least 25 frame to pass the test. e.g CW,1 * 25 times

    








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




void implementation_driver_reference(struct kv *sensor_values, int sensor_values_count, unsigned char *frame_buffer,
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
        
        
        char small_white_buffer[small_row_size];
        memset(small_white_buffer,white,small_row_size);
        
     
        for(int i=0;i< height; ++i  ){
            
       
//          

//            if(memcmp(&f[index],white_buffer,row_size)){ // check if the whole role is white
                
            
        
                
             int index=i*width;
            
         //       printf("%d\n",rs);
            
            
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
            int leftover =width%small_width;    
            int current_row_index=small_width*row_partition_ratio;
            index+=current_row_index;
            
            if( leftover&&memcmp(&f[index],small_white_buffer,leftover*3)){
                
            for(int j=current_row_index;j <  width; ++j){
                
       
               
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
        
        
        //we can clear frame buffer this time
//        memset(f,white,size);
       
        
//        for(int i = 0 ; i< info_index;i++){
//            printf("x:%d,y:%d\n",info_array[i].x,info_array[i].y);
//            printf("c:%d\n",info_array[i].color);
//        }
//        exit(-1);
//        free(&info_array[info_index]);

        

    
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
//            rotate = (4+rotate)%4; //handle negative
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
                 memset(f,white,size);  
                processAll_reference(frame_buffer,info_array,info_index,width,height,shifthorizontal,shiftvertical,rotate,mirror_x,mirror_y);
//                 memset(r,white,size);
               verifyFrame(frame_buffer, width, height, grading_mode);
             


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
    free(info_array);
//    free(white_buffer);
//    printBMP(width, height, frame_buffer);
    return;
}

