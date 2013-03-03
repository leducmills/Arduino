#define X_STEP_PIN 20
#define X_DIR_PIN 21
#define X_MIN_PIN 22
#define X_MAX_PIN 23
#define X_ENABLE_PIN 24

#define Y_STEP_PIN 40
#define Y_DIR_PIN 41
#define Y_MIN_PIN 42
#define Y_MAX_PIN 43
#define Y_ENABLE_PIN 44

#define Z_STEP_PIN 52
#define Z_DIR_PIN 53
#define Z_MIN_PIN 50
#define Z_MAX_PIN 51
#define Z_ENABLE_PIN 49

void setup() {
 Serial.begin(9600);

  pinMode(X_MIN_PIN, INPUT);
  pinMode(X_MAX_PIN, INPUT);

  pinMode(Y_MIN_PIN, INPUT);
  pinMode(Y_MAX_PIN, INPUT);

  pinMode(Z_MIN_PIN, INPUT);
  pinMode(Z_MAX_PIN, INPUT); 
}

void loop() {
 if (digitalRead(X_MIN_PIN))
      Serial.println( "X min blocked.");
    else
      Serial.println("X min open.");
    if (digitalRead(X_MAX_PIN))
      Serial.println("X max blocked.");
    else
      Serial.println("X max open.");
    if (digitalRead(Y_MIN_PIN))
      Serial.println("Y min blocked.");
    else
      Serial.println("Y min open.");
    if (digitalRead(Y_MAX_PIN))
      Serial.println("Y max blocked.");
    else
      Serial.println("Y max open.");
    if (digitalRead(Z_MIN_PIN))
      Serial.println("Z min blocked.");
    else
      Serial.println("Z min open.");
    if (digitalRead(Z_MAX_PIN))
      Serial.println("Z max blocked.");
    else
      Serial.println("Z max open.");
     delay(500); 
}
