
int ez1Analog = 0; // Analog Pin, A0

int aByte;
int flag = 0;

void setup() { 
  pinMode(ez1Analog,INPUT); 
  Serial.begin(9600);
}
void loop() {
  if(Serial.available() > 0) {
    aByte = Serial.read();

        if( flag == 0) {
          flag = 1;
        } 
        else {
          flag = 0; 
        }
    
      }
      if (flag == 1) {

    int val = analogRead(ez1Analog); 

    if (val > 0) {

      Serial.println( val);
      //delay(10); 

    }
  }
}










