void setup() {
  Serial.begin(9600);
}

void loop() {
  
  Serial.print('$');
  
  for(int i = 0; i < 64; i++) {
   
   Serial.print(random(32, 90));
   Serial.print(',');
    
  }
  
  Serial.print('*');
  
}
