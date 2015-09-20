ArrayList<PImage> images = new ArrayList<PImage>();

PVector pos = new PVector();
PVector direction = new PVector();

int imgW;
int imgH;

void setup() {
  size(640, 360);
  frameRate(24);
  
  imageMode(CENTER);

  for (int i=0; i<12; i++) {
    PImage img = loadImage("PT_anim" + nf(i, 4) + ".gif");
    images.add(img);
  }
  
  imgW = images.get(0).width;
  imgH = images.get(0).height;
  
   pos.set(width/2, height-imgH/2);
   direction.set(random(5,10), random(5, 10));
} 

void draw() { 
  background(0);
  image(images.get(frameCount % images.size()), pos.x, pos.y);
  
  // Check if the next move will take the image outside of the screen
  // Check horizontaly and verticaly
  // If so, invert the direction on the given axis
  if (pos.x + direction.x + imgW/2 > width || pos.x + direction.x - imgW/2 < 0) {
    direction.x *= -1;    
  }
  if (pos.y + direction.y + imgH/2 > height || pos.y + direction.y - imgH/2 < 0) {
    direction.y *= -1;    
  }

  pos.add(direction);
}