#include <SoftwareSerial.h>

const int motor_pin = 10;
SoftwareSerial BTSerial(4, 3); // RX, TX
const int motorPin[] = {10}; 

String inputString = "";
bool stringComplete = false;

void setup() {
  Serial.begin(9600);     
  BTSerial.begin(9600);   

  inputString.reserve(50);
  Serial.println("🟢 Arduino ready (BT via pin 4-3)");
}

void processMessage(String message) {

  String motorCommands[20];
  int motorCount = 0;
  int startIndex = 0;

  for (int i = 0; i < message.length(); i++) {
    if (message[i] == '&' || i == message.length() - 1) {
      if (i == message.length() - 1) {
        motorCommands[motorCount] = message.substring(startIndex, i + 1);
      } else {
        motorCommands[motorCount] = message.substring(startIndex, i);
      }
      startIndex = i + 1;
      motorCount++;
    }
  }

  for (int i = 0; i < motorCount; i++) {
    String motorCommand = motorCommands[i];
    if (motorCommand.length() > 4) {
      String motorNumberStr = motorCommand.substring(1, 3);
      int motorNumber = motorNumberStr.toInt() - 1; 
      
      int pwmValue = motorCommand.substring(4, motorCommand.length() ).toInt();  

      if (motorNumber >= 0 && motorNumber < 20) {
        analogWrite(motorPin[motorNumber], pwmValue);
        printMotor(motorNumber,pwmValue);
        
      }
    }
  }
}

void printMotor(int motorNumber, int pwmValue){
  Serial.print("Motor " );
  Serial.print(motorNumber );
  Serial.print(" on register ");
  Serial.print(motorPin[motorNumber]);
  Serial.print(" set to ");
  Serial.println(pwmValue);
}

void loop() {

  while (BTSerial.available() > 0) {
    char inChar = (char)BTSerial.read();
    if (inChar == '\n') {
      stringComplete = true;
    } else {
      inputString += inChar;
    }
  }

  if (stringComplete) {
    inputString.trim();  

    Serial.print("📩 Command recieved: ");
    Serial.println(inputString);

    if (inputString == "Turn On") {
      Serial.println("vibrate: ");
      analogWrite(motor_pin, 255);
    } else if (inputString == "Turn Off") {

      Serial.println("stop vibrate: ");
      analogWrite(motor_pin, 0);
    } else {
      if (stringComplete) {
        inputString.trim();

        processMessage(inputString);

        inputString = "";
        stringComplete = false;
      }

      while (BTSerial.available()) {
        char inChar = (char)BTSerial.read();
        if (inChar == '\n') {
          stringComplete = true; 
        } else {
          inputString += inChar; 
        }
      }
    }

    inputString = "";
    stringComplete = false;
  }
}