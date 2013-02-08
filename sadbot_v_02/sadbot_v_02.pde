// SADbot v.02 
// Dustyn Roberts and Ben Leduc-Mills
// MAY 23, 2010
// Notes: Goes lowest if photocell array indictes a covered sensor, else draws random distance in random direction + bounds checking (allow for any size canvas)


//import stepper library
#include <Stepper.h>  

// should equal the number of steps your motors are rated for
#define STEPS 200

// for bounds checking, define in steps/10 (since we go 10 steps for every 1 in the distance variable)
#define CANVASWIDTH 400
#define CANVASHEIGHT 400

//delare new stepper objects from stepper library (one per motor)
Stepper right_motor(STEPS, 6, 7); // right motor goes to digital pins 6 & 7
Stepper left_motor(STEPS, 11, 12); // left motor goes to digital pins 11 & 12

// how far motors should go
int distance;

//total distance for bounds checking (should be canvaswidth/2 and canvasheight/2 if starting in middle or 0,0 if starting at bottom left)
int totalWidth = CANVASWIDTH/2;
int totalHeight = CANVASHEIGHT/2;

// to store lowest photocell value
int lowest;

// for looping
int i;

// variables for 4 photocells
int photo_up; 
int photo_down;
int photo_left;
int photo_right;

int randomDirection;
int randomDistance;

void setup() {
  
  //start serial so we can print out stuff
  Serial.begin(9600);
  
  // set motor speed (in RPM)
  right_motor.setSpeed(200);
  left_motor.setSpeed(200);
  
  //use random seed to get better random numbers (make sure you set it to an analog pin that you're not using)
  randomSeed(analogRead(4)); 
  
}

void loop() {
  
  //read and print all sensor values from analog pins 0-3
  photo_up = analogRead(0);
  //Serial.print("up");
  //Serial.println(photo_up);
  
  photo_down = analogRead(1);
  //Serial.print("down");
  //Serial.println(photo_down);
  
  photo_left = analogRead(2);
  //Serial.print("left");
  //Serial.println(photo_left);
  
  photo_right = analogRead(3);
  //Serial.print("right");
  //Serial.println(photo_right);
  
  //delay(1000); //give me time to read them in the monitor
  
  //before drawing, check our totalHeight and totalWidth
  Serial.print("totalHeight:");
  Serial.println(totalHeight);
  Serial.print("totaWidth:");
  Serial.println(totalWidth);
  delay(1000);
  
  //store sensor values in an array
  int photoValues[]= {photo_up, photo_down, photo_left, photo_right};
  
  //cycle through sensor values to find lowest
  lowest = 9999; //set this higher than possible values
  
  //4 = number of sensors
  for(i = 0; i < 4; i++) { 
    //Serial.println(photoValues[i]);
    if (lowest >= photoValues[i] ) {
        lowest = photoValues[i];
    }
    //print it out to confirm that the lowest value is being selected
    //Serial.print("lowest:"); 
    //Serial.println(lowest);
    //delay(1000);
  }
  
  //set travel distance = lowest value
  distance = lowest;
  
  //TODO: need to calibrate, 100 is just a guess
  if (lowest < 100 ) {  //if lowest value indicates a covered photocell, draw towards lowest
  
  //find the sensor that matched the lowest, go that direction
    if ((lowest == photoValues[0]) && ((totalHeight + distance) < CANVASHEIGHT)) { 
       up( distance );
       totalHeight += distance;
    }
    else if ((lowest == photoValues[1]) && ((totalHeight - distance) > 0)) { 
       down( distance );
       totalHeight -= distance;
    } 
    else if ((lowest == photoValues[2]) && ((totalWidth - distance) > 0)) { 
       left( distance );
       totalWidth -= distance;
    }
    else if ((lowest == photoValues[3]) && ((totalWidth + distance) < CANVASWIDTH)) { 
       right( distance );
       totalWidth += distance;
    }
    
 
  } else {  //otherwise, no one is covering any sensors, draw according to algorithm 
  
      //pick random number 1-4 to map to direction
      randomDirection = random(1, 9);
      Serial.print("random direction:");
      Serial.println(randomDirection);
      
      //pick random number for distance
      randomDistance = random(1, 200);
      Serial.print("random distance:");
      Serial.println(randomDistance);
      
      switch (randomDirection) {
        
        case 1:  //go up
          if((totalHeight + randomDistance) < CANVASHEIGHT){
            up(randomDistance);
            totalHeight += randomDistance;
          }
          break;
          
        case 2: //go down
          if((totalHeight - randomDistance) > 0){
            down(randomDistance);
            totalHeight -= randomDistance;
          }
          break;
          
        case 3: //go left
          if((totalWidth - randomDistance) > 0){
            left(randomDistance);
            totalWidth -= randomDistance;
          }
          break;
          
        case 4: //go right
          if((totalWidth + randomDistance) < CANVASWIDTH){
            right(randomDistance);
            totalWidth += randomDistance;
          }
          break;
          
        case 5: //go upRight
          if(((totalWidth + randomDistance) < CANVASWIDTH) && ((totalHeight + randomDistance) < CANVASHEIGHT)){
            upRight(randomDistance);
            totalWidth += randomDistance;
            totalHeight += randomDistance;
          }
          break;

        case 6: //go upLeft
          if(((totalWidth - randomDistance) > 0) && ((totalHeight + randomDistance) < CANVASHEIGHT)){
            upLeft(randomDistance);
            totalWidth -= randomDistance;
            totalHeight += randomDistance;
          }
          break;

        case 7: //go downRight
          if(((totalWidth + randomDistance) < CANVASWIDTH) && ((totalHeight - randomDistance) > 0)){
            downRight(randomDistance);
            totalWidth += randomDistance;
            totalHeight -= randomDistance;
          }
          break;

        case 8: //go downLeft
          if(((totalWidth - randomDistance) > 0) && ((totalHeight - randomDistance) > 0)){
            downLeft(randomDistance);
            totalWidth -= randomDistance;
            totalHeight -= randomDistance;
          }
          break;          
        default:  //just in case
          left(0); 
          
      } //end switch
      
  } //end if
  
} //end loop()


