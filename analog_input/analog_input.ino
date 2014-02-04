int analogValue = 0;

void setup() {
 
   Serial.begin(9600); 
}

void loop() {
 while (Serial.available() <= 0) { 
 analogValue = analogRead(A0);
 Serial.println(analogValue);
 delay(5); 
 }
}
