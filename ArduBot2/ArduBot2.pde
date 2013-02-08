/*
  (Copy and paste)
  Sparkfun Ardubot
  
  Basic control of speed and direction, march 12. 2011
  
  The right motor is controlled by digital pins 9 and 6,
  the left by digital pins 5 and 3.
  The motor driver chip has both its enable pins connected to +5V,
  normally these pins should be connected to a PWM signal
  for speed control.
  PWM motor speed control is still possible, see below.

*/

const byte right1 = 9; // Right motor control 1
const byte right2 = 6; // Right motor control 2

const byte left1 = 5; // Left motor control 1
const byte left2 = 3; // Left motor control 2

void setup(){
  pinMode(right1, OUTPUT); 
  pinMode(right2, OUTPUT); 
  pinMode(left1, OUTPUT); 
  pinMode(left2, OUTPUT);

}

void loop(){
  rightForw(255);              // Full speed (255) forward, right motor
  delay(3000);
  rightBackw(255);
  delay(3000);
  stop();
  leftForw(255);
  delay(3000);
  leftBackw(255);
  delay(3000);
  stop();
}

void rightForw(byte speed){     // Motor code blocks
  digitalWrite(right1, LOW);
  analogWrite(right2, speed);
}
void rightBackw(byte speed){
  analogWrite(right1, speed);
  digitalWrite(right2, LOW);
}

void leftForw(byte speed){
  analogWrite(left1, speed);
  digitalWrite(left2, LOW);
}
void leftBackw(byte speed){
  digitalWrite(left1, LOW);
  analogWrite(left2, speed); 
}

void stop(){
  digitalWrite(left1, LOW);
  digitalWrite(left2, LOW);
  digitalWrite(right1, LOW);
  digitalWrite(right2, LOW);
  delay(100);
}

