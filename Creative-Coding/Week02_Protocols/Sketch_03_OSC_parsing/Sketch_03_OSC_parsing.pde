import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress recipient;

// Two variables used to store the current background and fill colors
color backgroundColor = color(0);
color fillColor = color(255);

void setup() {
  size(400, 400);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 12000);

  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  recipient = new NetAddress("127.0.0.1", 12000);
}

// Draw an ellipse using the current backgroundColor and fillColor values
void draw() {
  background(backgroundColor);
  fill(fillColor);
  noStroke();
  ellipse(width/2, height/2, 100, 100);
}

// Set the backgroundColor variable to the given grayscale value
void setBackground(int gray) {
  backgroundColor = color(gray);
}

// Set the backgroundColor variable to the given rgb value
void setBackground(int r, int g, int b) {
  backgroundColor = color(r, g, b);
}


// Set the fillColor variable to the given grayscale value
void setFill(int gray) {
  fillColor = color(gray);
}


// Set the fillColor variable to the given rgb value
void setFill(int r, int g, int b) {
  fillColor = color(r, g, b);
}


void keyPressed() {
  // Use keys to send OSC messages
  
  // b -> black background 
  // w -> white background
  // r -> random background

  // b -> black fill 
  // w -> white fill
  // r -> random fill

  // Background methods
  if (key == 'b') {
    OscMessage myMessage = new OscMessage("/color/setBackground");
    myMessage.add(0);
    oscP5.send(myMessage, recipient);
  } else if (key == 'w') {
    OscMessage myMessage = new OscMessage("/color/setBackground");
    myMessage.add(255);
    oscP5.send(myMessage, recipient);
  } else if (key == 'r') {
    OscMessage myMessage = new OscMessage("/color/setBackground");
    myMessage.add((int) random(255));
    myMessage.add((int) random(255));
    myMessage.add((int) random(255));
    oscP5.send(myMessage, recipient);
  }

  // Fill methods
  else if (key == 'B') {
    OscMessage myMessage = new OscMessage("/color/setFill");
    myMessage.add(0);
    oscP5.send(myMessage, recipient);
  } else if (key == 'W') {
    OscMessage myMessage = new OscMessage("/color/setFill");
    myMessage.add(255);
    oscP5.send(myMessage, recipient);
  } else if (key == 'R') {
    OscMessage myMessage = new OscMessage("/color/setFill");
    myMessage.add((int) random(255));
    myMessage.add((int) random(255));
    myMessage.add((int) random(255));
    oscP5.send(myMessage, recipient);
  }
}



/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {

  // Steps :
  // 1- Check Address patterm
  // 2- Check type tag
  // 3- Get info according to type tag types
  // 4- Do something with this info

  // Background commands
  if (theOscMessage.checkAddrPattern("/color/setBackground")) {
    println("Background command received");
    if (theOscMessage.checkTypetag("iii")) { // RGB color
      int r = theOscMessage.get(0).intValue();
      int g = theOscMessage.get(1).intValue();
      int b = theOscMessage.get(2).intValue();
      setBackground(r, g, b);
    } else if (theOscMessage.checkTypetag("i")) { // Grayscale
      int grayscale = theOscMessage.get(0).intValue();
      setBackground(grayscale);
    }
  }

  // Fill commands
  else if (theOscMessage.checkAddrPattern("/color/setFill")) {
    println("Fill command received");
    if (theOscMessage.checkTypetag("iii")) { // RGB color
      int r = theOscMessage.get(0).intValue();
      int g = theOscMessage.get(1).intValue();
      int b = theOscMessage.get(2).intValue();
      setFill(r, g, b);
    } else if (theOscMessage.checkTypetag("i")) { // Grayscale
      int grayscale = theOscMessage.get(0).intValue();
      setFill(grayscale);
    }
  }

  // Unknown command received 
  else {
    /* print the address pattern and the typetag of the received OscMessage */
    println("### Unknown command : received an osc message.");
    println(" addrpattern: "+theOscMessage.addrPattern());
    println(" typetag: "+theOscMessage.typetag());
  }
}