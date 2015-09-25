Pt point = new Pt();

// Alternative : just say you'll use a Pt object without instanciating it
// Pt point;


void setup() {
  size(600, 600);
  background(255);
  
  point.x = width/2;
  point.y = height/2;
  
  // Alternative (in case you used the alternative above)
  // Instanciate the object pt using the second contructor
  // pt = new Pt(width/2, height/2);
}

void draw() {
  point.draw();
  point.step();
}