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
    coef[i] = 0.1;
    val1[i] = 0.1;
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

// Use the functions below to map MIDI messages to shaders parameters


// Control Change recieved 
void controllerChangeReceived(Controller cc) {
  println("Controller Change: Channel/" +  cc.getChannel() + " Number/" +cc.getCC() + " Value/" + cc.getValue() );
  
  // Coef 1
  if(cc.getCC() >= 16 && cc.getCC() <= 23) {
   coef[cc.getCC()-16] =  map(cc.getValue(), 0, 127, 0, 1);
  }

  // Val 1
  if(cc.getCC() >= 0 && cc.getCC() <= 7) {
   val1[cc.getCC()] =  map(cc.getValue(), 0, 127, 0, 1);
  }
  
  // Use Shader Press twice to toggle
  if((cc.getCC() >= 32 && cc.getCC() <= 39) && cc.getValue() == 127) {
   useShader[cc.getCC()-32] = !useShader[cc.getCC()-32];
  }

  // Alternative // Use Shader ON when pressed OFF when released
  //if((cc.getCC() >= 32 && cc.getCC() <= 39)) {
  // useShader[cc.getCC()-32] = cc.getValue() == 127;
  //}

  // Use Random Press twice to toggle
  if((cc.getCC() >= 64 && cc.getCC() <= 71) && cc.getValue() == 127) {
   useRandom[cc.getCC()-64] = !useRandom[cc.getCC()-64];
  }

  // All Random/glitch ON
  if(cc.getCC() == 46) {
    for(int i=0; i<useRandom.length; i++) {
      useRandom[i] = true;
    }
  }
  
  // Set all filters to either ON or OFF
  if(cc.getCC() == 58 || cc.getCC() == 59) {
    for(int i=0; i<useRandom.length; i++) {
      useShader[i] = cc.getCC() == 58;
    }
  }


}