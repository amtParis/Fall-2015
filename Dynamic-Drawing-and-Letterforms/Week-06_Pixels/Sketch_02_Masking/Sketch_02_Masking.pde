PImage sourceImg;
PImage maskedImg;
PImage imgMask;

boolean masked = true;

void setup() {
  size(640, 360, OPENGL);

  sourceImg = loadImage("moonwalk.jpg");

  maskedImg = loadImage("moonwalk.jpg");
  imgMask = loadImage("mask.jpg");
  maskedImg.mask(imgMask);
  imageMode(CENTER);
}

void draw() {
  background(0, 0, 0);
  if (masked) {
    image(maskedImg, width/2, height/2);
  }
  else {
    image(sourceImg, width/2, height/2);
  }
}

void keyPressed() {
  masked = !masked;
}

