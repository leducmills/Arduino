void setup() { 
  Serial.begin(9600);
}
void loop() {
  while (Serial.available() <= 0) {
    Serial.println("Hello world");
    delay(300); 
  }
  Serial.println("Goodbye world");
  while(1) { 
  } 
}

