//
// This sketch will display information about the various mouse events
//

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
}

void mouseMoved() {
  // When the mouse is moved
  println("Mouse moved"); // println prints some information in the console
}

void mouseClicked() {
  // When you press and release a button without moving the mouse in between
  println("Mouse clicked");
  // You can then test which button was pressed by testing the value of the mouseButton variable
  if (mouseButton == LEFT) {
    println("Left button");
  } else if (mouseButton == CENTER) {
    println("Center button");
  } else if (mouseButton == RIGHT) {
    println("Right button");
  }
}

void mousePressed() {
  // When you press a button
  println("Mouse pressed");
  // You can then test which button was pressed by testing the value of the mouseButton variable
  if (mouseButton == LEFT) {
    println("Left button");
  } else if (mouseButton == CENTER) {
    println("Center button");
  } else if (mouseButton == RIGHT) {
    println("Right button");
  }
}

void mouseDragged() {
  // When the mouse is dragged (one button pressed and mouse mouved while pressing)
  println("Mouse dragged");
}

void mouseReleased() {
  // When a button is released
  println("Mouse released"); 
  // You can then test which button was pressed by testing the value of the mouseButton variable
  if (mouseButton == LEFT) {
    println("Left button");
  } else if (mouseButton == CENTER) {
    println("Center button");
  } else if (mouseButton == RIGHT) {
    println("Right button");
  }
}