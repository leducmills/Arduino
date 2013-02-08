#include <Stepper.h>

#define STEPS 200 // 360/1.8 (step angle) = 200 steps/revolution

//declare new stepper objects from stepper library (one per motor)
Stepper right_motor(STEPS, 6, 7); //6=DIR, 7=STEP
Stepper left_motor(STEPS, 11, 12); //11=DIR, 12=STEP

int distance; // how far motors should go
int lowest; // variable to store lowest photocell value
int i; // for looping
// variables for 4 photocell values
int photo_up;
int photo_down;
int photo_left;
int photo_right;

void setup() {
Serial.begin(9600); //start serial printout so we can see stuff
// set motor speeds (in RPM)
right_motor.setSpeed(200);
left_motor.setSpeed(200);
}

void loop() {
//read and print all photocell values from analog pins 0-3
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

//store photocell values in an array
int photoValues[]= {photo_up, photo_down, photo_left, photo_right};
lowest = 9999; //set this higher than possible photocell values

//loop to find lowest photocell value
for(i = 0; i < 4; i++) //4 = number of photocells
{
Serial.println(photoValues[i]); //prints out photoValue array
//assign actual photocell value to "lowest" variable if it's lower
//than whatever "lowest" is set to (starts at 9999)
if (lowest >= photoValues[i] ) {
lowest = photoValues[i];
}

//print it out to confirm that the lowest value is being selected
Serial.print("lowest:");
Serial.println(lowest);
delay(1000); //wait one second before looping so we can read the values
}//end for

distance = lowest; //set travel distance variable = lowest value
//find the sensor that matched the lowest, go that direction
//see below for what the up, down, left, right functions do
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
}//end loop

/*
Here are the directional functions. Loop size = distance.
Positive step numbers are clockwise, negative counterclockwise
*/

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
