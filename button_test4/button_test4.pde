#include <WString.h>

/* 3D grid object placement
 * V.04 - two buttons sending xyz coordinates 
 * Ben Leduc-Mills
*/

//number of buttons/nodes in our physical cube
const int numOfButtons = 2;

// pin assignments won't change
// each point has a switch, an led, and an xyz coordinate

const int button1 = 2;
const int button2 = 3;

String coord1 = "10,10,10;";
String coord2 = "20,20,20;";

String coord[] = {coord1, coord2};

int buttons[] = {button1, button2}; 

//var for reading button status
//int button1State = 0;
//int button2State = 0;

void setup() {
 
 //start serial communitcation
 Serial.begin(9600);

 //init button pins as input
 pinMode(button1, INPUT);
 pinMode(button2, INPUT);
  
}


void loop() {
  
 // read button states
 for( int i = 0; i < numOfButtons; i++) {
   
   int buttonState = digitalRead(buttons[i]);
   
   if (buttonState == HIGH) {
      Serial.print(coord[i]);      
   }   
 }
 
 Serial.print('\n');
 
 
 //delay(100);
 
 
}
