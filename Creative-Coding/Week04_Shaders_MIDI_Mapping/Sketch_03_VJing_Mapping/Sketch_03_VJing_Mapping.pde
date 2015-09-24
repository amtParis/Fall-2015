/*

  Sketch intended to be used with a Korg nanoKontrol2
  (but not limited to)

*/


import rwmidi.*;

PImage img;

// Array of shaders
PShader[] shaders = new PShader[8];

// Array to keep track of activated shaders
boolean[] useShader = new boolean[8];

// Array to keep track of shaders parameters
boolean[] useRandom = new boolean[8];
float[] coef = new float[8];
float[] val1 = new float[8];

// Midi input device
MidiInput inputMIDIDevice; 
int deviceId = 0;


void setup() {
  size(760, 360, P2D);

  // Show available MIDI input devices in console 
  MidiInputDevice devices[] = RWMidi.getInputDevices();
  for (int i = 0; i < devices.length; i++) { 
    println(i + ": " + devices[i].getName());
  } 

  // Use the the value of deviceId to create a MIDI input device 
  inputMIDIDevice = RWMidi.getInputDevices()[deviceId].createInput(this);


  // Load the image
  img = loadImage("LOLCat.jpg");

  // Load some shaders and put them in an array
  int id = 0;
  shaders[id++] = loadShader("crBlueinvert.frag");
  shaders[id++] = loadShader("crRedinvert.frag");
  shaders[id++] = loadShader("crGreeninvert.frag");
  shaders[id++] = loadShader("pixelated.frag");
  shaders[id++] = loadShader("channelslinear.frag");
  shaders[id++] = loadShader("badtv.frag");
  shaders[id++] = loadShader("leds.frag");
  shaders[id++] = loadShader("invert.frag");

  // Populate the shaders parameters arrays with default values
  for (int i=0; i<useShader.length; i++) {
    useShader[i] = false;
    useRandom[i] = false;
    coef[i] = 0;
    val1[i] = 0;
  }
}


void draw() {
  background(0);

  // Draw the image
  image(img, 0, 0, width, height);

  // Apply shaders
  for (int i=0; i<shaders.length; i++) {
    if (useShader[i]) {
      shaders[i].set("timer", millis()/1000);
      shaders[i].set("random1", useRandom[i] ? random(1)  : 1);

      shaders[i].set("coef", coef[i]);
      shaders[i].set("val1", val1[i]);

      filter(shaders[i]);
    }
  }

  surface.setTitle(nf((int)frameRate, 2));
}

// Control Change received
// We removed other methods since we only receive Control Change
void controllerChangeReceived(Controller cc) {
  println("Controller Change: Channel/" +  cc.getChannel() + " Number/" +cc.getCC() + " Value/" + cc.getValue() );
  
  int ctrl = cc.getCC();
  
  if (ctrl >= 32 && ctrl <=39 && cc.getValue() == 127) { // S buttons
    useShader[ctrl-32] = !useShader[ctrl-32];
  }
  
  if (ctrl >= 64 && ctrl <=71 && cc.getValue() == 127) { // R buttons
    useRandom[ctrl-64] = !useRandom[ctrl-64];
  }

  if (ctrl >= 16 && ctrl <=23) { // Top knobs
    coef[ctrl-16] = map(cc.getValue(), 0, 127, 0, 1);
  }

  if (ctrl >= 0 && ctrl <=7) { // Sliders
    val1[ctrl] = map(cc.getValue(), 0, 127, 0, 1);
  }
  
  if (ctrl == 42 && cc.getValue() == 127) { // STOP button
    for(int i=0; i<useShader.length; i++) {
      useShader[i] = false;
    }
  }
}