/*
 * AnalogPong for Arduino
 * Reads in 2 sensor values as paddles to send to a processing sketch
 *  by Ben Leduc-Mills
 *  This code is public domain but you buy me a beer if you use this and we meet someday (Beerware license)
 */

void setup() {
  Serial.begin(9600);
  establishContact();
}

void loop() {
 if (Serial.available() > 0) {
    // read the incoming byte:
    int inByte = Serial.read();
    int leftPaddle = analogRead(A0)/4;
    Serial.print(leftPaddle, DEC);
    Serial.print(",");
    int rightPaddle = analogRead(A1)/4;
    Serial.println(rightPaddle, DEC);
    // Serial.println(rightPaddle, DEC);
    //Serial.println(leftPaddle, DEC);
  }
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("hello");   // send a starting message
    delay(300);
  }
}

