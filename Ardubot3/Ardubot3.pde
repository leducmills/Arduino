/*
	Ardubot motor-driving example program
	Version 0.0.1
	Source code put in public domain by Didier Stevens, no Copyright

https://DidierStevens.com

	Use at your own risk

	History:
	2009/08/21: Start development
	2009/08/23: refactoring
*/

unsigned char PIN_HBRIDGE_1A = 9;
unsigned char PIN_HBRIDGE_2A = 6;
unsigned char PIN_HBRIDGE_3A = 5;
unsigned char PIN_HBRIDGE_4A = 3;

void MotorLeftStop()
{
  digitalWrite(PIN_HBRIDGE_1A, LOW);
  digitalWrite(PIN_HBRIDGE_2A, LOW);
}

void MotorLeftForward()
{
  digitalWrite(PIN_HBRIDGE_1A, HIGH);
  digitalWrite(PIN_HBRIDGE_2A, LOW);
}

void MotorLeftReverse()
{
  digitalWrite(PIN_HBRIDGE_1A, LOW);
  digitalWrite(PIN_HBRIDGE_2A, HIGH);
}

void MotorRightStop()
{
  digitalWrite(PIN_HBRIDGE_3A, LOW);
  digitalWrite(PIN_HBRIDGE_4A, LOW);
}

void MotorRightForward()
{
  digitalWrite(PIN_HBRIDGE_3A, LOW);
  digitalWrite(PIN_HBRIDGE_4A, HIGH);
}

void MotorRightReverse()
{
  digitalWrite(PIN_HBRIDGE_3A, HIGH);
  digitalWrite(PIN_HBRIDGE_4A, LOW);
}

void setup() {
  pinMode(PIN_HBRIDGE_1A, OUTPUT);
  pinMode(PIN_HBRIDGE_2A, OUTPUT);
  pinMode(PIN_HBRIDGE_3A, OUTPUT);
  pinMode(PIN_HBRIDGE_4A, OUTPUT);
}

void loop(){
  MotorLeftStop();
  MotorRightStop();
  delay(2000);

  MotorLeftForward();
  delay(2000);

  MotorLeftStop();
  delay(2000);

  MotorLeftReverse();
  delay(2000);

  MotorLeftStop();
  delay(2000);

  MotorRightForward();
  delay(2000);

  MotorRightStop();
  delay(2000);

  MotorRightReverse();
  delay(2000);

  MotorRightStop();
  delay(2000);

  delay(5000);
}

