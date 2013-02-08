/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.
 
  This example code is in the public domain.
 */

int sensorPin = A5;
int val = 0;

void setup() {                
  // initialize the digital pin as an output.
  // Pin 13 has an LED connected on most Arduino boards:
  pinMode(3, OUTPUT);
  pinMode(A5, INPUT);
  Serial.begin(9600);  
}

void loop() {
//  digitalWrite(12, HIGH);   // set the LED on
//  delay(1000);              // wait for a second
//  digitalWrite(12, LOW);    // set the LED off
//  delay(1000);              // wait for a second
val = analogRead(sensorPin);
Serial.println(val, DEC);

if (val < 1023) {
 analogWrite(3, val/8); 
}
else {
 analogWrite(3, LOW); 
}


}
