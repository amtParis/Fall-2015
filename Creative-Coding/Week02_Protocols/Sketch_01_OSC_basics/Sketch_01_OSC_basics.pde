import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress recipient;

void setup() {
  size(400, 400);

  // Listening from this computer/application on port 12000
  oscP5 = new OscP5(this, 12000);

  // Since we're sending the messages to ourselves, we'll use 127.0.0.1 as IP address
  // 127.0.0.1 is a loopback IP address of any computer with an installed network card
  // 12000 is a port number. Could be anything else (almost)
  recipient = new NetAddress("127.0.0.1", 12000);
}


void draw() {
  background(0);
}

// When pressing one of the mouse buttons, we trigger a message
void mousePressed() {
  // Create a new message having the pattern "/test"
  OscMessage msg = new OscMessage("/test");

  msg.add(123); // Add and integer to it

  // Send the message
  oscP5.send(msg, recipient);
}

// This is where we receive the new messages
void oscEvent(OscMessage msg) {
  // When receiving a message, just print info to the console (for demo purpose)
  println("### new message OSC");
  println("address pattern: "+ msg.addrPattern());
  println("type tag: "+ msg.typetag());
}