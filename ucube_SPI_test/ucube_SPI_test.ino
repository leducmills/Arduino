/* SPI test code for shift-in boards
 * using CD4021BE IC's
 * by Ben Leduc-Mills
 */


#include <SPI.h>




                       //uno //mega
#define PIN_SCK           13//52             // SPI clock - blue
#define PIN_MISO          12//50             // SPI data input  - ser-out - green
#define PIN_MOSI          //11                 // SPI data output //not used
#define PIN_SS1           10//53             // SPI hardware default SS pin latch - yellow

//#define PIN_SCK           52             // SPI clock - blue
//#define PIN_MISO          50             // SPI data input  - ser-out - green
//#define PIN_MOSI          //11                 // SPI data output //not used
//#define PIN_SS1           53             // SPI hardware default SS pin latch - yellow

//numBytes = number of chained boards
int numBytes = 49;
char values[392];

//int numBytes = 44;
//char values[352];


void setup() {
  SPI.setClockDivider(SPI_CLOCK_DIV32);
  //SPI.setDataMode(SPI_MODE0);
  Serial.begin(115200);
  //Serial.begin(9600);
  SPI.begin();
  

  establishContact();  //serial handshake function for processing
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
    delayMicroseconds(20);

  }
  
  digitalWrite(PIN_SS1, HIGH);

}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("hello");   // send a starting message
    delay(300);
  }
}

