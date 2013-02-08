// LED leads connected to PWM pins
const int RED_LED_PIN = 9;
const int BLUE_LED_PIN = 10;
const int GREEN_LED_PIN = 11;

const int BUTTON_PIN = 2;

// Used to store the current intensity level of the individual LEDs
int redIntensity = 0;
int greenIntensity = 0;
int blueIntensity = 0;

void setup() {
  // No setup required.
  Serial.begin(9600);
}

void loop() {


  int button_state = digitalRead(BUTTON_PIN);
  Serial.println(button_state);
  
  if(button_state == 0) {
  

  analogWrite(GREEN_LED_PIN, 100); 
  analogWrite(RED_LED_PIN, 0); 
  analogWrite(BLUE_LED_PIN, 0); 

  delay(500);
  
  }  else {

  analogWrite(GREEN_LED_PIN, 0);
  analogWrite(RED_LED_PIN, 100);
  analogWrite(BLUE_LED_PIN, 0);

  delay(500);

  analogWrite(GREEN_LED_PIN, 0);
  analogWrite(RED_LED_PIN, 0);
  analogWrite(BLUE_LED_PIN, 100);

  delay(500);

  }

}

