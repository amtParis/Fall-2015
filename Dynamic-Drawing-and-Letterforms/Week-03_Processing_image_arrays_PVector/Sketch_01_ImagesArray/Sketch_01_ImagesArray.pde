PImage[] images = new PImage[12];

void setup() {
  size(640, 360);
  frameRate(24);
  
  imageMode(CENTER);

  for (int i = 0; i < images.length; i++) {
   images[i] = loadImage("PT_anim" + nf(i, 4) + ".gif");
  }
} 

void draw() { 
  background(0);
  image(images[frameCount % images.length], mouseX, mouseY);
}