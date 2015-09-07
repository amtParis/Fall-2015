void setup() {
 size(400, 500);
 background(0);
 noStroke();
 fill(255, 100);
}


void draw() {
  ellipse(mouseX, mouseY, 10, 10);
}

void keyPressed() {
  // Erase the drawing when pressing any key
 background(0); 
}