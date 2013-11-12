
int pinNumber = 13;
//long timer;

void setup() {
  //code for the setup function goes here
  Serial.begin(9600);
  pinMode(13, OUTPUT);
}



void loop() {
  //  //code for the loop function goes here
  //  if (millis() < 10000 ) {
  //  digitalWrite(13, HIGH);
  //  Serial.print("on");
  //  delay(1000);
  //  digitalWrite(13, LOW);
  //  Serial.println("off");
  //  delay(1000);
  //  }


  //  do {
  //  digitalWrite(13, HIGH);
  //  Serial.print("on");
  //  delay(1000);
  //  digitalWrite(13, LOW);
  //  Serial.println("off");
  //  delay(1000); } while (millis() < 10000);


//  while (millis() < 10000) {
//    digitalWrite(13, HIGH);
//    delay(1000);
//    digitalWrite(13, LOW);
//    delay(1000);
//  }

//  switch (millis()) {
//    case 0:
//    case 2000:
//    case 4000:
//    case 6000:
//    case 8000:
//      digitalWrite(13, HIGH);
//      delay(1000);
//      digitalWrite(13, LOW);
//      delay(1000);
//      break;
//  case 10000:
//    digitalWrite(13, LOW);
//    break;
//  }

for (int i = 0; i <= 10000; i+=2000) {
    digitalWrite(13, HIGH);
    delay(1000);
    digitalWrite(13, LOW);
    delay(1000);
    Serial.println(i);
} 

     

}





