PImage img;

void setup() {
  size(640, 360);

  img = loadImage("moonwalk.jpg");

  for (int x=0; x < img.width; x++) {
    for (int y=0; y < img.height; y++) {
      color c = img.get(x, y);
      // Invert color layers
      img.set(x, y, color(blue(c), red(c), green(c)));      
    }
  }

}

void draw() {
  background(0, 0, 0);
  image(img, 0, 0);

}

