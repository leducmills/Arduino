#include "mpr121.h"
#include <Wire.h>

int irqpin[] = {2,3,4,5};  // Digital 2,3,4,5 used for the 4 sensors

int touchStates[4][12]; //to keep track of the previous touch states

void setup(){
  pinMode(irqpin[0], INPUT);
  pinMode(irqpin[1], INPUT);
  pinMode(irqpin[2], INPUT);
  pinMode(irqpin[3], INPUT);
  
  digitalWrite(irqpin[0], HIGH); //enable pullup resistor
  digitalWrite(irqpin[1], HIGH); //enable pullup resistor
  digitalWrite(irqpin[2], HIGH); //enable pullup resistor
  digitalWrite(irqpin[3], HIGH); //enable pullup resistor
  
  Serial.begin(9600);
  Wire.begin();

   mpr121_setup(0x5A);
   mpr121_setup(0x5B);
   mpr121_setup(0x5C);
   mpr121_setup(0x5D);
}

void loop(){
  readTouchInputs(0x5A, 1);
  readTouchInputs(0x5B, 2);
  readTouchInputs(0x5C, 3);
  readTouchInputs(0x5D, 4);
}


void readTouchInputs(int sensorAddress, int sensor){
  if(!checkInterrupt(sensor - 1)){
    
    //read the touch state from the MPR121
    Wire.requestFrom(sensorAddress,2); 
    
    byte LSB = Wire.read();
    byte MSB = Wire.read();
    
    uint16_t touched = ((MSB << 8) | LSB); //16bits that make up the touch states

    
    for (int i=0; i < 12; i++){  // Check what electrodes were pressed
      if(touched & (1<<i)){
      
        if(touchStates[sensor-1][i] == 0){
          //pin i was just touched
          Serial.print("pin ");
          Serial.print(i);
          Serial.println(" was just touched");
        
        }else if(touchStates[sensor-1][i] == 1){
          //pin i is still being touched
        }  
      
        touchStates[sensor-1][i] = 1;      
      }else{
        if(touchStates[sensor-1][i] == 1){
          Serial.print("pin ");
          Serial.print(i);
          Serial.println(" is no longer being touched");
          
          //pin i is no longer being touched
       }
        
        touchStates[sensor-1][i] = 0;
      }
    
    }
    
  }
}




void mpr121_setup(byte address){

  set_register(address, ELE_CFG, 0x00); 
  
  // Section A - Controls filtering when data is > baseline.
  set_register(address, MHD_R, 0x01);
  set_register(address, NHD_R, 0x01);
  set_register(address, NCL_R, 0x00);
  set_register(address, FDL_R, 0x00);

  // Section B - Controls filtering when data is < baseline.
  set_register(address, MHD_F, 0x01);
  set_register(address, NHD_F, 0x01);
  set_register(address, NCL_F, 0xFF);
  set_register(address, FDL_F, 0x02);
  
  // Section C - Sets touch and release thresholds for each electrode
  set_register(address, ELE0_T, TOU_THRESH);
  set_register(address, ELE0_R, REL_THRESH);

  set_register(address, ELE1_T, TOU_THRESH);
  set_register(address, ELE1_R, REL_THRESH);
  
  set_register(address, ELE2_T, TOU_THRESH);
  set_register(address, ELE2_R, REL_THRESH);
  
  set_register(address, ELE3_T, TOU_THRESH);
  set_register(address, ELE3_R, REL_THRESH);
  
  set_register(address, ELE4_T, TOU_THRESH);
  set_register(address, ELE4_R, REL_THRESH);
  
  set_register(address, ELE5_T, TOU_THRESH);
  set_register(address, ELE5_R, REL_THRESH);
  
  set_register(address, ELE6_T, TOU_THRESH);
  set_register(address, ELE6_R, REL_THRESH);
  
  set_register(address, ELE7_T, TOU_THRESH);
  set_register(address, ELE7_R, REL_THRESH);
  
  set_register(address, ELE8_T, TOU_THRESH);
  set_register(address, ELE8_R, REL_THRESH);
  
  set_register(address, ELE9_T, TOU_THRESH);
  set_register(address, ELE9_R, REL_THRESH);
  
  set_register(address, ELE10_T, TOU_THRESH);
  set_register(address, ELE10_R, REL_THRESH);
  
  set_register(address, ELE11_T, TOU_THRESH);
  set_register(address, ELE11_R, REL_THRESH);
  
  // Section D
  // Set the Filter Configuration
  // Set ESI2
  set_register(address, FIL_CFG, 0x04);
  
  // Section E
  // Electrode Configuration
  // Set ELE_CFG to 0x00 to return to standby mode
  set_register(address, ELE_CFG, 0x0C);  // Enables all 12 Electrodes
  
  
  // Section F
  // Enable Auto Config and auto Reconfig
  /*set_register(address, ATO_CFG0, 0x0B);
  set_register(address, ATO_CFGU, 0xC9);  // USL = (Vdd-0.7)/vdd*256 = 0xC9 @3.3V   set_register(address, ATO_CFGL, 0x82);  // LSL = 0.65*USL = 0x82 @3.3V
  set_register(address, ATO_CFGT, 0xB5);*/  // Target = 0.9*USL = 0xB5 @3.3V
  
  set_register(address, ELE_CFG, 0x0C);
  
}


boolean checkInterrupt(int sensor){
  return digitalRead(irqpin[sensor]);
}


void set_register(int address, unsigned char r, unsigned char v){
    Wire.beginTransmission(address);
    Wire.write(r);
    Wire.write(v);
    Wire.endTransmission();
}
