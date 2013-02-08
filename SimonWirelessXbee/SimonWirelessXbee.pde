/* Tweaking Simon - Wireless w/ XBee
 * Button presses sent over wireless
 */

#define blueLed 2
#define yellowLed 5
#define redLed 10
#define greenLed 13

#define blueButton 9
#define yellowButton 6
#define redButton 8
#define greenButton 7

int buttonState;
int numButtons = 4;
int buttons[4] = { 
  blueButton, yellowButton, redButton, greenButton};
int leds[4] = { 
  blueLed, yellowLed, redLed, greenLed};

void setup() {

  for(int i = 0; i < numButtons; i++) {
    pinMode(buttons[i], INPUT);
    pinMode(leds[i], OUTPUT); 
  }

  Serial.begin(19200); //change for whatever baud rate your xbees are configured for
  //setDestination(); 
}

void loop() {

  for(int i = 0; i < numButtons; i++) {
    buttonState = digitalRead(buttons[i]);
    
    if (buttonState == HIGH) {
     digitalWrite(leds[i], HIGH);
     Serial.println(buttons[i]);
     digitalWrite(leds[i], LOW); 
    } 
  }
}

void setDestination() {

  Serial.print("+++");

  char thisByte = 0;

  while (thisByte != '\r') {
    if (Serial.available() > 0) {
      thisByte = Serial.read();
    } 
  }

  Serial.print("ATID3334,DH0,DL1,MY0,BD4,WR,CN\r");

}
