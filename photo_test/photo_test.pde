int photo;
int photo1;
int photo2;
int photo3;

void setup() {
  
  Serial.begin(9600);
}

void loop() {
 
 photo = analogRead(0);
 photo1 = analogRead(1);
 photo2 = analogRead(2);
 photo3 = analogRead(3);
 
 Serial.println(photo);
 Serial.println(photo1);
 Serial.println(photo2);
 Serial.println(photo3);
 
 delay(500);
  
}
