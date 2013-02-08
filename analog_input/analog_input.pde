int analogValue = 0;

void setup() {
 
   Serial.begin(9600); 
}

void loop() {
 
 analogValue = analogRead(0);
 Serial.println(analogValue);
 delay(10); 
}
