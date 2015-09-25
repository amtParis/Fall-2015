void setup() {
  size(300, 300);
}

void draw() {

  for (int x = 0; x < width; x++) {
    stroke(random(255), random(255), random(255));
    line(x, 0, x, height);
  }
}