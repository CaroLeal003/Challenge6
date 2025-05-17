#ifndef BT_MANAGER_H
#define BT_MANAGER_H

#include <Arduino.h>
#include <SoftwareSerial.h>

#define PIN_RX 4
#define PIN_TX 2

extern SoftwareSerial BTSerial;
extern int valuesMotors[];
extern const int motorPin[];
extern String inputString;
extern bool stringComplete;
extern String finalMessage;
extern bool messageInProgress;

#define NUMBER_MOTORS 20

void processMessage(String inputString);
void printMotor(int motorNumber, int pwmValue);
void manageMotorsWithBT();

#endif
