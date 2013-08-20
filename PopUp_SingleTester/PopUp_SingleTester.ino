/* POP-CAD
 * Ben Leduc-Mills
 * Pins on header, from left to right (with lights facing you):
 * ground, low switch, mid switch, top switch, not used, low LED, mid LED, top LED 
 * 
 * Tower Numbers (with lights facing toward you):
 *     | 1 | 2 | 3 | (furthest)
 *     | 4 | 5 | 6 |
 *     | 7 | 8 | 9 | (closest)
 * 
 * Pin-outs:
 * 
 * Tower 1: 
 * G LS=21 MS=12 TS=11 LL=10 ML=9 TL=8
 * 
 * Tower 2: 
 * G LS=34 MS=24 TS=26 LL=28 ML=30 TL=32
 * 
 * Tower 3:  ********CHANGING******** LS = 54(A0)*61 MS = 55(A1) TS = 56(A2) LL=57(A3) ML=58(A4) TL=59(A5)
 * 
 * 
 * Tower 4:
 * G LS=7 MS=6 TS=5 LL=4 ML=3 TL=2
 *
 * Tower 5:
 * G LS=23 MS=25 TS=27 LL=29 ML=31 TL=33
 *
 * Tower 6:
 * G LS=36 MS=38 TS=40 LL=42 ML=44 TL=46
 *
 * Tower 7:
 * G LS=14 MS=15 TS=16 LL=17 ML=18 TL=19
 *
 * Tower 8:
 * G LS=37 MS=39 TS=41 LL=43 ML=45 TL=47
 * 
 * Tower 9: **************CHANGING************** LS = 64(A10) MS = 65(A11) TS = 66(A12) LL= 67(A13) ML= 68(A14) TL= 69(A15)
 * 
 */
//int capSwitches[] = {
//  10, 11, 12};
//int toggleLeds[] = {
//  7,8,9};

const int NUM = 27;

//int capSwitches[] = {
//  69,68,67};
//int toggleLeds[] = {
//  66,65,64};


int capSwitches[] = {
  21,11,12,  32,30,28,  57,58,59,  5,6,7,  23,25,27,  40,38,36,  20,19,18,  37,39,41, 69,68,67};
int toggleLeds[] = {
  8,9,10,  26,24,22,  54,55,56,  2,3,4,  29,31,33,  50,48,46,  17,16,15,  43,45,47, 66,65,64};

int numOuts = NUM;

int toggleStates[NUM];
int calibration[NUM];
int previous[NUM];


void setup() {

  Serial.begin(115200);
  //establishContact();  // send a byte to establish contact until receiver responds

  //Serial.println(capSwitches[0]);
  for(int i = 0; i < numOuts; i++) {
    pinMode(toggleLeds[i], OUTPUT); 
    calibration[i] += readCapacitivePin(capSwitches[i]);
    delay(100);

  }


}

void loop() {

  //  if (Serial.available() > 0) {

  for(int j = 0; j < numOuts; j++) {
    int n = readCapacitivePin(capSwitches[j]);

    if(previous[j] <= calibration[j] && n > calibration[j]) {
      if (toggleStates[j] == LOW) toggleStates[j] = HIGH;
      else toggleStates[j] = LOW;
      digitalWrite(toggleLeds[j], toggleStates[j]);
    }

    previous[j] = n;
    delayMicroseconds(500);
  }
  //  }

  //print all the states of the LEDs
  for(int k=0; k < numOuts; k++) {
    //Serial.print(toggleStates[k]);
    if(toggleStates[k] == HIGH) {
      Serial.print("1"); 
    }
    else if(toggleStates[k] == LOW) {
      Serial.print("0"); 
    }
  }

  //add a carriage return
  Serial.print("\n");
  //}
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("hello"); 
    delay(300);
  }
}













