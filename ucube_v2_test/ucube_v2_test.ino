//**************************************************************//
//  Name    : shiftIn Example 2.1                               //
//  Author  : Carlyn Maw                                        //
//  Date    : 25 Jan, 2007                                      //
//  Version : 1.0                                               //
//  Notes   : Code for using a CD4021B Shift Register    	//
//          :                                                   //
//****************************************************************

//define where your pins are
int latchPin = 8;
int dataPin = 9;
int clockPin = 7;


//number of shift registers
int numReg = 6;

//Define variables to hold the data 
//for each shift register.
//starting with non-zero numbers can help
//troubleshoot
//byte switchVar1 = 72;  //01001000
//byte switchVar2 = 159; //10011111
//byte switchVar3 = 122;

byte s1 = 1;
byte s2 = 2;
byte s3 = 3;
byte s4 = 4;
byte s5 = 5;
byte s6 = 6;
byte s7 = 7;

byte s8 = 8;
byte s9 = 9;
byte s10 = 10;
byte s11 = 11;
byte s12 = 12;
byte s13 = 13;
byte s14 = 14;

byte s15 = 15;
byte s16 = 16;
byte s17= 17;
byte s18 = 18;
byte s19 = 19;
byte s20 = 20;
byte s21 = 21;

byte s22 = 22;
byte s23 = 23;
byte s24 = 24;
byte s25 = 25;
byte s26 = 26;
byte s27 = 27;
byte s28 = 28;

byte s29 = 29;
byte s30 = 30;
byte s31 = 31;
byte s32 = 32;
byte s33 = 33;
byte s34 = 34;
byte s35 = 35;

byte s36 = 36;
byte s37 = 37;
byte s38 = 38;
byte s39 = 39;
byte s40 = 40;
byte s41 = 41;
byte s42 = 42;

byte s43 = 43;
byte s44 = 44;
byte s45 = 45;
byte s46 = 46;
byte s47 = 47;
byte s48 = 48;
byte s49 = 49;

byte shiftRegisters[] = {
  s1, s2, s3, s4, s5, s6, s7,
  s8, s9, s10, s11, s12, s13, s14,
  s15, s16, s17, s18, s19, s20, s21,
  s22, s23, s24, s25, s26, s27, s28, 
  s29, s30, s31, s32, s33, s34, s35,
  s36, s37, s38, s39, s40, s41, s42,
  s43, s44, s45, s46, s47, s48, s49
};

void setup() {
  //start serial
  //Serial.begin(28800);
  Serial.begin(57600);

  //define pin modes
  pinMode(latchPin, OUTPUT);
  pinMode(clockPin, OUTPUT); 
  pinMode(dataPin, INPUT);
  
  //establishContact();

}

void loop() {
 //if (Serial.available() > 0) {
   
   
  //Pulse the latch pin:
  //set it to 1 to collect parallel data
  digitalWrite(latchPin,1);
  //set it to 1 to collect parallel data, wait
  delayMicroseconds(2200);
  //set it to 0 to transmit data serially  
  digitalWrite(latchPin,0);

  //while the shift register is in serial mode
  //collect each shift register into a byte
  //the register attached to the chip comes in first 
//  switchVar1 = shiftIn(dataPin, clockPin);
//  switchVar2 = shiftIn(dataPin, clockPin);
//  switchVar3 = shiftIn(dataPin, clockPin);



for (int i = 0; i < numReg; i++) {
 shiftRegisters[i] = shiftIn(dataPin, clockPin); 
}



  //Print out the results.
  //leading 0's at the top of the byte 
  //(7, 6, 5, etc) will be dropped before 
  //the first pin that has a high input
  //reading  
//  Serial.print(switchVar1, BIN);
//  
//  Serial.print(switchVar2, BIN);
//  
//  Serial.println(switchVar3, BIN);

for (int j = 0; j < numReg; j++) {
 Serial.print(shiftRegisters[j], BIN); 
}

Serial.print('\n');

//white space
//Serial.println("-------------------");
//delay so all these print satements can keep up. 
//delay(50);
delay(1200);
 //}

}

//------------------------------------------------end main loop

////// ----------------------------------------shiftIn function
///// just needs the location of the data pin and the clock pin
///// it returns a byte with each bit in the byte corresponding
///// to a pin on the shift register. leftBit 7 = Pin 7 / Bit 0= Pin 0

byte shiftIn(int myDataPin, int myClockPin) { 
  int i;
  int temp = 0;
  int pinState;
  byte myDataIn = 0;

  pinMode(myClockPin, OUTPUT);
  pinMode(myDataPin, INPUT);

//we will be holding the clock pin high 8 times (0,..,7) at the
//end of each time through the for loop

//at the begining of each loop when we set the clock low, it will
//be doing the necessary low to high drop to cause the shift
//register's DataPin to change state based on the value
//of the next bit in its serial information flow.
//The register transmits the information about the pins from pin 7 to pin 0
//so that is why our function counts down
  for (i=7; i>=0; i--)
  {
    digitalWrite(myClockPin, 0);
    delayMicroseconds(2);
    temp = digitalRead(myDataPin);
    if (temp) {
      pinState = 1;
      //set the bit to 0 no matter what
      myDataIn = myDataIn | (1 << i);
    }
    else {
      //turn it off -- only necessary for debuging
     //print statement since myDataIn starts as 0
      pinState = 0;
    }

    //Debuging print statements
    //Serial.print(pinState);
    //Serial.print("     ");
    //Serial.println (dataIn, BIN);

    digitalWrite(myClockPin, 1);

  }
  //debuging print statements whitespace
  //Serial.println();
  //Serial.println(myDataIn, BIN);
  return myDataIn;
}


//void establishContact() {
//  while (Serial.available() <= 0) {
//    Serial.println("hello");   // send a starting message
//    delay(300);
//  }
//}
