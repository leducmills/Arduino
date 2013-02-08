#include <Stepper.h>

#define STEPS 200

Stepper right_motor(STEPS, 6, 7);
Stepper left_motor(STEPS, 11, 12);

int distance;
int i;

void setup() {
  
  Serial.begin(9600);
  right_motor.setSpeed(200);
  left_motor.setSpeed(200);
}

void loop() {

    
  distance = analogRead(0); //right photocell

  right(distance);
  
  delay(1000);
  
  distance = analogRead(1); //left photocell

  left(distance);

  delay(1000);

  distance = analogRead(2); //up photocell
 
  up(distance);

  delay(1000);

  distance = analogRead(3); //down photocell
 
  down(distance);  

  delay(1000);
}

void right(int distance) {
 
  for( i = 0; i < distance; i++){
    right_motor.step(1);
    left_motor.step(1);
  }
  Serial.print("right:");
  Serial.println(distance);  
}

void left(int distance) {

  for( i = 0; i < distance; i++){
    right_motor.step(-1);
    left_motor.step(-1); 
  }
  Serial.print("left:");
  Serial.println(distance);    
}

void up(int distance) {
 
  for( i = 0; i < distance; i++){
    right_motor.step(1);
    left_motor.step(-1); 
  }
  Serial.print("up:");
  Serial.println(distance); 
}

void down(int distance) {
 
  for( i = 0; i < distance; i++){
    right_motor.step(-1);
    left_motor.step(1); 
  }
  Serial.print("down:");
  Serial.println(distance);   
}
