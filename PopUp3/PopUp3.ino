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
 * G LS=13 MS=12 TS=11 LL=10 ML=9 TL=8
 * 
 * Tower 2: 
 * G LS=22 MS=24 TS=26 LL=28 ML=30 TL=32
 * 
 * Tower 3:
 * G LS=A8 MS=A9 TS=A10 LL=A11 ML=A12 TL=13 //A8 = 62, A9 = 63, A10 = 64, A11 = 65, A12 = 66, A13 = 67
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
 * Tower 9:
 * G LS=48 MS=50 TS=52 LL=49 ML=51 TL=53
 */
int capSwitches[] = {13,12,11,22,24,26,62,63,64,7,6,5,23,25,27,36,38,40,14,15,16,37,39,41,48,50,52};
int toggleLeds[] = {10,9,8,28,30,32,65,66,67,4,3,2,29,31,33,42,44,46,17,18,19,43,45,47,49,51,53};

int numOuts = 27;

int toggleStates[27];
int calibration[27];
int previous[27];


void setup() {

  Serial.begin(9600);
  
  for(int i = 0; i < numOuts; i++) {
    pinMode(toggleLeds[i], OUTPUT); 
    calibration[i] += readCapacitivePin(capSwitches[i]);
    delay(100);
    
  }
}

void loop() {

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
   
   //print all the states of the LEDs
   for(int k=0; k <sizeof(toggleStates); k++) {
     Serial.print(toggleStates[k]);
   }
   
   //add a carriage return
   Serial.print("\n");
    
}







