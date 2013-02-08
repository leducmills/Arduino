

/* 3D grid object placement
 * V.01 - single button and led
 * Ben Leduc-Mills
*/

// pin assignments won't change
// each point has a switch, an led, and an xyz coordinate
//const int button1 = 6;
//const int led1 = 3;
int button1 = 2;
int button2 = 3;
int button3 = 4;
int button4 = 5;

int buttons[] = {button1, button2, button3, button4};

//var for reading button status
int button1State = 0;
int button2State = 0;
int button3State = 0;
int button4State = 0;

void setup() {
 
  //start serial communitcation
  Serial.begin(9600);
  
  
 //init LED pins as output
 //pinMode(led1, OUTPUT);
 
 //init button pins as input
 pinMode(button1, INPUT);
 pinMode(button2, INPUT);
 pinMode(button3, INPUT);
 pinMode(button4, INPUT);
  
}


void loop() {
  
 // read button states
// button1State = digitalRead(button1);
// button2State = digitalRead(button2);
// button3State = digitalRead(button3);
 
 for (int i = 0; i< 4; i++) {
  
  int reading = digitalRead(buttons[i]);
  
  if( reading == HIGH) {
   
   Serial.println(buttons[i]);
    
  }
   
 }
 
 
 
 
 //if button is pressed, turn LED on, and send buttonID (pin) to serial
// if (button1State == HIGH) {
//   //digitalWrite(led1, HIGH);
//   //Serial.print("button 1:");
//   Serial.println(button1);
//    
// }
// else {
//   //digitalWrite(led1, LOW); 
//   Serial.println(0);
// }
 
  
}
