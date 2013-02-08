// SADbot v.01 
// Dustyn Roberts and Ben Leduc-Mills
// MAY 23, 2010
// Notes: Goes lowest if photocell array indictes a covered sensor, else draws random distance in random direction

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

int randomDirection;
int randomDistance;

void setup() {
  
  //start serial so we can print out stuff
  Serial.begin(9600);
  
  // set motor speed (in RPM)
  right_motor.setSpeed(200);
  left_motor.setSpeed(200);
  
  //use random seed to get better random numbers
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

    //find the sensor that matched the lowest, go that direction    
    /*switch (lowest) {
      
      case lowest == photoValues[0]: //go up
        up(distance);
        break;
      
      case lowest == photoValues[1]: //go down
        down(distance);
        break;
      
      case lowest == photoValues[2]: //go left
        left(distance);
        break;
        
      case lowest == photoValues[3]: //go right
        right(distance);
        break;
      
      case lowest == photoValue[0] && lowest == photoValue[2]: //up and left
        upLeft(distance);
        break;
        
      case lowest == photoValue[0] && lowest == photoValue[3]: //up right
        upRight(distance);
        break;
      
      case lowest == photoValue[1] && lowest == photoValue[2]: //down and left
        downLeft(distance);
        break;
      
      case lowest == photoValue[1] && lowest == photoValue[3]: //down and right
        downRight(distance);
        break;
      
      default:  //just in case
        right(1);
      
    }*/
    
 
  } else {  //otherwise, no one is covering any sensors, draw according to algorithm 
  
      //pick random number 1-4 to map to direction
      randomDirection = random(1, 5);
      Serial.print("random direction:");
      Serial.println(randomDirection);
      
      //pick random number 1-1024 for distance
      randomDistance = random(1, 200);
      Serial.print("random distance:");
      Serial.println(randomDistance);
      
      switch (randomDirection) {
        
        case 1:  //go up
          up(randomDistance);
          break;
          
        case 2: //go down
          down(randomDistance);
          break;
          
        case 3: //go left
          left(randomDistance);
          break;
          
        case 4: //go right
          right(randomDistance);
          break;
          
        default:  //just in case
          left(1); 
          
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
}

void down(int distance) {
 
  for( i = 0; i < distance; i++){
    right_motor.step(-10);
    left_motor.step(10); 
  }
  Serial.print("went DOWN:");
  Serial.println(distance);
}

void left(int distance) {

  for( i = 0; i < distance; i++){
    right_motor.step(-10);
    left_motor.step(-10); 
  }
  Serial.print("went LEFT:");
  Serial.println(distance);  
}

void right(int distance) {
 
  for( i = 0; i < distance; i++){
    right_motor.step(10);
    left_motor.step(10);
  }
  Serial.print("went RIGHT:");
  Serial.println(distance);  
}

void upRight(int distance) {
  for( i = 0; i < distance; i++){
    right_motor.step(20);
    left_motor.step(-10);
  }
}

void upLeft(int distance) {
  for( i = 0; i < distance; i++){
    right_motor.step(10);
    left_motor.step(-20);
  }  
}

void downRight(int distance) {
  for( i = 0; i < distance; i++){
    right_motor.step(-20);
    left_motor.step(10);
  }
}

void downLeft(int distance) {
  for( i = 0; i < distance; i++){
    right_motor.step(-10);
    left_motor.step(20);
  }  
}
