//
// This is the template to send messages add your code to the keyPressed function below
// Run the Sketch_Assignment_CheckOSC sketch before running this one to test the results
//

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress recipient;

void setup() {
  size(400, 400);

  // Listening from this computer/application on port 12666
  oscP5 = new OscP5(this, 12666);

  // Since we're sending the messages to the same machine, we'll still use 127.0.0.1 as IP address
  // We use a different port number : 12000 corresponding to the listening port of the other sketch
  recipient = new NetAddress("127.0.0.1", 12000);
}


void draw() {
  background(0);
}

// When pressing one of the keys (from 0 to 8), we trigger a message
void keyPressed() {

  if (key == ' ') { // Just a sample 
    OscMessage msg = new OscMessage("/test"); // Create a new message having the pattern "/test"
    msg.add(123); // Add and integer to it
    oscP5.send(msg, recipient); // Send the message
  }
  
  else if (key == '1') {
    // Your code goes here
  }
  else if (key == '2') {
    // Your code goes here
  }
  else if (key == '3') {
    // Your code goes here
  }
  else if (key == '4') {
    // Your code goes here
  }
  else if (key == '5') {
    // Your code goes here
  }
  else if (key == '6') {
    // Your code goes here
  }
  else if (key == '7') {
    // Your code goes here
  }
  else if (key == '8') {
    // Your code goes here
  }
}