//directional functions, loop size = distance

void up(int distance) {
 
  for( i = 0; i < distance; i++){
    right_motor.step(10);
    left_motor.step(-10); 
  }
  Serial.print("went UP:");
  Serial.println(distance);
  delay(200);
}

void down(int distance) {
 
  for( i = 0; i < distance; i++){
    right_motor.step(-10);
    left_motor.step(10); 
  }
  Serial.print("went DOWN:");
  Serial.println(distance);
  delay(200);  
}

void left(int distance) {

  for( i = 0; i < distance; i++){
    right_motor.step(-10);
    left_motor.step(-10); 
  }
  Serial.print("went LEFT:");
  Serial.println(distance);
  delay(200);  
}

void right(int distance) {
 
  for( i = 0; i < distance; i++){
    right_motor.step(10);
    left_motor.step(10);
  }
  Serial.print("went RIGHT:");
  Serial.println(distance);
  delay(200);  
}

void upRight(int distance) {
  for( i = 0; i < distance; i++){
    right_motor.step(20);
    left_motor.step(-2);
  }
  Serial.print("went UpRIGHT:");
  Serial.println(distance);
  delay(200);    
}

void upLeft(int distance) {
  for( i = 0; i < distance; i++){
    right_motor.step(2);
    left_motor.step(-20);
  }  
  Serial.print("went UpLEFT:");
  Serial.println(distance);
  delay(200);  
}

void downRight(int distance) {
  for( i = 0; i < distance; i++){
    right_motor.step(-2);
    left_motor.step(20);
  }
  Serial.print("went DownRIGHT:");
  Serial.println(distance);
  delay(200);
}

void downLeft(int distance) {
  for( i = 0; i < distance; i++){
    right_motor.step(-20);
    left_motor.step(2);
  }
  Serial.print("went DownLEFT:");
  Serial.println(distance);
  delay(200);  
} 
