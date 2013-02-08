#define clockPin 13
#define dataPin 12
#define PIN_latch 10

int numBytes = 6;

//byte incoming;

void setup() {
  Serial.begin(9600);
  pinMode(dataPin, INPUT);
  pinMode(clockPin, OUTPUT);
}


void loop() {



  for(int i = 0; i < numBytes; i++) {

     
    byte incoming = shiftIn(dataPin, clockPin, MSBFIRST);
    Serial.print(incoming);
    delay(100);
  }
  Serial.print('\n');
}

