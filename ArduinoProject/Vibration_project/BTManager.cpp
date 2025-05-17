#include "BTManager.h"

SoftwareSerial BTSerial(PIN_RX, PIN_TX); // RX, TX
int valuesMotors[NUMBER_MOTORS] = {0}; 

const int motorPin[] = {
  3, 5, 6, 9, 10, 11, 34, 35, 37, 38, 39, 40, 41, 42
};

String inputString = "";
bool stringComplete = false;
String finalMessage = "";
bool messageInProgress = false;


void processMessage(String inputString) {
  int start = 0;
  int lastIndex = 0;
  while (start < inputString.length()) {
    int sep = inputString.indexOf('&', start);
    if (sep == -1) sep = inputString.length();  // Ultimo segmento

    String part = inputString.substring(start, sep);
    if (part.length() >= 5) {
      int index = part.substring(0, 2).toInt() - 1;        // es. "01" -> 1
      int value = part.substring(2, 5).toInt();        // es. "025" -> 25
      if (index >= 0 && index < NUMBER_MOTORS) {
        valuesMotors[index] = value;
        analogWrite(motorPin[index], valuesMotors[index]);
        printMotor(index,valuesMotors[index]);
        //if(index - lastIndex  > 1 ) turnOffMotors( lastIndex +1,  index);
      }
      lastIndex = index;
    }

    start = sep + 1;
  }

}


void manageMotorsWithBT(){
  
  while ( BTSerial.available() > 0) {
    char inChar = (char)BTSerial.read();
    Serial.print(inChar);
    if (inChar == '\n') {
      
      if ( inputString.endsWith("#") ) {
        
        inputString.remove(inputString.length() - 1);// remove '#' at the end

        if (messageInProgress) {
          finalMessage += "&" + inputString;
        } else {
          finalMessage = inputString;
          messageInProgress = true;
        }
        
        inputString = "";
      } else {
        finalMessage = inputString;
        inputString = "";  // Reset
        messageInProgress = false;
        stringComplete = true;
      }
    } else {
      inputString += inChar;
    }
  }

  if(stringComplete ){
    inputString.trim();  

    Serial.print("📩 Command recieved: ");
    Serial.println(finalMessage);

    inputString.trim();

    processMessage(finalMessage);

    finalMessage = "";  
    inputString = "";
    messageInProgress = false;
    stringComplete = false;
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