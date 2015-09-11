/**
 * oscP5broadcastClient by andreas schlegel
 * an osc broadcast client.
 * an example for broadcast server is located in the oscP5broadcaster exmaple.
 * oscP5 website at http://www.sojamo.de/oscP5
 */

import oscP5.*;
import netP5.*;


OscP5 oscP5;

int x = -10;
int y = -10;

/* a NetAddress contains the ip address and port number of a remote location in the network. */
NetAddress broadcastingServer; 

void setup() {
  size(400,400);
  frameRate(25);
  
  /* create a new instance of oscP5. 
   * 12000 is the port number you are listening for incoming osc messages.
   */
  oscP5 = new OscP5(this, 12000);
  
  /* create a new NetAddress. a NetAddress is used when sending osc messages
   * with the oscP5.send method.
   */
  
  /* the address of the osc broadcast server */
  broadcastingServer = new NetAddress("127.0.0.1",32000);
}


void draw() {
  background(0);
  fill(255);
  ellipse(x, y, 10, 10);
}


void mouseDragged() {
  /* create a new OscMessage with an address pattern, in this case /test. */
  OscMessage message = new OscMessage("/mouse");
  /* add a the mouse X and Y position (integer) to the OscMessage */
  message.add(mouseX);
  message.add(mouseY);
  /* send the OscMessage to a remote location specified in myNetAddress */
  oscP5.send(message, broadcastingServer);
}


void keyPressed() {
  OscMessage m;
  switch(key) {
    case('c'):
      /* connect to the broadcaster */
      m = new OscMessage("/server/connect",new Object[0]);
      oscP5.flush(m,broadcastingServer);  
      break;
    case('d'):
      /* disconnect from the broadcaster */
      m = new OscMessage("/server/disconnect",new Object[0]);
      oscP5.flush(m,broadcastingServer);  
      break;

  }  
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage message) {
  /* get and print the address pattern and the typetag of the received OscMessage */
  println("### received an osc message with addrpattern "+message.addrPattern()+" and typetag "+message.typetag());
  message.print();
  if (message.checkAddrPattern("/mouse") && message.checkTypetag("ii")) {
    x = message.get(0).intValue();
    y = message.get(1).intValue();
    
  }
}