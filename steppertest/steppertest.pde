#include <Stepper.h>

#define STEPS 200

Stepper stepper(STEPS, 11, 12);

void setup() {
 
 stepper.setSpeed(200);
 
}

void loop() {
 
  stepper.step(6400); //6400 is a full rotation
  delay(100);
  stepper.step(-6400);
  delay(100);
  
}
