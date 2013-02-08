#include <SoftwareSerial.h>

//Define the Pin Numbers of the Voicebox shield for the sketch.
//#define E0  5
//#define E1  6
//#define E2  7
//#define E3  8
//#define E4  9
//#define E5  10
//#define E6  11
//#define E7  12
//
//#define RDY  13
//#define RES  3
#define SPK  4

//Pin 2 of the shield should be wired to the TTS256 chip.
#define txPin  2

SoftwareSerial sjSerial = SoftwareSerial(0, txPin);

void setup() {
 
 pinMode(SPK, INPUT);
 pinMode(txPin, OUTPUT);
 
sjSerial.begin(9600);

delay(1000);
sjSerial.println("hello, bitches");

  
}

void loop() {
  
}
