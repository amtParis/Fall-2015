int numFrames = 12;  // The number of frames in the animation
int currentFrame = 0;

ArrayList<PImage> images = new ArrayList<PImage>();

PVector pos = new PVector();
PVector speed = new PVector();

float friction = .01;

int imgW;
int imgH;

void setup() {
  size(640, 360);
  frameRate(24);
  
  imageMode(CENTER);

  for (int i=0; i<numFrames; i++) {
    PImage img = loadImage("PT_anim" + nf(i, 4) + ".gif");
    images.add(img);
  }
  
  imgW = images.get(0).width;
  imgH = images.get(0).height;
  
   pos.set(width/2, height-imgH/2);
   speed.set(random(5,10), random(5, 10));
} 

void draw() { 
  background(0);
  currentFrame = ++currentFrame % images.size();  // Use % to cycle through frames
  image(images.get(currentFrame), pos.x, pos.y);
  
  // Check if the next move will take the image outside of the screen
  // Check horizontaly and verticaly
  // If so, invert the direction on the given axis
  if (pos.x + speed.x + imgW/2 > width || pos.x + speed.x - imgW/2 < 0) {
    speed.x *= -1;    
  }
  if (pos.y + speed.y + imgH/2 > height || pos.y + speed.y - imgH/2 < 0) {
    speed.y *= -1;    
  }

  pos.add(speed);
  speed.mult(1 - friction);
}

void mouseClicked() {
  speed.set(random(5,10), random(5, 10));
}