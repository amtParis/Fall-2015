import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress recipient;

void setup() {
  size(400, 400);

  // Listening from this computer/application on port 12000
  oscP5 = new OscP5(this, 12000);

  // Since we're sending the messages to the same machine, we'll still use 127.0.0.1 as IP address
  // We use a different port number : 12001 corresponding to the listening port of the other sketch
  recipient = new NetAddress("127.0.0.1", 12001);
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