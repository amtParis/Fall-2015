
//
// REQUIRES THE RWMIDI REVIVAL LIBRARY
// https://github.com/torrejuseppe/rwmidi-revival
//

/*
Receiving MIDI messages in processing.
 1) Select MIDI device you want to receive from.
 - Run the sketch and check console for list of available devices
 - change deviceId number to match you MIDI controller:
 
 2) Play any MIDI message from you device and see the console output
 */

import rwmidi.*;  

MidiInput mymididevice; 

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

  // Currently we assume the first device (#0) is the one we want 
  mymididevice = RWMidi.getInputDevices()[deviceId].createInput(this);
} 

void draw() {
} 

//Note ON recieved 
void noteOnReceived(Note myreceivednote) {
  println("note on " + myreceivednote.getPitch()+ "  " + myreceivednote.getVelocity());
}

// Note Off recieved 
void noteOffReceived(Note myreceivednote) {
  println("note off " + myreceivednote.getVelocity());
}

// Program Change recieved  
void programChangeReceived(ProgramChange pc) {
  println("program change " + pc.getNumber());
}

// Control Change recieved 
void controllerChangeReceived(Controller cc) {
  println("cc number is: " + cc.getCC() + "  " + "cc value is:  " + cc.getValue() );
}

// System Exclusive recieved 
void sysexReceived(SysexMessage msg) {
  println("sysex " + msg);
}