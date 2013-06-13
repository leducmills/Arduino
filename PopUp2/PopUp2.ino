/* POP-CAD
 * Ben Leduc-Mills
 * Pins on header, from left to right:
 * top led, mid led, low led, not used, top switch, mid switch, low switch, ground
 */

//int toggle1 = 2; //LED to toggle
//int sense1 = 4; //copper tape switch

int toggleLeds[] = {
  2,3,4};
int capSwitches[] = {
  5,6,7};

int numOuts = 3;

int toggleStates[] = {
  LOW, LOW, LOW};

int calibration[] = {0,0,0};
//int calibration[3];
int previous[] = {0,0,0};
//int previous[3];

void setup() {

  Serial.begin(9600);
  //pinMode(toggle1, OUTPUT);
  
  

  for(int i = 0; i < numOuts; i++) {
    pinMode(toggleLeds[i], OUTPUT);
    
//    previous[i] = 0;
//    calibration[i] = 0;
   
     calibration[i] += readCapacitivePin(capSwitches[i]);
     delay(100);
    
  }

  //  delay(100);

  //  calibration += readCapacitivePin(4);
  //  //
  //  //  //calibration = (calibration + 4) / 8;
  //  Serial.print("Cal:  ");
  //  Serial.println(calibration);

}

void loop() {

  for(int j = 0; j < numOuts; j++) {
    int n = readCapacitivePin(capSwitches[j]);
    Serial.print(j);
    Serial.print(":  ");
    Serial.println(n);

    if(previous[j] <= calibration[j] && n > calibration[j]) {
      if (toggleStates[j] == LOW) toggleStates[j] = HIGH;
      else toggleStates[j] = LOW;
      digitalWrite(toggleLeds[j], toggleStates[j]);
    }

    previous[j] = n;
    delayMicroseconds(500);
  }
}


byte chargeTime(byte pin)
{
  byte mask = (1 << pin);
  byte i;

  DDRB &= ~mask; // input
  PORTB |= mask; // pull-up on

  for (i = 0; i < 16; i++) {
    if (PINB & mask) break;
  }

  PORTB &= ~mask; // pull-up off
  DDRB |= mask; // discharge

  return i;
}







