//define Pins
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

#define ENDSTOPS_MIN_ENABLED 1
#define ENDSTOPS_MAX_ENABLED 1

