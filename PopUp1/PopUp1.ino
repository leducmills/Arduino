

int toggle1 = 2; //LED to toggle
int sense1 = 4; //copper tape switch

int toggle1state = LOW;

int calibration = 0;
int previous;

void setup() {

  Serial.begin(9600);
  pinMode(toggle1, OUTPUT);

  delay(100);

  calibration += readCapacitivePin(4);
  //
  //  //calibration = (calibration + 4) / 8;
  Serial.print("Cal:  ");
  Serial.println(calibration);

}

void loop() {

  int n = readCapacitivePin(4);
  Serial.print("N:  ");
  Serial.println(n);

    if (previous <= calibration && n > calibration) {
      if (toggle1state == LOW) toggle1state = HIGH;
      else toggle1state = LOW;
  
      digitalWrite(toggle1, toggle1state);
    }

//  if(n > 1) {
//   digitalWrite(toggle1, HIGH); 
//  } else {
//   digitalWrite(toggle1, LOW); 
//  }

  previous = n;
  delayMicroseconds(500);

}


byte chargeTime(byte pin)
{
  byte mask = (1 << pin);
  byte i;

  DDRB &= ~mask; // input
  PORTB |= mask; // pull-up on

  for (i = 0; i < 16; i++) {
    if (PINB & mask) break;
  }

  PORTB &= ~mask; // pull-up off
  DDRB |= mask; // discharge

  return i;
}



