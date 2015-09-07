// Two vectors to store the current position and its destination
PVector current;
PVector target;

// Interpolation speed
float speed = 0.025;

void setup() {
 size(500, 400);
 background(0);
 
 noStroke();
 fill(255, 100);
 
 // Center the current and target in the middle of the screen
 current = new PVector(width/2, height/2);
 target = new PVector(width/2, height/2);
}


void draw() {
  ellipse(current.x, current.y, 10, 10);
  
  // Interpolate the current position to the target position
  
  // PVector built-in method
  //current.lerp(target, speed);
  
  // Similar to
  current.x += (target.x - current.x) * speed;
  current.y += (target.y - current.y) * speed;
  
}

void mouseMoved() {
  // When the mouse is moved, update the target position
  target.set(mouseX, mouseY);
}

void keyPressed() {
  // Erase the drawing when pressing any key
 background(0); 
}