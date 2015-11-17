int led = 11;
int button = 2;
int potentiometer = A0;
int potentiometer2 = A1;

int ledIntensity;
int ledSpeed;

int code[] = {1, 1, 1, 2, 2, 2, 1, 1, 1};
int pointer = 0;

void setup() {
  pinMode(led, OUTPUT);
  pinMode(button, INPUT_PULLUP); // Pull-up resistor
  pinMode(potentiometer, INPUT);
  pinMode(potentiometer2, INPUT);

  Serial.begin(115200);
}

void loop() {

  bool buttonValue = !digitalRead(button);
  Serial.println(buttonValue);

  if (buttonValue == true) {
    sos(code[pointer]);
    // Move to the next position
    pointer++;
    // If end of array, go back to 0
    if (pointer == sizeof(code) / 2) {
      pointer = 0;
    }
  }
  else {
    pointer = 0;
  }
}

void checkIntensity() {
  int potValue = analogRead(potentiometer2);
  Serial.println(potValue);
  ledIntensity = map(potValue, 0, 1023, 0, 255);
}

void checkSpeed() {
  int potValue = analogRead(potentiometer);
  Serial.println(potValue);
  ledSpeed = potValue;
}

void sos(int value) {

  checkSpeed();
  checkIntensity();
  
  // Common to short and long
  analogWrite(led, ledIntensity);
  
  // Short delay
  if (value == 1) {
    delay(ledSpeed / 2);
  }
  // Long delay
  else if (value == 2) {
    delay(ledSpeed);
  }
  // Interval
  digitalWrite(led, LOW);
  delay(ledSpeed);
}
