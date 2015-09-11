//
// REQUIRES THE RWMIDI REVIVAL LIBRARY
// https://github.com/torrejuseppe/rwmidi-revival
//

MidiManager mmgr;
GeneralController gctrl;

void setup() {
  size(400, 300, OPENGL);
   if (surface != null) {
    surface.setResizable(true);
  }

  gctrl = new GeneralController(this);
  mmgr = new MidiManager(this, gctrl);
}


void draw() {
  background(0);
  gctrl.draw();
  
}