/* 3D grid object placement
 * V.02 - button array
 * Ben Leduc-Mills
*/

// pin assignments won't change
// each point has a switch, an led, and an xyz coordinate
// led will be solely controlled by switch, doesn't need a pin

//we'll try 8 for now, to make a cube
const int button1 = 2;
const int button2 = 3;
const int button3 = 4;
const int button4 = 5;
const int button5 = 6;
const int button6 = 7;
cosnt int button7 = 8;
const int button8 = 9;
 

//var for reading button status
int button1State = 0;
int button2State = 0;
int button3State = 0;
int button4State = 0;
int button5State = 0;
int button6State = 0;
int button7State = 0;
int button8State = 0;

void setup() {
 
  //start serial communitcation
  Serial.begin(9600);
  
  //init button pins as input
  pinMode(button1, INPUT);
  pinMode(button2, INPUT);
  pinMode(button3, INPUT);
  pinMode(button4, INPUT);
  pinMode(button5, INPUT);
  pinMode(button6, INPUT);
  pinMode(button7, INPUT);
  pinMode(button8, INPUT);
  
}


void loop() {
  
 // read button states
 button1State = digitalRead(button1);
 button2State = digitalRead(button2);
 button3State = digitalRead(button3);
 button4State = digitalRead(button4);
 button5State = digitalRead(button5);
 button6State = digitalRead(button6);
 button7State = digitalRead(button7);
 button8State = digitalRead(button8);
 
 int buttonStates[] = 
{ button1State, 
  button2State, 
  button3State, 
  button4State, 
  button5State, 
  button6State,
  button7State,
  button8State };
 
 //if button is pressed, turn LED on, and send buttonID (pin) to serial
 for( i = 1; i < 9; i++ ) {
  if ( buttonStates[i] == HIGH ) {
   Serial.println( i );
  }
 }
 
 
  
}
