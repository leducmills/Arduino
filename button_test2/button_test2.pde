/* 3D grid object placement
 * V.02 - two buttons 
 * Ben Leduc-Mills
*/

// pin assignments won't change
// each point has a switch, an led, and an xyz coordinate
const int button1 = 2;
const int button2 = 3;
//const int led1 = 3;
 

//var for reading button status
int button1State = 0;
int button2State = 0;

void setup() {
 
  //start serial communitcation
  Serial.begin(9600);
  
  
 //init LED pins as output
 //pinMode(led1, OUTPUT);
 
 //init button pins as input
 pinMode(button1, INPUT);
 pinMode(button2, INPUT);
  
}


void loop() {
  
 // read button states
 button1State = digitalRead(button1);
 
 if (button1State == HIGH) {
   //digitalWrite(led1, HIGH);
   //Serial.print("button 1:");
   Serial.println(button1);    
 }
 
 else if (button1State == LOW) {
    Serial.println(button1 * -1); 
 }
 
 
 button2State = digitalRead(button2);
 
 if (button2State == HIGH) {
  Serial.println(button2); 
 }
 
 else if (button2State == LOW) {
  Serial.println(button2 * -1); 
 }
 
 
  
}
