import rwmidi.*;

public class MidiManager {

  MidiInput input;
  MidiOutput output;

  ArrayList<String> ports = new ArrayList<String>();

  int index = 0;
  int lastIndex;

  int msgTotal = 0;

  boolean isRegistered  = false;
  boolean trace = false;

  PApplet p;
  GeneralController gctrl;

  MidiManager(PApplet p, GeneralController gctrl) {
    this.p = p;
    p.registerMethod("keyEvent", this);

    this.gctrl = gctrl;
    toggleView();

    for (int i=0; i<RWMidi.getInputDevices().length; i++) {
      println(RWMidi.getInputDevices()[i]);
      ports.add(RWMidi.getInputDevices()[i].toString());
    }
    
    output = RWMidi.getOutputDevices()[0].createOutput();

    lastIndex = index;
    openMidiInput(index);
  }
  
  void test() {
   int ret =    output.sendNoteOn(0, 3, 3);
   ret = output.sendSysex(new byte[] {(byte)0xF0, 1, 2, 3, 4, (byte)0xF7});
  }

  // Show/hide the device list and recording information
  // Enable/disable key events in the meantime
  void toggleView() {
    if (!isRegistered) {
      p.registerMethod("draw", this);
    } else {
      p.unregisterMethod("draw", this);
    }
    isRegistered = !isRegistered;
  }

  // Draw the device list and the recording information
  void draw() {
    drawDevices(ports, index, width/2, height-75);
  }



  // Switch to the previous MIDI device
  void prevMidi() {
    lastIndex = index;
    index--;
    if (index < 0) {
      index = ports.size()-1;
    }
    openMidiInput(index);
  }

  // Switch to the next MIDI device
  void nextMidi() {
    lastIndex = index;
    index++;
    if (index > ports.size()-1) {
      index = 0;
    } 
    openMidiInput(index);
  }

  // When a MIDI note ON is received
  void noteOnReceived(Note note) {
    gctrl.note(1, note.getPitch(), note.getVelocity());
  }

  // When a MIDI note OFF is received
  void noteOffReceived(Note note) {
    gctrl.note(0, note.getPitch(), note.getVelocity());
  }

  // When a MIDI CC is received
  void controllerChangeReceived(rwmidi.Controller controller) {
    gctrl.controller(controller.getCC(), controller.getValue());
  }

  // When a MIDI Prog Change is received
  void programChangeReceived(rwmidi.ProgramChange programChange) {
    gctrl.program(programChange.getNumber());
  }

  // When a MIDI Sysex message is received
  void sysexReceived(rwmidi.SysexMessage msg) {
    gctrl.sysex(msg);
  }


  // Open a MIDI device
  void openMidiInput(int index) {
    msgTotal = 0;

    try {
      if (null != input) {
        input.close();
      }
      input = RWMidi.getInputDevices()[index].createInput(this, 0);
      println("Now using MIDI input port "+ports.get(index));
    }
    catch (Exception e) {
      println("Error while opening MIDI input port "+ports.get(index)+ " "+e);
    }
  }


  public void keyEvent(processing.event.KeyEvent e) {
    int k = e.getKey();
    int kc = e.getKeyCode();
    switch (e.getAction()) {
    case KeyEvent.PRESS:
      if (k == ' ') {
        toggleView();
      } else if (isRegistered) {
        if (kc == LEFT) {
          prevMidi();
        }
        if (kc == RIGHT) {
          nextMidi();
        }
        break;
        /*
    case KeyEvent.RELEASE:
         break;
         */
      }
    }
  }
}