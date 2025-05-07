#include <SoftwareSerial.h>

const int motor_pin = 10;

SoftwareSerial BTSerial(3, 4); // RX, TX

bool motorFromApp = false;
int command = 0;

void setup() {
  Serial.begin(9600);
  BTSerial.begin(9600);

  pinMode(motor_pin, OUTPUT);

  analogWrite(motor_pin, 0);
}

void checkVibration() {
  if (BTSerial.available()) {
    command = BTSerial.parseInt(); 

    if (command == 0) {
      motorFromApp = false;
      analogWrite(motor_pin, 0);
      Serial.println("OFF");
    } else {
      motorFromApp = true;
      Serial.print("ON - Intensity: ");
      Serial.println(command);
    }
  }
}

void loop() {
  checkVibration();

  if (motorFromApp) {
    analogWrite(motor_pin, command);
  }
}

