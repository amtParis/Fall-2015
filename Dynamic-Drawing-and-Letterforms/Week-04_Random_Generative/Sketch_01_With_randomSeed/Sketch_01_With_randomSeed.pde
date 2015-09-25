void setup() {
  size(300, 300);
}

void draw() {

  // Every loop will use the same random numbers
  randomSeed(0);

  for (int x = 0; x < width; x++) {
    stroke(random(255), random(255), random(255));
    line(x, 0, x, height);
  }
}