#define rmotor1 3
#define rmotor2 5
#define lmotor1 6
#define lmotor2 9

int motorPins[] = {rmotor1, rmotor2, lmotor1, lmotor2};

void setup() {
 
 for(int i = 0; i < 4; i++) {
  
  pinMode(motorPins[i], OUTPUT);
   
 }
  
}

void loop() {
 
digitalWrite(9, LOW);
analogWrite(6, 50);

delay(1000);

analogWrite(9, 50);
digitalWrite(6, LOW);

delay(1000);
  
}


