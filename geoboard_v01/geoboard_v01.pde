/* 3D Geoboard
 * V.01 - first try with a 4 x 4 x 4 cube - no shift reg
 * Ben Leduc-Mills
*/


//import string library if using arduino v0018 or below

//#include <WString.h>

// define button pins, since pin assignments won't change
// each point has a switch and an xyz coordinate
//#define b000 2
//#define b001 3
//#define b002 4
//#define b003 5
//#define b010 6 
//#define b011 7
//#define b012 8
//#define b013 9
//#define b020 10
//#define b021 11
//#define b022 12
//#define b023 14
//#define b030 15
//#define b031 16
#define b032 17
//#define b033 18
//#define b100 19
//#define b101 20
//#define b102 21
//#define b103 22
//#define b110 23
//#define b111 24
//#define b112 25
//#define b113 26
//#define b120 27
//#define b121 28
//#define b122 29
//#define b123 30
//#define b130 31
//#define b131 32
//#define b132 33
//#define b133 34
//
//#define b200 35
//#define b201 36
//#define b202 37
//#define b203 38
//#define b210 39
//#define b211 40
//#define b212 41
//#define b213 42
//#define b220 43
//#define b221 44
//#define b222 45
//#define b223 46
//#define b230 47
//#define b231 48
//#define b232 49
//#define b233 50
//
//#define b300 51
//#define b301 52
//#define b302 53
//#define b303 54
//#define b310 55
//#define b311 56
//#define b312 57
//#define b313 58
//#define b320 59
//#define b321 60
//#define b322 61
//#define b323 62
//#define b330 63
//#define b331 64
//#define b332 65
//#define b333 66

// ****** number of buttons/nodes in our physical cube ********
const int numOfButtons = 1;

//array of buttons
int buttons[] = {
//b000, //b001, b002, b003,
//b010, b011, b012, b013,
//b020, b021, 
//b022, //b023,
//b030, b031, 
b032, 
//b033,
//  
//b100, b101, b102, 
//b103,
//b110, b111, b112, b113,
//b120, b121, b122, b123,
//b130, 
//b131, //b132, b133,
//
//b200, b201, b202, b203,
//b210, b211, b212, b213,
//b220, b221, b222, b223,
//b230, b231, b232, b233,
//
//b300, b301, b302, b303,
//b310, b311, b312, b313,
//b320, b321, b322, b323,
//b330, b331, b332, b333  

};

//array of xyz coordinates
//String c000 = "0,0,0;";
//String c001 = "0,0,1;";
//String c002 = "0,0,2;";
//String c003 = "0,0,3;";
//String c010 = "0,1,0;";
//String c011 = "0,1,1;";
//String c012 = "0,1,2;";
//String c013 = "0,1,3;";
//String c020 = "0,2,0;";
//String c021 = "0,2,1;";
//String c022 = "0,2,2;";
//String c023 = "0,2,3;";
//String c030 = "0,3,0;";
//String c031 = "0,3,1;";
String c032 = "0,3,2;";
//String c033 = "0,3,3;";
//
//String c100 = "1,0,0;";
//String c101 = "1,0,1;";
//String c102 = "1,0,2;";
//String c103 = "1,0,3;";
//String c110 = "1,1,0;";
//String c111 = "1,1,1;";
//String c112 = "1,1,2;";
//String c113 = "1,1,3;";
//String c120 = "1,2,0;";
//String c121 = "1,2,1;";
//String c122 = "1,2,2;";
//String c123 = "1,2,3;";
//String c130 = "1,3,0;";
//String c131 = "1,3,1;";
//String c132 = "1,3,2;";
//String c133 = "1,3,3;";
//
//String c200 = "2,0,0;";
//String c201 = "2,0,1;";
//String c202 = "2,0,2;";
//String c203 = "2,0,3;";
//String c210 = "2,1,0;";
//String c211 = "2,1,1;";
//String c212 = "2,1,2;";
//String c213 = "2,1,3;";
//String c220 = "2,2,0;";
//String c221 = "2,2,1;";
//String c222 = "2,2,2;";
//String c223 = "2,2,3;";
//String c230 = "2,3,0;";
//String c231 = "2,3,1;";
//String c232 = "2,3,2;";
//String c233 = "2,3,3;";
//
//String c300 = "3,0,0;";
//String c301 = "3,0,1;";
//String c302 = "3,0,2;";
//String c303 = "3,0,3;";
//String c310 = "3,1,0;";
//String c311 = "3,1,1;";
//String c312 = "3,1,2;";
//String c313 = "3,1,3;";
//String c320 = "3,2,0;";
//String c321 = "3,2,1;";
//String c322 = "3,2,2;";
//String c323 = "3,2,3;";
//String c330 = "3,3,0;";
//String c331 = "3,3,1;";
//String c332 = "3,3,2;";
//String c333 = "3,3,3;";

String coord[] = {
//c000, //c001, c002, c003,
//c010, c011, c012, c013,
//c020, c021, 
//c022, //c023,
//c030, c031, 
c032, 
//c033,
//
//c100, c101, c102, 
//c103,
//c110, c111, c112, c113,
//c120, c121, c122, c123,
//c130,
//c131, c132, c133,
//
//c200, c201, c202, c203,
//c210, c211, c212, c213,
//c220, c221, c222, c223,
//c230, c231, c232, c233,
//
//c300, c301, c302, c303,
//c310, c311, c312, c313,
//c320, c321, c322, c323,
//c330, c331, c332, c333
};


void setup() {
 
 //start serial communitcation
 Serial.begin(9600);

 //init button pins as input
// pinMode(b1, INPUT);
// pinMode(b2, INPUT);

for (int j = 0; j < numOfButtons; j++ ) {
   pinMode(buttons[j], INPUT); 
}
  
}


void loop() {
  
 for (int i = 0; i < numOfButtons; i++) {
  
  int reading1 = digitalRead(buttons[i]);
  
  delay(50);
  
  int reading2 = digitalRead(buttons[i]);
  
  if (reading1 == reading2 && reading2 == HIGH ) {   
     
      Serial.print(coord[i]);   
  } 
 }
 
 Serial.print('\n');
  
}
