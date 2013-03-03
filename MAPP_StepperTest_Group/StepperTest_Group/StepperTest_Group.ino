//#define XstepPin 2
//#define XdirPin 3
//#define XminPin 4
//#define XmaxPin 5
//
//#define YstepPin 6
//#define YdirPin 7
//#define YminPin 8
//#define YmaxPin 9
//
//#define ZstepPin 12
//#define ZdirPin 13
//#define ZminPin 10
//#define ZmaxPin 11


#define XstepPin 20
#define XdirPin 21
#define XminPin 22
#define XmaxPin 23

#define YstepPin 40
#define YdirPin 41
#define YminPin 42
#define YmaxPin 43

#define ZstepPin 52
#define ZdirPin 53
#define ZminPin 50
#define ZmaxPin 51


//#define X_STEP_PIN 20
//#define X_DIR_PIN 21
//#define X_MIN_PIN 22
//#define X_MAX_PIN 23
//#define X_ENABLE_PIN 15
//
//#define Y_STEP_PIN 40
//#define Y_DIR_PIN 41
//#define Y_MIN_PIN 42
//#define Y_MAX_PIN 43 
//#define Y_ENABLE_PIN 16
//
//#define Z_STEP_PIN 52
//#define Z_DIR_PIN 53
//#define Z_MIN_PIN 50
//#define Z_MAX_PIN 51
//#define Z_ENABLE_PIN 17


void setup()
{
  Serial.begin(9600);
  Serial.println("Starting stepper exerciser.");
  Serial.println("Starting opto endstop exerciser.");

  pinMode(XstepPin, OUTPUT);
  pinMode(XdirPin, OUTPUT);
  pinMode(XminPin, INPUT);
  pinMode(XmaxPin, INPUT);

  pinMode(YstepPin, OUTPUT);
  pinMode(YdirPin, OUTPUT);
  pinMode(YminPin, INPUT);
  pinMode(YmaxPin, INPUT);

  pinMode(ZstepPin, OUTPUT);
  pinMode(ZdirPin, OUTPUT);
  pinMode(ZminPin, INPUT);
  pinMode(ZmaxPin, INPUT);

  digitalWrite(XdirPin, HIGH);
  digitalWrite(XstepPin, LOW);
  digitalWrite(YdirPin, HIGH);
  digitalWrite(YstepPin, LOW);
  digitalWrite(ZdirPin, HIGH);
  digitalWrite(ZstepPin, LOW);
}

void loop()
{


  // delay(500);


  int i, j;

  for (i=1650; i>=600; i-=150)
  {


    if (digitalRead(XminPin))
      Serial.println( "X min blocked.");
    else
      Serial.println("X min open.");
    if (digitalRead(XmaxPin))
      Serial.println("X max blocked.");
    else
      Serial.println("X max open.");
    if (digitalRead(YminPin))
      Serial.println("Y min blocked.");
    else
      Serial.println("Y min open.");
    if (digitalRead(YmaxPin))
      Serial.println("Y max blocked.");
    else
      Serial.println("Y max open.");
    if (digitalRead(ZminPin))
      Serial.println("Z min blocked.");
    else
      Serial.println("Z min open.");
    if (digitalRead(ZmaxPin))
      Serial.println("Z max blocked.");
    else
      Serial.println("Z max open.");


    Serial.print("Speed: ");
    Serial.println(i);

    for (j=0; j<2000; j++)
    {
      digitalWrite(ZstepPin, HIGH);
      digitalWrite(YstepPin, HIGH);
      digitalWrite(XstepPin, HIGH);
      delayMicroseconds(2);
      digitalWrite(ZstepPin, LOW);
      digitalWrite(YstepPin, LOW);
      digitalWrite(XstepPin, LOW);
      delayMicroseconds(i);
    }

    delay(500);
    Serial.println("Switching directions.");
    digitalWrite(ZdirPin, !digitalRead(ZdirPin));
    digitalWrite(YdirPin, !digitalRead(YdirPin));
    digitalWrite(XdirPin, !digitalRead(XdirPin));

    for (j=0; j<2000; j++)
    {
      digitalWrite(ZstepPin, HIGH);
      digitalWrite(YstepPin, HIGH);
      digitalWrite(XstepPin, HIGH);
      delayMicroseconds(2);
      digitalWrite(ZstepPin, LOW);
      digitalWrite(YstepPin, LOW);
      digitalWrite(XstepPin, LOW);
      delayMicroseconds(i);
    }

    delay(1000);
    Serial.println("Switching directions."); 
    digitalWrite(ZdirPin, !digitalRead(ZdirPin));
    digitalWrite(YdirPin, !digitalRead(YdirPin));
    digitalWrite(XdirPin, !digitalRead(XdirPin));
  }
}

