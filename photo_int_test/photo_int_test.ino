int p1 = 8;                // choose the pin for the LED
int p2 = 9;               // choose the input pin

int val1 = 0;                    // variable for reading the pin status
int val2 = 0;

void setup() {

  Serial.begin(9600);

  pinMode(p1, INPUT);     // declare photo interrupter as input
  pinMode(p2, INPUT);

}

void loop(){

  val1 = digitalRead(p1);  // read input value
  val2 = digitalRead(p2);

  if (val1  == LOW) {            // check if the input is LOW

      Serial.println("p1");

  }

  if(val2 == LOW) {

    Serial.println("p2"); 
  }



}

