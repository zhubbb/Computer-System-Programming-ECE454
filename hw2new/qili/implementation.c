#include <stdio.h>
#include <string.h>
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
unsigned char *processMoveUp(unsigned char *buffer_frame, unsigned width, unsigned height, int offset) {
    return processMoveUpReference(buffer_frame, width, height, offset);
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
    return processMoveRightReference(buffer_frame, width, height, offset);
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
    return processMoveDownReference(buffer_frame, width, height, offset);
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
    return processMoveLeftReference(buffer_frame, width, height, offset);
}

/***********************************************************************************************************************
 * @param buffer_frame - pointer pointing to a buffer storing the imported 24-bit bitmap image
 * @param width - width of the imported 24-bit bitmap image
 * @param height - height of the imported 24-bit bitmap image
 * @param rotate_iteration - rotate object inside frame buffer clockwise by 90 degrees, <iteration> times
 * @return - pointer pointing a buffer storing a modified 24-bit bitmap image
 * Note: You can assume the frame will always be square and you will be rotating the entire image
 **********************************************************************************************************************/
unsigned char *processRotateCW(unsigned char *buffer_frame, unsigned width, unsigned height,
                               int rotate_iteration) {
    return processRotateCWReference(buffer_frame, width, height, rotate_iteration);
}

/***********************************************************************************************************************
 * @param buffer_frame - pointer pointing to a buffer storing the imported 24-bit bitmap image
 * @param width - width of the imported 24-bit bitmap image
 * @param height - height of the imported 24-bit bitmap image
 * @param rotate_iteration - rotate object inside frame buffer counter clockwise by 90 degrees, <iteration> times
 * @return - pointer pointing a buffer storing a modified 24-bit bitmap image
 * Note: You can assume the frame will always be square and you will be rotating the entire image
 **********************************************************************************************************************/
unsigned char *processRotateCCW(unsigned char *buffer_frame, unsigned width, unsigned height,
                                int rotate_iteration) {
    return processRotateCCWReference(buffer_frame, width, height, rotate_iteration);
}

/***********************************************************************************************************************
 * @param buffer_frame - pointer pointing to a buffer storing the imported 24-bit bitmap image
 * @param width - width of the imported 24-bit bitmap image
 * @param height - height of the imported 24-bit bitmap image
 * @param _unused - this field is unused
 * @return
 **********************************************************************************************************************/
unsigned char *processMirrorX(unsigned char *buffer_frame, unsigned int width, unsigned int height, int _unused) {
    return processMirrorXReference(buffer_frame, width, height, _unused);
}

/***********************************************************************************************************************
 * @param buffer_frame - pointer pointing to a buffer storing the imported 24-bit bitmap image
 * @param width - width of the imported 24-bit bitmap image
 * @param height - height of the imported 24-bit bitmap image
 * @param _unused - this field is unused
 * @return
 **********************************************************************************************************************/
unsigned char *processMirrorY(unsigned char *buffer_frame, unsigned width, unsigned height, int _unused) {
    return processMirrorYReference(buffer_frame, width, height, _unused);
}

/***********************************************************************************************************************
 * WARNING: Do not modify the implementation_driver and team info prototype (name, parameter, return value) !!!
 *          Do not forget to modify the team_name and team member information !!!
 **********************************************************************************************************************/
void print_team_info(){
    // Please modify this field with something interesting
    char team_name[] = "test4";

    // Please fill in your information
    char student1_first_name[] = "qili";
    char student1_last_name[] = "lu";
    char student1_student_number[] = "1000354537";

    // Please fill in your partner's information
    // If yon't have partner, do not modify this
    char student2_first_name[] = "xian";
    char student2_last_name[] = "zhang";
    char student2_student_number[] = "0000000001";

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
    int shiftvertical = 0 , shifthorizontal =0, rotate = 0, mirror_x=0, mirror_y=0;  
    for (int sensorValueIdx = 0; sensorValueIdx < sensor_values_count; sensorValueIdx++) {
//        printf("Processing sensor value #%d: %s, %d\n", sensorValueIdx, sensor_values[sensorValueIdx].key,
//               sensor_values[sensorValueIdx].value);
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
        	rotate = (4+rotate)%4; //handle negative
            if(shifthorizontal>0)
            {
            	frame_buffer = processMoveRight(frame_buffer, width, height, shifthorizontal);
            }
            else if(shifthorizontal<0)
            {
            	frame_buffer = processMoveLeft(frame_buffer, width, height, -shifthorizontal);
            }
     		if(shiftvertical>0)
            {
            	frame_buffer = processMoveUp(frame_buffer, width, height, shiftvertical);
            }
            else if(shiftvertical<0)
            {
            	frame_buffer = processMoveDown(frame_buffer, width, height, -shiftvertical);
            }
//          if(rotate)
			{
				frame_buffer = processRotateCW(frame_buffer, width, height, rotate);
			}
			if(mirror_x)
			{
				frame_buffer = processMirrorX(frame_buffer, width, height, mirror_x);
			}
			if(mirror_y)
			{
				frame_buffer = processMirrorY(frame_buffer, width, height, mirror_y);
			}
            mirror_x =0 ;
            mirror_y=0;
            rotate=0;
            shifthorizontal=0;
            shiftvertical=0;
            verifyFrame(frame_buffer, width, height, grading_mode);
        }
    }
    return;
}
