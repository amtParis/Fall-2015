PVector pos = new PVector();
PVector speed = new PVector();

PVector[] balls = new PVector[5];

void setup() {
  size(600, 600);
  frameRate(24);
  
  for (int i=0; i<5; i++) {
   balls[i] = new PVector(width/2, height/2); 
  }
  
  pos.set(width/2, height/2);
  fill(255, 20);
  noStroke();
  background(0);
} 

void draw() { 
  //ellipse(pos.x, pos.y, 20, 20);
  for (int i=0; i<5; i++) {
    ellipse(balls[i].x, balls[i].y, 20, 20);
  }
  if (pos.x + 10 / 2> width || pos.x - 10 / 2 < 0) {
    speed.x *= -1;
  }
  if (pos.y + 10 / 2> height || pos.y - 10 / 2 < 0) {
    speed.y *= -1;
  }
  speed.mult(0.99);
  pos.add(speed);

  for (int i=0; i<5; i++) {
    balls[i].lerp(pos, 0.01 * (i+1));
  }
}

void mouseClicked() {
   speed.set(random(5, 10), random(5, 10)); 
}