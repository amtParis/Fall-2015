import oscP5.*;
import netP5.*;

OscP5 oscP5;

void setup() {
  size(400, 400);

  // Listening from this computer/application on port 12000
  oscP5 = new OscP5(this, 12001);

}


void draw() {
  background(0);
}

// This is where we receive the new messages
void oscEvent(OscMessage msg) {
  // When receiving a message, just print info to the console (for demo purpose)
  println("### new message OSC");
  println("address pattern: "+ msg.addrPattern());
  println("type tag: "+ msg.typetag());
}