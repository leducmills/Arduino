#define buzzer 2
#define redLed 3
#define greenLed 5
#define blueLed 6
#define lightSensor A0
#define button 7

int val;
int input;
int calibration;

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
  
  calibration = analogRead(A0);

  Serial.begin(9600);  //start serial communication at 9600
  establishContact();  //try to make contract with processing

}


void loop() {
  if (Serial.available() > 0) { // If data is available to read,
    //input = Serial.read(); // read it and store it in val
    int red = Serial.parseInt();
    //input = Serial.read();
    
    int green = Serial.parseInt();
    int blue = Serial.parseInt();
    
    if(Serial.read() == '\n') {
      red = 255 - constrain(red, 0, 255);
      green = 255 - constrain(green, 0, 255);
      blue = 255 - constrain(blue, 0, 255);  
      
      analogWrite(redLed, red);
      analogWrite(greenLed, green);
      analogWrite(blueLed, blue);
    }
  }
    
  
  val = digitalRead(button);  //read the button
  if (val == 0) { //if it's being pushed, make a buzz
    buzz();
  }
  delay(150);
  
  
  
  
  Serial.print(val);  //send the button val to serial
  Serial.print(",");  //send a comma as a delimiter
  val = analogRead(A0); //read the photocell
  //Serial.println(val); //send the photocell value  
  val = map(val, 0, calibration, 0, 255);
  Serial.println(val); //send the photocell value

  
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
//  digitalWrite(buzzer, HIGH);
//  delay(2);
//  digitalWrite(buzzer, LOW);
//  delay(2);
  tone(2, random(220, 880), random(100, 500)); 
  }
}
