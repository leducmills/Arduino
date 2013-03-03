
#define ENDSTOP_PIN 43 

void setup() { 
  pinMode(ENDSTOP_PIN, INPUT); 
  Serial.begin(9600); 
  Serial.println("Starting opto endstop exerciser."); 
} 

void loop() { 
  if (digitalRead(ENDSTOP_PIN)) {
    Serial.println("blocked."); 
  }
  else { 
    Serial.println("open."); 
    delay(500); 
  }
}


