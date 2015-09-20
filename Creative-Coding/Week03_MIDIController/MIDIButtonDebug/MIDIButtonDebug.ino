//
// To see how to connect a button using pull up, refer to:
// https://www.arduino.cc/en/Tutorial/DigitalInputPullup
//

#include <MIDI.h>
#define BUTTON_1 2 // Assign BUTTON_1 to pin 2

bool button_1_LastState;

boolean testMode = true;

MIDI_CREATE_DEFAULT_INSTANCE();

void setup() {
  pinMode(BUTTON_1, INPUT_PULLUP);
  
  if (testMode) { // Use the serial monitor
    Serial.begin(9600);
  }
  else { // Use MIDI output
    MIDI.begin(); // Launch MIDI with default options
  }

  // Set startup values
  button_1_LastState = digitalRead(BUTTON_1);

}

void loop() {

  // Read the buttons values
  bool button_1_State = digitalRead(BUTTON_1);

  if (button_1_State != button_1_LastState) {
    if (button_1_State) { // Button changed to OFF
      sendNoteOff(10, 0, 2);
    }
    else { // Button changed to ON
      sendNoteOn(10, 100, 2);
    }
    button_1_LastState = button_1_State; // Remember the last state
  }

  delay(10); // Wait a bit
}


// Function to either send on MIDI or Serial
void sendNoteOn(int pitch, int velocity, int channel) {
  if (testMode) {
    Serial.print("Note ON: ");
    Serial.print("Pitch: ");
    Serial.print(pitch);
    Serial.print(" Velocity: ");
    Serial.print(velocity);
    Serial.print(" on channel ");
    Serial.println(channel);
  }
  else {
    MIDI.sendNoteOn(pitch, velocity, channel);
  }
}

// Function to either send on MIDI or Serial
void sendNoteOff(int pitch, int velocity, int channel) {
  if (testMode) {
    Serial.print("Note OFF: ");
    Serial.print("Pitch: ");
    Serial.print(pitch);
    Serial.print(" Velocity: ");
    Serial.print(velocity);
    Serial.print(" on channel ");
    Serial.println(channel);
  }
  else {
    MIDI.sendNoteOff(pitch, velocity, channel);
  }
}

