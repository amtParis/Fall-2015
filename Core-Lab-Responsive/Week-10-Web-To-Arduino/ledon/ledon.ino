int ledPin = 13;
char val;

void setup(){
  Serial.begin(9600);
  while(!Serial){
    ;
  }

  pinMode(13,OUTPUT);
}


void loop(){
  if (Serial.available()) { // If data is available to read,
    val = Serial.read(); // read it and store it in val
  }
  // get incoming byte:
  if (val == 'H') { // If H was received
    digitalWrite(ledPin, HIGH); // turn the LED on
  } 
  else {
    digitalWrite(ledPin, LOW); // Otherwise turn it OFF
  }
  delay(2); // Wait 100 milliseconds for next reading

}

