// Arduino G-code Interpreter
// v1.0 by Mike Ellery (mellery@gmail.com)
// v1.1 by Zach Smith  (hoeken@gmail.com)

#include <HardwareSerial.h>

//our command string
#define COMMAND_SIZE 128

//char word[COMMAND_SIZE];
char w[COMMAND_SIZE];
byte serial_count;
int no_data = 0;

void setup()
{
  //Do startup stuff here
  Serial.begin(19200);
  Serial.println("start");

  //other initialization.
  init_process_string();
  init_steppers();
  //init_extruder();
}

void loop()
{
  char c;

  //keep it hot!
 // extruder_manage_temperature();

  //read in characters if we got them.
  if (Serial.available() > 0)
  {
    c = Serial.read();
    no_data = 0;

    //newlines are ends of commands.
    if (c != '\n')
    {
      //word[serial_count] = c;
      w[serial_count] = c;
      serial_count++;
    }
  }
  //mark no data.
  else
  {
    no_data++;
    delayMicroseconds(100);
  }

  //if theres a pause or we got a real command, do it
  if (serial_count && (c == '\n' || no_data > 100))
  {
    //process our command!
    process_string(w, serial_count);

    //clear command.
    init_process_string();
  }

  //no data?  turn off steppers
  if (no_data > 1000)
    disable_steppers();
}

