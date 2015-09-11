import dmxP512.*;
import processing.serial.*;

// Sample tested with the ENNTEC DMXUSB PRO controller
// Device used : MPX-405
// Set it to : 
// RECEIVE MODE
// DMX Channel A.001


DmxP512 dmxOutput;
int universeSize = 1; // Max is 512

String DMXPRO_PORT = "/dev/cu.usbserial-EN169244";

int DMXPRO_BAUDRATE = 115000;


void setup() {

  size(255, 255);  

  dmxOutput = new DmxP512(this, universeSize, true);
  dmxOutput.setupDmxPro(DMXPRO_PORT, DMXPRO_BAUDRATE);
}

void draw() {    
  int gray = (int) map(mouseX, 0, width, 0, 255);
  background(gray);

  // Sample : change intensity on a 4 channels fixture
  dmxOutput.set(1, gray);
  dmxOutput.set(2, 255 - gray); // Inverse value on channel 2
  dmxOutput.set(3, gray);
  dmxOutput.set(4, 255 - gray); // Inverse value on channel 3
}