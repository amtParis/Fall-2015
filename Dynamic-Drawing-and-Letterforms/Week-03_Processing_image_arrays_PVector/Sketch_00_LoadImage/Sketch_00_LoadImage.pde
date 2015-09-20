PImage img;

void setup() {
  size(640, 360);
  img = loadImage("logo.png");
} 

void draw() { 
  background(0);

  //noTint();
  //imageMode(CORNERS);
  //image(img, 0, 0, width/2, height/2);

  //tint(255, 20, 127);
  //imageMode(CORNER);
  //image(img, width/2, 0, width/2, height/2);

  //tint(55, 100, 200);
  //imageMode(CENTER);
  //image(img, width/4, height*3/4, width/2, height/2);

  //tint(20, 210, 127);
  //image(img, mouseX, mouseY, width/2, height/2);
  //filter(BLUR, 5);
  
  //copy(img, 0, 0, img.width, img.height/2, 0, 0, width/2, height/2);
}