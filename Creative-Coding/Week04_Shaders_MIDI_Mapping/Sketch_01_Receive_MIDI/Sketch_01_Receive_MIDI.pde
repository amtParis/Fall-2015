/*
Receiving MIDI messages in processing.
 1) Select MIDI device you want to receive from.
 - Run the sketch and check console for list of available devices
 - change deviceId number to match your MIDI controller:
 
 2) Play any MIDI message from you device and see the console output
 */

import rwmidi.*;  

MidiInput inputMIDIDevice; 
int deviceId = 0;

void setup() { 

  size(480, 108); 
  smooth(); 
  background(70); 

  // Show available MIDI input devices in console 
  MidiInputDevice devices[] = RWMidi.getInputDevices();
  for (int i = 0; i < devices.length; i++) { 
    println(i + ": " + devices[i].getName());
  } 

  // Use the the value of deviceId to create a MIDI input device 
  inputMIDIDevice = RWMidi.getInputDevices()[deviceId].createInput(this);
} 

void draw() {
} 


// Note On received 
void noteOnReceived(Note note) {
  println("Note ON: Channel/" + note.getChannel() + " Pitch/" + note.getPitch()+" Velocity/"  +note.getVelocity());
}
// Note Off received 
void noteOffReceived(Note note) {
  println("Note OFF: Channel/" + note.getChannel() + " Pitch/" + note.getPitch()+" Velocity/"  +note.getVelocity());
}

// Program Change received  
void programChangeReceived(ProgramChange pc) {
  println("Program Change: Channel/" + pc.getChannel() + " Number/"+ pc.getNumber());
}

// Control Change received 
void controllerChangeReceived(Controller cc) {
  println("Controller Change: Channel/" +  cc.getChannel() + " Number/" +cc.getCC() + " Value/" + cc.getValue() );
}

// System Exclusive received 
void sysexReceived(SysexMessage sysex) {
  //println("Sysex message" + sysex);
}