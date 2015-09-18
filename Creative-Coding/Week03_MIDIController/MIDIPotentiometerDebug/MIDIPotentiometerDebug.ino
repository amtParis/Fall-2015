#include <MIDI.h>

#define CHANNEL 1 // We'll use channel 1
#define POT_1 A0 // Potentiometer using analog pin A0
#define CTRL_1 1 // Potentiometer 1 will be controller 1

int pot_1_LastState;

MIDI_CREATE_DEFAULT_INSTANCE();

boolean testMode = true;

void setup() {
  pinMode(POT_1, INPUT);
  if (testMode) { // Use the serial monitor
    Serial.begin(9600);
  }
  else { // Use MIDI output
    MIDI.begin(); // Launch MIDI with default options
  }

  // Set startup values
  pot_1_LastState = getValueFromAnalog(POT_1);
}

void loop() {

  // Read the sliders / potentiometers values
  int pot_1_State = getValueFromAnalog(POT_1);

  if (pot_1_State != pot_1_LastState) { // If changed, send new value
    sendControlChange(CTRL_1, pot_1_State, CHANNEL);
    pot_1_LastState = pot_1_State; // Save the last state
  }

  delay(10);    // Wait a bit
}

// Function to either send on MIDI or Serial
void sendControlChange(int controller, int value, int channel) {
  if (testMode) {
    Serial.print("Control change: ");
    Serial.print("Controller: ");
    Serial.print(controller);
    Serial.print(" Value: ");
    Serial.print(value);
    Serial.print(" on channel ");
    Serial.println(channel);
  }
  else {
    MIDI.sendControlChange(controller, value, channel);
  }
}

// Return the potentiometer value (originally between 0, 1023) mapped to 0, 127 (for MIDI)
int getValueFromAnalog(int pin) {
  int value = analogRead(pin);
  return map(value, 0, 1023, 0, 127);
}

