// Two vectors to store the base position and its target shift
PVector base;
PVector change;
// We store the current position in a vector 
PVector current;

// Start time of the movement
float startTime;
// Duration of the transition (in milliseconds)
float duration = 1000;

void setup() {
 size(500, 400);
 background(0);
 
 noStroke();
 fill(255, 100);
 
 // Center the current and target in the middle of the screen
 base = new PVector(width/2, height/2);
 change = new PVector(0, 0);
 
 current = new PVector();
 current.set(base);
}


void draw() {
  
  // Elapsed time since start time
  float elapsedTime = millis() - startTime;
  
  // If we're under the duration, then  
  if (elapsedTime <= duration) {
    // Interpolate the current position based on time and change
    // f(x) = b + c * (t/d)
    current.x =  base.x + change.x *   elapsedTime / duration;
    current.y =  base.y + change.y *   elapsedTime / duration;
    
    ellipse(current.x, current.y, 10, 10);
  }
  
    
}


void mouseMoved() {
  // When the mouse is moved, set a new
  startTime = millis();
  base.set(current);
  change.set(mouseX - base.x, mouseY - base.y);
}

void keyPressed() {
  // Erase the drawing when pressing any key
 background(0); 
}