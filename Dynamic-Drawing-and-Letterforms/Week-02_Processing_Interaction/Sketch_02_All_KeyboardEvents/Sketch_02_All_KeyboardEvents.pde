//
// This sketch will display information about the various keyboard events
//

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
}

void keyPressed() {
  // When you press (hold) a key
  // The key value can be retrieved through the "key" variable
  println("Key pressed: " + key);
}

void keyReleased() {
  // When you release a key
  // The key value can be retrieved through the "key" variable
  println("Key released: " + key);

}

void keyTyped() {
  // When you press (hold) a key which makes a character (doesn't get called for Cmd, Alt, Shift)
  // The key value can be retrieved through the "key" variable
  println("Key typed: " + key);  
}