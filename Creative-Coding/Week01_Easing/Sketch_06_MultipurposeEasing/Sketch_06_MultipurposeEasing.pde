// Now using the Processing Ani external library

import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;


Shape shape;


void setup() {
  size(500, 400);
  background(0);

  Ani.init(this);
  shape = new Shape(3);
}


void draw() {
  shape.draw();
}


void mouseClicked() {
  shape.setRandomPoints();
  
}

void keyPressed() {
  // Erase the drawing when pressing any key
  background(0);
}