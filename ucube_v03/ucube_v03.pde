/* UCube
 * V.03 - new pin assignments to compensate for flipping Y axis
 * Ben Leduc-Mills
 */


//import string library if using arduino v0018 or below

//#include <WString.h>

// define button pins, since pin assignments won't change
// each point has a switch and an xyz coordinate

//setup1
#define b000 69 //A12-15
#define b010 68
#define b020 67
#define b030 66

//setup2
#define b001 61 //A4-A7 
#define b011 60
#define b021 59
#define b031 58

//setup3
#define b002 57 //A0-A3
#define b012 56
#define b022 55
#define b032 54

//setup4
#define b003 12
#define b013 11
#define b023 10  
#define b033 9
//
//setup5
#define b100 53 
#define b110 51
#define b120 49
#define b130 47
//
////setup6
#define b101 65 //A8-A11
#define b111 64
#define b121 63
#define b131 62
//
////setup7
#define b102 52
#define b112 50
#define b122 48
#define b132 46
//
////setup8
#define b103 7
#define b113 6
#define b123 5
#define b133 4
//
////setup9
#define b200 37 
#define b210 35
#define b220 33
#define b230 31
//
////setup10
#define b201 45
#define b211 43
#define b221 41
#define b231 39
//
////setup11
#define b202 44
#define b212 42
#define b222 40
#define b232 38
//
////setup12
#define b203 17
#define b213 16
#define b223 15
#define b233 14
//
//setup13
#define b300 29
#define b310 27
#define b320 25
#define b330 23

////setup14
#define b301 36
#define b311 34
#define b321 32
#define b331 30
//
////setup15
#define b302 28
#define b312 26
#define b322 24
#define b332 22

//setup16
#define b303 3
#define b313 2
#define b323 19
#define b333 18

// ****** number of buttons/nodes in our physical cube ********
const int numOfButtons = 64;

//array of buttons
int buttons[] = {
  b000, b010, b020, b030, //setup1
  b001, b011, b021, b031, //setup2
  b002, b012, b022, b032, //setup3
  b003, b013, b023, b033, //setup4
  //  
  b100, b110, b120, b130, //setup5
  b101, b111, b121, b131, //setup6
  b102, b112, b122, b132, //setup7
  b103, b113, b123, b133, //setup8

  b200, b210, b220, b230, //setup9
  b201, b211, b221, b231, //setup10
  b202, b212, b222, b232, //setup11
  b203, b213, b223, b233, //setup12
  //
  b300, b310, b320, b330, //setup13
  b301, b311, b321, b331, //setup14
  b302, b312, b322, b332, //setup15
  b303, b313, b323, b333  //setup16

};

//array of xyz coordinates
//setup1
String c000 = "0,0,0;";
String c010 = "0,1,0;";
String c020 = "0,2,0;";
String c030 = "0,3,0;";

//setup2
String c001 = "0,0,1;";
String c011 = "0,1,1;";
String c021 = "0,2,1;";
String c031 = "0,3,1;";

//setup3
String c002 = "0,0,2;";
String c012 = "0,1,2;";
String c022 = "0,2,2;";
String c032 = "0,3,2;";

//setup4
String c003 = "0,0,3;";
String c013 = "0,1,3;";
String c023 = "0,2,3;";
String c033 = "0,3,3;";

//setup5
String c100 = "1,0,0;";
String c110 = "1,1,0;";
String c120 = "1,2,0;";
String c130 = "1,3,0;";

//setup6
String c101 = "1,0,1;";
String c111 = "1,1,1;";
String c121 = "1,2,1;";
String c131 = "1,3,1;";

//setup7
String c102 = "1,0,2;";
String c112 = "1,1,2;";
String c122 = "1,2,2;";
String c132 = "1,3,2;";

//setup8
String c103 = "1,0,3;";
String c113 = "1,1,3;";
String c123 = "1,2,3;";
String c133 = "1,3,3;";

//setup9
String c200 = "2,0,0;";
String c210 = "2,1,0;";
String c220 = "2,2,0;";
String c230 = "2,3,0;";

//setup10
String c201 = "2,0,1;";
String c211 = "2,1,1;";
String c221 = "2,2,1;";
String c231 = "2,3,1;";

//setup11
String c202 = "2,0,2;";
String c212 = "2,1,2;";
String c222 = "2,2,2;";
String c232 = "2,3,2;";

//setup12
String c203 = "2,0,3;";
String c213 = "2,1,3;";
String c223 = "2,2,3;";
String c233 = "2,3,3;";

//setup13
String c300 = "3,0,0;";
String c310 = "3,1,0;";
String c320 = "3,2,0;";
String c330 = "3,3,0;";

//setup14
String c301 = "3,0,1;";
String c311 = "3,1,1;";
String c321 = "3,2,1;";
String c331 = "3,3,1;";

//setup15
String c302 = "3,0,2;";
String c312 = "3,1,2;";
String c322 = "3,2,2;";
String c332 = "3,3,2;";

//setup16
String c303 = "3,0,3;";
String c313 = "3,1,3;";
String c323 = "3,2,3;";
String c333 = "3,3,3;";

String coord[] = {
  c000, c010, c020, c030, //setup1
  c001, c011, c021, c031, //setup2
  c002, c012, c022, c032, //setup3
  c003, c013, c023, c033, //setup4

  c100, c110, c120, c130, //setup5
  c101, c111, c121, c131, //setup6
  c102, c112, c122, c132, //setup7
  c103, c113, c123, c133, //setup8

  c200, c210, c220, c230, //setup9
  c201, c211, c221, c231, //setup10
  c202, c212, c222, c232, //setup11
  c203, c213, c223, c233, //setup12

  c300, c310, c320, c330, //setup13
  c301, c311, c321, c331, //setup14
  c302, c312, c322, c332, //setup15
  c303, c313, c323, c333  //setup16
};


void setup() {

  //start serial communitcation
  Serial.begin(19200);

  //init button pins as input
  // pinMode(b1, INPUT);  
  // pinMode(b2, INPUT);

  for (int j = 0; j < numOfButtons; j++ ) {
    pinMode(buttons[j], INPUT);
    //Serial.println(buttons[j]); 
  }

}


void loop() {

  boolean hasCoord;
  for (int i = 0; i < numOfButtons; i++) {

    int reading1 = digitalRead(buttons[i]);

    if(reading1 == HIGH) {

      delay(1);

      int reading2 = digitalRead(buttons[i]);

      if (reading1 == reading2 && reading2 == HIGH ) {   
        hasCoord = true;
        Serial.print(coord[i]);

      }
      if (reading1 != reading2 || reading2 != HIGH ) {
        hasCoord = false; 
      }
    }
  }

  //if(hasCoord == true) {
    Serial.print('\n');
  //}
}


