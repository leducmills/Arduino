/* Driving two stepper motors with an Arduino through Sparkfun's EasyDriver v4.3 By Ben Leduc-Mills and Dustyn Roberts Created: 2010.06 */
#include <Stepper.h>
#define STEPS 200 // 360/1.8 (step angle) = 200 steps/revolution 




//declare new stepper objects from stepper library (one per motor) 
Stepper right_motor(STEPS, 6, 7); //6=DIR, 7=STEP
Stepper left_motor(STEPS, 11, 12); //11=DIR, 12=STEP
void setup() { //set motor speeds (in RPM) 
right_motor.setSpeed(200); 
left_motor.setSpeed(200); 
}
void loop() {
 //step each motor every time through the loop 
right_motor.step(10); 
left_motor.step(10); 
delay(10); //gives the motor a chance to get to new step
}
