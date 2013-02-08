
/* Simon Sketch - A Simon Tweak from SparkFun */

//define pins for led's and buttons
#define blueLed 13
#define yellowLed 3
#define redLed 5
#define greenLed 10

#define blueButton 12
#define yellowButton 2
#define redButton 6
#define greenButton 9

int leftPot = A0;
int rightPot = A1;
int lightSensor = A4;
int sizePot = A5;

int buttonState;  //variable to detect button press
int numButtons = 4;  //numer of buttons
int buttons[] = {  //put our buttons in an array 
  blueButton, yellowButton, redButton, greenButton};
int leds[] = { //put our led's in an array
  blueLed, yellowLed, redLed, greenLed};

void setup() {

  //init our pins - input for buttons, output for led's
  for(int i = 0; i < numButtons; i++) {
    pinMode(buttons[i], INPUT);
    pinMode(leds[i], OUTPUT);
    digitalWrite(buttons[i], HIGH);  //init internal pull-up on button pins
  }

  Serial.begin(9600);  //begin serial communication
  establishContact();
}

void loop() {

  if (Serial.available() > 0) {

  int inByte = Serial.read();

  int leftPotVal = analogRead(leftPot);
  leftPotVal = map(leftPotVal, 0, 1023, 0, 255);
  Serial.print(leftPotVal, DEC);
  Serial.print(";");
  int rightPotVal = analogRead(rightPot);
  Serial.print(rightPotVal, DEC);
  Serial.print(";");
  int sizePotVal = analogRead(sizePot);
  Serial.print(sizePotVal, DEC);
  Serial.print(";");
  int lightSensorVal = analogRead(lightSensor);
  Serial.print(lightSensorVal, DEC);



  //read buttons
  for(int i = 0; i < numButtons; i ++) {

    //is there a press?
    buttonState = digitalRead(buttons[i]);

    //if so, light up the corresponding led, and send the value to processing via serial
    if (buttonState == 0) {
      digitalWrite(leds[i], HIGH);
      Serial.print(";");
      Serial.print(buttons[i]);
      delay(100);
      digitalWrite(leds[i], LOW); 
    } 
  }
  Serial.print('\n');

}


}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("hello");   // send a starting message
    delay(300);
  }
}






