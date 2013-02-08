//import stepper library
#include <Stepper.h>  

// should equal the number of steps your motors are rated for
#define STEPS 200

//delare new stepper objects from stepper library (one per motor)
Stepper right_motor(STEPS, 6, 7); // right motor goes to digital pins 6 & 7
Stepper left_motor(STEPS, 11, 12); // left motor goes to digital pins 11 & 12

// how far motors should go
int distance;

// to store lowest photocell value
int lowest;

// for looping
int i;

// variables for 4 photocells
int photo_up; 
int photo_down;
int photo_left;
int photo_right;

void setup() {
  
  //start serial so we can print out stuff
  Serial.begin(9600);
  
  // set motor speed (in RPM)
  right_motor.setSpeed(200);
  left_motor.setSpeed(200);
}

void loop() {
  
  //read and print all sensor values from analog pins 0-3
  photo_up = analogRead(0);
  Serial.print("up");
  Serial.println(photo_up);
  
  photo_down = analogRead(1);
  Serial.print("down");
  Serial.println(photo_down);
  
  photo_left = analogRead(2);
  Serial.print("left");
  Serial.println(photo_left);
  
  photo_right = analogRead(3);
  Serial.print("right");
  Serial.println(photo_right);
  
  delay(1000); //give me time to read them in the monitor
  
  //store sensor values in an array
  int photoValues[]= {photo_up, photo_down, photo_left, photo_right};
  
  //cycle through sensor values to find lowest
  lowest = 9999; //set this higher than possible values
  
  //4 = number of sensors
  for(i = 0; i < 4; i++) { 
    Serial.println(photoValues[i]);
    if (lowest >= photoValues[i] ) {
        lowest = photoValues[i];
    }
    //print it out to confirm that the lowest value is being selected
    Serial.print("lowest:"); 
    Serial.println(lowest);
    delay(1000);
  }
  
  //set travel distance = lowest value
  distance = lowest;
  
  //find the sensor that matched the lowest, go that direction
  if (lowest == photoValues[0]) { 
     up( distance );
  }
  else if (lowest == photoValues[1]) { 
     down( distance );
  } 
  else if (lowest == photoValues[2]) { 
     left( distance );
  }
  else if (lowest == photoValues[3]) { 
     right( distance );
  }
}

//directional functions, loop size = distance

void up(int distance) {
 
  for( i = 0; i < distance; i++){
    right_motor.step(10);
    left_motor.step(-10); 
  }
}

void down(int distance) {
 
  for( i = 0; i < distance; i++){
    right_motor.step(-10);
    left_motor.step(10); 
  }
}

void left(int distance) {

  for( i = 0; i < distance; i++){
    right_motor.step(-10);
    left_motor.step(-10); 
  }
}

void right(int distance) {
 
  for( i = 0; i < distance; i++){
    right_motor.step(10);
    left_motor.step(10);
  }
}
