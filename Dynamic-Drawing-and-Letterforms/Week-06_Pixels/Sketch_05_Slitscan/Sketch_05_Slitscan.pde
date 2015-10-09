/*

Slit scan code from Golan Levin
http://www.flong.com/texts/lists/slit_scan/

*/

import processing.video.*;
Capture capture;

int x=0;

void setup() {
  size(600, 240);
  
  capture = new Capture(this, 320, 240);
  capture.start();
  
}

void draw() {
  if (capture.available()) {
    capture.read();
    capture.loadPixels();
    x = ++x % width;
    copy(capture, capture.width/2, 0, 1, capture.height, x, 0, 1, height);
  }
}

