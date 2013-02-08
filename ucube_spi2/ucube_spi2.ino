#include <SPI.h>



#define PIN_SCK          13             // SPI clock
#define PIN_MISO         12             // SPI data input  - ser-out
#define PIN_MOSI         11             // SPI data output //not used
#define PIN_SS1          10             // SPI hardware default SS pin latch

//36 / 288 is highest tested
int numBytes = 49;
char values[392];


void setup() {
  Serial.begin(115200);
  SPI.begin();
  
  establishContact();
}


void loop() {
  
  readRegister(0x00, numBytes, values);
  
  for(int i = 0; i < numBytes; i++) {
  Serial.print((byte)values[i], BIN);
  }
  Serial.print('\n');
  
  delay(20);
}



void readRegister(char address, int numBytes, char * values) {
 
  digitalWrite(PIN_SS1,LOW);
  
  char reg = address;
  
  for(int i = 0; i < numBytes; i++) {
   
   values[i] = SPI.transfer(reg);
   delayMicroseconds(150);
   
   //reg = reg << 8;
   //delay(200);
   
  }
 
  
  digitalWrite(PIN_SS1, HIGH);
  
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("hello");   // send a starting message
    delay(300);
  }
}
