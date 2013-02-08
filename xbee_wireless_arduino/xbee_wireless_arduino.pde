/* Programming Arduino Wirelessly
 * ------------
 * This program waits for a *reset serial message from a remote computer,
 * then resets the Arduino chip after a delay to allow the microcontroller to
 * accept an upload of new code from a remote device.
 * Robert Faludi
 * rob@faludi.com
 */
int ledPin = 13; // LED connected to digital pin
int transistorPin = 12; //reset pin 
void setup()  {
  pinMode(ledPin, OUTPUT); // sets the digital pin as output
  pinMode(transistorPin, OUTPUT);
  blinkLED(ledPin, 2, 500); // startup blink
  delay(1000);
  Serial.begin(19200); // start serial at 19200 baud, same as programmer speed
}
void loop()  {
  blinkLED(ledPin, 1, 1300);
  if ( Serial.available() > 0) { // if there are bytes waiting on the serial port
    char inByte = Serial.read(); // read a byte
    Serial.print("received: ");
    Serial.print((char)inByte);
    if (inByte == '*') { // if that byte is the desired character
      Serial.println("received *");
      int len = 5; // expected string is 6 bytes long
      char inString[len]; // declare string variable
      for (int i = 0; i < len; i++) {
        inString[i] = Serial.read();
        
      }
      if ( strstr(inString, "reset") != NULL ) // check to see if the respose is "reset"
        resetChip(5000); // reset the chip after waiting for the specified # of milliseconds
    }
  }
}

void resetChip(int delayTime) {
  /* if the project does not typically receive data, and accidental chip resets are tolerable,
   * this is a simple method that should work just fine. Otherwise it is recommended that the 
   * reset request string be part of a call-response sequence, be transmitted with a
   * reserved byte or byte string, or be transmitted in some way out of band, so that it is not 
   * accidentally received.
   */
  Serial.print("\nArduino will reset in ");
  Serial.print(delayTime/1000, DEC);
  Serial.print(" seconds...\n\r");
  blinkLED(ledPin, delayTime/100, 100); // wait for the specified amount of time, doing nothing
  Serial.print("\nResetting NOW.\n\r");
  digitalWrite(transistorPin, HIGH); // switch on a transistor that pulls the chip's reset pin to ground
}

void blinkLED(int targetPin, int numBlinks, int blinkRate) {
  // this function blinks the an LED light as many times as requested
  for (int i=0; i<numBlinks; i++) {
    digitalWrite(targetPin, HIGH); // sets the LED on
    delay(blinkRate); // waits for a second
    digitalWrite(targetPin, LOW); // sets the LED off
    delay(blinkRate);
  }
}

