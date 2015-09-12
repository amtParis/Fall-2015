// Variables to store color information
int red;
int green;
int blue;

// Size of the circle
int size = 100;

void setup() {
  size(400, 400);
  background(255);

  // Initialize red, green, blue
  red = 255;
  green = 255;
  blue = 255;
  
  // No stroke by default
  noStroke();
}

void draw() {
}

void mouseDragged() {
  println("Dragged");
  int alpha = (int) map(mouseX*mouseY, 0, width * height, 20, 100);
  int red = (int) map(mouseX, 0, width, 0, 255);
  int green = (int) map(mouseY, 0, height, 0, 255);
  
  // If mouse dragged with left button pressed then we draw a filled circle
  if (mouseButton == LEFT) {
    fill(red, green, blue, alpha);
    noStroke();
  }
  // Else if mouse dragged with right button pressed then we draw only the border of the circle
  else {
    stroke(red, green, blue, alpha);
    noFill();
  }
  
  // Call the function which will draw the shape
  useTool();
}

void useTool() {
    ellipse(mouseX, mouseY, size, size);
}

void mouseClicked() {
  println("Clicked");
  // If we click (without moving the mouse), then we draw a white circle
  // Fill white, no stroke
  fill(255);
  noStroke();
  // Call the function which will draw the shape
  useTool();
}