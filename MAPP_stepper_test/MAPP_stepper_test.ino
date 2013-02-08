#define stepPin 4
#define dirPin 5

void setup() {
  Serial.begin(9600);
  Serial.println("Starting stepper exerciser.");

  pinMode(stepPin, OUTPUT);
  pinMode(dirPin, OUTPUT);

  digitalWrite(dirPin, HIGH);
  digitalWrite(stepPin, LOW);
}

void loop() {
  int i, j;

  for (i=1000; i>=200; i-=100) {
    Serial.print("Speed: ");
    Serial.println(i);
 
    for (j=0; j<2000; j++) {
      digitalWrite(stepPin, HIGH);
      delayMicroseconds(i);
      digitalWrite(stepPin, LOW);
      delayMicroseconds(i);
    }

    delay(500);
    digitalWrite(dirPin, !digitalRead(dirPin));

    for (j=0; j<2000; j++) {
      digitalWrite(stepPin, HIGH);
      delayMicroseconds(i);
      digitalWrite(stepPin, LOW);
      delayMicroseconds(i);
    }

    delay(1000);
    Serial.println("Switching directions."); 
    digitalWrite(dirPin, !digitalRead(dirPin));
  }
}
