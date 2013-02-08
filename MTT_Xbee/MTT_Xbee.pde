#define sensorPin 0
#define txLed 2
#define rxLed 3
#define analogLed 9
#define threshold 10

int lastSensorReading = 0;
int inByte = -1;
char inString[6];
int stringPos = 0;


void setup() {

  Serial.begin(19200);

  pinMode(txLed, OUTPUT);
  pinMode(rxLed, OUTPUT);
  pinMode(analogLed, OUTPUT);

  setDestination();
  blink(3);

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

void blink(int howManyTimes) {

  for(int i = 0; i < howManyTimes; i++) {

    digitalWrite(txLed, HIGH);
    delay(200);
    digitalWrite(txLed, LOW);
    delay(200);
  }

}

void loop() {

  if(Serial.available() > 0) {
    digitalWrite(rxLed, HIGH);
    handleSerial();

  }
  else {
    digitalWrite(rxLed, LOW);
  }
  
  char sensorValue = readSensor();
  

  if(sensorValue > 0) {

    digitalWrite(txLed, HIGH);
    Serial.print(sensorValue, DEC);
    Serial.print("\r");

    digitalWrite(txLed, LOW);

  }

}

void handleSerial() {

  inByte = Serial.read();

  if ((inByte >= '0') && (inByte <= '9')) {

    inString[stringPos] = inByte;
    stringPos++;

  }

  if(inByte == '\r') {

    int brightness = atoi(inString);

    analogWrite(analogLed, brightness);

    for(int c = 0; c < stringPos; c++) {

      inString[c] = 0;

    }

    stringPos = 0;

  }

}

char readSensor() {

  char message = 0;

  int sensorReading = analogRead(sensorPin);

  if(abs(sensorReading - lastSensorReading) > threshold) {

    message = sensorReading/4;
    lastSensorReading = sensorReading;

  }

  return message;

}


