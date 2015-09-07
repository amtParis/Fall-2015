import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;


Point eye; // View point
Point center; // Center of the scene
PVector up = new PVector(0, 1, 0); // Camera orientation


// Array used to store all points (the path of the camera) 
PVector[] points;
int index = 0;


void setup() {
  size(500, 400, OPENGL);
  Ani.init(this);
  
  // Create the array
  points = new PVector[10];
  // Populate the array with random points
  for (int i=0; i<points.length; i++) {
   PVector pt = new PVector(random(width * 2), random(height * 2), 2 * random(-500, 500));
   points[i] = pt; 
  }
  // Alternatively, populate the array with points you choose
  //points[0] = new PVector(200, 600, 0);
  //points[1] = new PVector(100, 200, 0);
  //points[2] = new PVector(30, 20, 200);
  //...
  //points[9] = new PVector(30, 20, 100);

  PVector eyeOrigin = new PVector(width/2., height/2., (height/2.0) / tan(PI*30.0 / 180.0));
  PVector centerOrigin = new PVector(width/2., height/2., 0);

  eye = new Point(this, eyeOrigin, eyeOrigin);
  center = new Point(this, centerOrigin, centerOrigin);
  
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


// Callback method called by "Point"
public void ended() {
  eye.setTarget(points[index]);
  index = (index+1) % points.length;
}


void mouseClicked() {
}