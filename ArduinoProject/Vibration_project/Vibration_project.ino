
#include <Adafruit_PWMServoDriver.h>
#include "BTManager.h"

#define SERVOMIN 150


  
//Mapping motors



void setup() {
  Serial.begin(9600);     
  BTSerial.begin(9600);   
  
  inputString.reserve(50);
  Serial.print("🟢 Arduino ready (BT via pin rx");
  Serial.print(PIN_RX);
  Serial.print(" - tx");
  Serial.print(PIN_TX);
  Serial.print(")");

}

void loop() {

  manageMotorsWithBT();
  
}


void turnOffMotors(int startIndexMotor, int endIndexMotor){
  for(int indexMotor = startIndexMotor; indexMotor < endIndexMotor; indexMotor++ ){
    if( valuesMotors[indexMotor] > 0) analogWrite(motorPin[indexMotor], 0);
  }
}





