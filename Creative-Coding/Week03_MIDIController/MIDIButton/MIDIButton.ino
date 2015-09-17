#include <MIDI.h>
#define BUTTON_1 2 // Assign BUTTON_1 to pin 2

bool button_1_LastState;

MIDI_CREATE_DEFAULT_INSTANCE();

void setup() {
  pinMode(BUTTON_1, INPUT_PULLUP);
  MIDI.begin(); // Launch MIDI with default options

  // Set startup values
  button_1_LastState = digitalRead(BUTTON_1);

}

void loop() {

  // Read the buttons values
  bool button_1_State = digitalRead(BUTTON_1);

  if (button_1_State != button_1_LastState) {
    if (button_1_State) { // Button changed to OFF
      MIDI.sendNoteOff(10, 0, 2);
    }
    else { // Button changed to ON
      MIDI.sendNoteOn(10, 100, 2);
    }
    button_1_LastState = button_1_State; // Remember the last state
  }
  
  delay(10); // Wait a bit
}

