#include <WString.h>

/* 3D grid object placement
 * V.05 - two buttons sending xyz coordinates w/ debouncing
 * Ben Leduc-Mills
*/

//number of buttons/nodes in our physical cube
const int numOfButtons = 2;

// pin assignments won't change
// each point has a switch, an led, and an xyz coordinate
const int button1 = 2;
const int button2 = 3;
int buttons[] = {button1, button2};

//array of xyz coordinates
String coord1 = "10,30,40;";
String coord2 = "20,20,20;";
String coord[] = {coord1, coord2};

void setup() {
 
 //start serial communitcation
 Serial.begin(9600);

 //init button pins as input
 pinMode(button1, INPUT);
 pinMode(button2, INPUT);
  
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
