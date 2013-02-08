
// define the parameters of our machine.
#define X_STEPS_PER_INCH 416.772354
#define X_STEPS_PER_MM   16.4083604
#define X_MOTOR_STEPS    400

#define Y_STEPS_PER_INCH 416.772354
#define Y_STEPS_PER_MM   16.4083604
#define Y_MOTOR_STEPS    400

#define Z_STEPS_PER_INCH 16256.0
#define Z_STEPS_PER_MM   640.0
#define Z_MOTOR_STEPS    400

//our maximum feedrates
#define FAST_XY_FEEDRATE 1000.0
#define FAST_Z_FEEDRATE  50.0

// Units in curve section
#define CURVE_SECTION_INCHES 0.019685
#define CURVE_SECTION_MM 0.5

// Set to one if sensor outputs inverting
#define SENSORS_INVERTING 1

/****************************************************************************************
 * digital i/o pin assignment
 *
 * this uses the undocumented feature of Arduino - pins 14-19 correspond to analog 0-5
 ****************************************************************************************/

//cartesian bot pins
#define X_STEP_PIN 20
#define X_DIR_PIN 21
#define X_MIN_PIN 4
#define X_MAX_PIN 5
#define X_ENABLE_PIN 15

#define Y_STEP_PIN 40
#define Y_DIR_PIN 41
#define Y_MIN_PIN 8
#define Y_MAX_PIN 9 
#define Y_ENABLE_PIN 16

#define Z_STEP_PIN 52
#define Z_DIR_PIN 53
#define Z_MIN_PIN 10
#define Z_MAX_PIN 11
#define Z_ENABLE_PIN 17

//extruder pins
/*#define EXTRUDER_MOTOR_SPEED_PIN  11
 #define EXTRUDER_MOTOR_DIR_PIN    13 // CHANGED CM
 #define EXTRUDER_HEATER_PIN       6
 #define EXTRUDER_FAN_PIN          5
 #define EXTRUDER_THERMISTOR_PIN   0 */

