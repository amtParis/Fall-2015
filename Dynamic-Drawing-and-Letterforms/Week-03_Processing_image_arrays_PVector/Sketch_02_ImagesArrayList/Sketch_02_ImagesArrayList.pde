ArrayList<PImage> images = new ArrayList<PImage>();

// Add an element
// images[i] = loadImage("PT_anim" + nf(i, 4) + ".gif");
// becomes
// images.add(loadImage("PT_anim" + nf(i, 4) + ".gif"))

// Array size
// images.length
// becomes
// images.size()

// Get an element
// images[i]
// becomes
// images.get(i)


void setup() {
  size(640, 360);
  frameRate(24);
  
  imageMode(CENTER);

  for (int i=0; i<12; i++) {
    PImage img = loadImage("PT_anim" + nf(i, 4) + ".gif");
    images.add(img);
  }
} 

void draw() { 
  background(0);
  image(images.get(frameCount % images.size()), mouseX, mouseY);
}