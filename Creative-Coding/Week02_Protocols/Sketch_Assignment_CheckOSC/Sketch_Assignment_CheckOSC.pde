import netP5.*;
import oscP5.*;

OscP5 oscP5;

String[] expectedAddresses = {
  "/cursor", 
  "/background", 
  "/color/fill", 
  "/color/stroke", 
  "/clear", 
  "/fill", 
  "/message", 
  "/character", 
};

String[] expectedTypeTags = {
  "ii", 
  "fff", 
  "ffff", 
  "ffff", 
  "", 
  "T or F", 
  "s", 
  "c", 
};

boolean[] results;

void setup() {
  size(400, 400);
  frameRate(25);

  results = new boolean[10];

  for (int i=0; i<8; i++) {
    results[i] = false;
  }

  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 12000);

  oscP5.plug(this, "updateCursor", "/cursor");
  oscP5.plug(this, "updateBackground", "/background");
  oscP5.plug(this, "updateFill", "/color/fill");
  oscP5.plug(this, "updateStroke", "/color/stroke");
  oscP5.plug(this, "clearAll", "/clear");
  oscP5.plug(this, "updateFill", "/fill");
  oscP5.plug(this, "displayMessage", "/message");
  oscP5.plug(this, "addToString", "/character");
}

void updateCursor(float x, float y) {
  results[0] = true;
}

void updateBackground(float r, float g, float b) {
  background(r, g, b);
  results[1] = true;
}

void updateFill(float r, float g, float b, float a) {
  results[2] = true;
}
void updateStroke(float r, float g, float b, float a) {
  results[3] = true;
}
void clearAll() {
  results[4] = true;
}
void updateFill(Boolean b) {
  results[5] = true;
}
void displayMessage(String s) {
  results[6] = true;
}
void addToString(char c) {
  results[7] = true;
}


void draw() {
  background(0);
  for (int i=0; i<8; i++) {
    text(expectedAddresses[i], 20, 40+i*30);
    text(expectedTypeTags[i], 200, 40+i*30);
    text(results[i] ? "PASSED" : "---", width-100, 40+i*30);
  }
}


void oscEvent(OscMessage message) {
  /* check if message has the address pattern we are looking for. */

  if (!message.isPlugged()) {
    if (message.checkAddrPattern("/fill")) {
      // Not sure how to use plug with a boolean so using this workaround 
      if (message.checkTypetag("T")) {
        updateFill(true);
      } else if (message.checkTypetag("F")) {
        updateFill(false);
      }
      println("Invalid request");
      println("Address pattern " + message.addrPattern());
      println("Type tag" + message.typetag());
      return;
    }
  }
}