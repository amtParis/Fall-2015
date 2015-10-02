import de.looksgood.ani.*;
import processing.sound.*;

SoundFile soundfile;
float rateValue = 1;

void setup() {
  size(512, 512);
  smooth();
  // you have to call always Ani.init() first!
  Ani.init(this);

  // Load a sound
  soundfile = new SoundFile(this, "vibraphon.aiff");
  soundfile.loop();
}

void draw() {
  background(255);
  fill(0);
  noStroke();
  ellipse(width/2, height/2, rateValue * 100, rateValue * 100);
  soundfile.rate(rateValue);
}

void mousePressed() {
  Ani.to(this, 2., "rateValue", 4.0, Ani.ELASTIC_IN);
}

void mouseReleased() {
  Ani.to(this, 4.0, "rateValue", 0.25, Ani.ELASTIC_IN_OUT);
}