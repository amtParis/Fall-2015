// Camera easing
// See camera reference on https://processing.org/reference/camera_.html

import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;


Point eye; // View point
Point center; // Center of the scene
PVector up = new PVector(0, 1, 0); // Camera orientation


void setup() {
  size(500, 400, OPENGL);
  Ani.init(this);
  
  // Default eye position (point of view) in Procesgin 
  PVector eyeOrigin = new PVector(width/2., height/2., (height/2.0) / tan(PI*30.0 / 180.0));
  // Direction to look at
  PVector centerOrigin = new PVector(width/2., height/2., 0);

  eye = new Point(eyeOrigin, eyeOrigin);
  center = new Point(centerOrigin, centerOrigin);
  
}


void draw() {
  background(0);

  camera(eye.pos.x, eye.pos.y, eye.pos.z, center.pos.x, center.pos.y, center.pos.z, up.x, up.y, up.z);
  lights();
  ambientLight(102, 102, 182);
  //directionalLight(51, 102, 126, 0, 1, -1);
  
  pushMatrix();
  pushStyle();
  translate(width/2.-100, height/2., 0);
  fill(255);
  rotateY(PI/3);
  box(45);
  popStyle();
  popMatrix();

  pushMatrix();
  pushStyle();
  translate(width/2.+100, height/2., -100);
  noStroke();
  sphere(50);
  popStyle();
  popMatrix();
}


void mouseClicked() {
}

void keyPressed() {
  
  // Moe the "eye" to a different location, meaning a different point of view
  
  if (keyCode == LEFT) {
    eye.setTarget(new PVector(0, height/2., (height/2.0) / tan(PI*30.0 / 180.0)));
  } else if (keyCode == RIGHT) {
    eye.setTarget(new PVector(width, height/2., (height/2.0) / tan(PI*30.0 / 180.0)));
  } else if (keyCode == UP) {
    eye.setTarget(new PVector(width/2., 0, (height/2.0) / tan(PI*30.0 / 180.0)));
  } else if (keyCode == DOWN) {
    eye.setTarget(new PVector(width/2., height, (height/2.0) / tan(PI*30.0 / 180.0)));
  } else if (key == ' ') {
    eye.setTarget(new PVector(width/2., height/2., (height/2.0) / tan(PI*30.0 / 180.0)));
  }
}