#include <Stepper.h>

#define STEPS 200

Stepper right(STEPS, 6, 7);
Stepper left(STEPS, 11, 12);

void setup() {
 
  right.setSpeed(200);
  left.setSpeed(200);
 
}

void loop() {
  
  right.step(1000);
  left.step(1000);
  delay(100);
  right.step(-1000);
  left.step(-1000);
  delay(100);
  
}
