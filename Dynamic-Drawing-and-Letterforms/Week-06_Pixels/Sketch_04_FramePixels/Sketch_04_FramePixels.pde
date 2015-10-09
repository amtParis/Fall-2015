PImage img;

void setup() {
  size(640, 360);

  img = loadImage("moonwalk.jpg");

}

void draw() {
  background(0, 0, 0);
  image(img, 0, 0);

  // Access the pixels of the frame
  loadPixels();
  for (int i=0; i < pixels.length; i++) {
      color c = pixels[i];
      pixels[i] = color(red(c), 0, 0);      
  }
  updatePixels();
}

