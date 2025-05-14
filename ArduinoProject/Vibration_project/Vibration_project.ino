#include <SoftwareSerial.h>
#include <Adafruit_PWMServoDriver.h>
#define SERVOMIN 150

#define NUMBER_MOTORS 20

SoftwareSerial BTSerial(2, 3); // RX, TX

  
//Mapping motors
const int motorPin[] = {
  11, //00
  12, //01
  13, //02
  14, //03
  22, //04
  33, //05
  34, //06
  35, //07
  37, //08
  38, //09
  39, //10
  40, //11
  41, //12
  42, //13
}; 


String inputString = "";
bool stringComplete = false;

String finalMessage = "";
bool messageInProgress = false;

int valuesMotors[NUMBER_MOTORS] = {0}; 

void setup() {
  Serial.begin(9600);     
  BTSerial.begin(9600);   
  
  inputString.reserve(50);
  Serial.println("🟢 Arduino ready (BT via pin 4-3)");


}

void loop() {

  manageMotorsWithBT();
  
}


void turnOffMotors(int startIndexMotor, int endIndexMotor){
  for(int indexMotor = startIndexMotor; indexMotor < endIndexMotor; indexMotor++ ){
    if( valuesMotors[indexMotor] > 0) analogWrite(motorPin[indexMotor], 0);
  }
}

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
        if(index - lastIndex  > 1 ) turnOffMotors( lastIndex +1,  index);
      }
      lastIndex = index;
    }

    start = sep + 1;
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

void manageMotorsWithBT(){
  
  while ( BTSerial.available() > 0) {
    char inChar = (char)BTSerial.read();
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

