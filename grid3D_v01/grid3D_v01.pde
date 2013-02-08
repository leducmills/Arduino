/* 3D grid object placement
 * V.01 - single button and led
 * Ben Leduc-Mills
*/

// pin assignments won't change
// each point has a switch, an led, and an xyz coordinate
const int button1 = 2;
//const int led1 = 3;
 

//var for reading button status
int button1State = 0;

void setup() {
 
  //start serial communitcation
  Serial.begin(9600);
  
  
 //init LED pins as output
 //pinMode(led1, OUTPUT);
 
 //init button pins as input
 pinMode(button1, INPUT);
  
}


void loop() {
  
 // read button states
 button1State = digitalRead(button1);
 
 
 //if button is pressed, turn LED on, and send buttonID (pin) to serial
 if (button1State == HIGH) {
   //digitalWrite(led1, HIGH);
   Serial.println(button1);
    
 }
// else {
//   digitalWrite(led1, LOW); 
// }
 
  
}
