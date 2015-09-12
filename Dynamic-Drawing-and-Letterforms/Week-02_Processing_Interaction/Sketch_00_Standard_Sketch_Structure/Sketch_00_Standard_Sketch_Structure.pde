void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  // Pick two random values (between -50 and 50) and assign them to xShift and yShift
  float xShift = random(-50, 50);
  float yShift = random(-50, 50);
  // Draw an ellipse in the center of the window, shifted be the two values we got above
  ellipse(width/2 + xShift, height/2 + yShift, 100, 100);
}