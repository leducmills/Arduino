/* Xbee Pong 
 * Send value over wireless xbee to control pong paddle in processing
 */

int paddlePin = A0;
//int buttonPin = 3;


void setup() {

  pinMode(paddlePin, INPUT);
  //pinMode(buttonPin, INPUT);
  Serial.begin(19200);

}


void loop() {

     int paddleVal = analogRead(paddlePin);
     Serial.print(paddleVal);
     delay(10);

//  if(digitalRead(buttonPin) == LOW) {
//   Serial.print('b');
//   delay(10); 
//  }

}

