//
// To see how to connect a potentiometer, refer to :
// https://www.arduino.cc/en/Tutorial/Potentiometer
//

#include <MIDI.h>

#define CHANNEL 1 // We'll use channel 1
#define POT_1 A0 // Potentiometer using analog pin A0
#define CTRL_1 1 // Potentiometer 1 will be controller 1
#define THRESHOLD 1 // Potentiometer threshold

int pot_1_LastState;

MIDI_CREATE_DEFAULT_INSTANCE();

void setup() {
  pinMode(POT_1, INPUT);
  MIDI.begin(); // Launch MIDI with default options

  // Set startup values
  pot_1_LastState = getValueFromAnalog(POT_1);
}

void loop() {

  // Read the sliders / potentiometers values
  int pot_1_State = getValueFromAnalog(POT_1);

  if (abs(pot_1_State-pot_1_LastState) > THRESHOLD) { // If change > 2 , send new value
    MIDI.sendControlChange(CTRL_1, pot_1_State, CHANNEL);
    pot_1_LastState = pot_1_State; // Save the last state
  }

  delay(10);    // Wait a bit
}

// Return the potentiometer value (originally between 0, 1023) mapped to 0, 127 (for MIDI)
int getValueFromAnalog(int pin) {
  // Read and remap the value
  int value = map(analogRead(pin), 0, 1023, 0, 127);
  // Make sure values close to 0 or 127 become 0 or 127
  return value = (value == THRESHOLD ? 0 : (value == 127 - THRESHOLD ? 127 : value));
  
}

