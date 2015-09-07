// Same as previously but uses a new object to store Easing fucntions

Easing ez;

void setup() {
  size(500, 400);
  background(0);

  noStroke();
  fill(255, 100);

  // Create an instance of the easing function
  ez = new Easing();
}


void draw() {
  
  ez.update();
  
  ellipse(ez.current.x, ez.current.y, 10, 10);
}


void mouseMoved() {
  // When the mouse is moved, change target
  ez.setTarget(mouseX, mouseY);
}

void keyPressed() {
  // Erase the drawing when pressing any key
  background(0);
  
}