/*

Simon Experiments #1
Blink
Pete Lewis
Sparkfun Electronics 
10/13/2010

This example code is in the public domain.

//////////////////////////////////////////////////
SETUP & UPLOAD INSTRUCTIONS
1. Select "Tools" from the upper window menu.
2. Select "Serial Port" and then select the COM PORT that your FTDI BASIC is connected on. (It most likely will be the COM 2 or higher).
3. Select "Tools", then "Board", then "LilyPad Arduino w/ ATmega328"
4. Click on the "upload button" - it looks like a box with an arrow to the right.
//////////////////////////////////////////////////

*/



int ledPin =  13;    // The simon board has 4 LEDs on it. 
                    // For this example, we're just going to use one. 
                    // The other LEDs are on pins 2,5,10 and 13.
                    // For fun, try switching "ledPin" to another LED and see what happens!


// The setup() funtion runs once, when the sketch starts

void setup()   {                
  // initialize the digital pin as an output:
  pinMode(ledPin, OUTPUT);     
}

// the loop() function runs over and over again,
// as long as the Arduino has power

void loop()                     
{
  digitalWrite(ledPin, HIGH);   // set the LED on
  delay(1000);                  // wait for a second
  digitalWrite(ledPin, LOW);    // set the LED off
  delay(1000);                  // wait for a second
}
