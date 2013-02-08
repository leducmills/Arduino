#define buzzer 2
#define redLed 3
#define greenLed 5
#define blueLed 6
#define lightSensor A0
#define button 7

int val;

void setup() {

  pinMode(buzzer, OUTPUT);
  pinMode(redLed, OUTPUT);
  pinMode(greenLed, OUTPUT);
  pinMode(blueLed, OUTPUT);
  //pinMode(lightSensor, INPUT);
  pinMode(button, INPUT);

  digitalWrite(redLed, HIGH);
  digitalWrite(blueLed, HIGH);
  digitalWrite(greenLed, HIGH);
  digitalWrite(button, HIGH);
  digitalWrite(buzzer, HIGH);

  Serial.begin(9600);  //start serial communication at 9600
  establishContact();  //try to make contract with processing

}


void loop() {

  val = digitalRead(button);  //read the button
  if (val == 0) { //if it's being pushed, make a buzz
    buzz();
  }
  delay(150);
  
  Serial.print(val);  //send the button val to serial
  Serial.print(",");  //send a comma as a delimiter
  val = analogRead(lightSensor); //read the photocell
  Serial.println(val); //send the photocell value

  // if photocell val is less than 20, make led red
  if (val < 20) {  
    analogWrite(redLed, 0);
    analogWrite(greenLed, 255);
    analogWrite(blueLed, 255);
  }

 //if phtotcell val is between 20 and 50, make led greeen
  if (val > 20 && val < 50) {
    analogWrite(greenLed, 0);
    analogWrite(redLed, 255);
    analogWrite(blueLed, 255);
  } 

//if photocell val is over 50, make led blue
  if(val > 50) {
    analogWrite(blueLed, 0);
    analogWrite(redLed, 255);
    analogWrite(greenLed, 255); 
  }

  
}

//this function sends out a string that processing is looking for to start communication
void establishContact() { 
  while (Serial.available() <= 0) {
    Serial.println("hello");   // send a starting message
    delay(300);
  }
}

void buzz(){
  /// this function makes the buzzer pin move and crease a sound.
  /// By writing the pin HIGH/LOW in a pattern we can create a frequency.
  /// this FOR LOOP is used to repeat the pattern and let us hear the note for second.
  for(int i = 0; i < random(100); i++){
  digitalWrite(buzzer, HIGH);
  delay(2);
  digitalWrite(buzzer, LOW);
  delay(2);
  }
}
