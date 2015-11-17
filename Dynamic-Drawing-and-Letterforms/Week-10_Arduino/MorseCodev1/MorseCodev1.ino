int led = 11;
int button = 2;
int potentiometer = A0;
int potentiometer2 = A1;

int ledIntensity;
int ledSpeed;

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
    sos();
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

void sos() {
  for (int i = 0; i < 3; i++) {
    checkSpeed();
    checkIntensity();
    shortCode();
    interval();
  }
  for (int i = 0; i < 3; i++) {
    checkSpeed();
    checkIntensity();
    longCode();
    interval();
  }
  for (int i = 0; i < 3; i++) {
    checkSpeed();
    checkIntensity();
    shortCode();
    interval();
  }
}

// Short
void shortCode() {
  analogWrite(led, ledIntensity);
  delay(ledSpeed / 2);
}

void longCode() {
  // Long
  analogWrite(led, ledIntensity);
  delay(ledSpeed);
}

// Interval
void interval() {
  digitalWrite(led, LOW);
  delay(ledSpeed);
}
