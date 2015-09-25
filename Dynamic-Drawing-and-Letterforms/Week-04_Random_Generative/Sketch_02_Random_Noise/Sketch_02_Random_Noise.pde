void setup() {
  size(300, 300);
}

void draw() {

  randomSeed(0);
  for (int x = 0; x < width; x++) {
    stroke(random(255), random(255), random(255));
    line(x, 0, x, 100);
  }

  randomSeed(0);
  for (int x = 0; x < width; x++) {
    stroke(randomGaussian() * 255., randomGaussian() * 255., randomGaussian() * 255.);
    line(x, 100, x, 200);
  }

  noiseSeed(0);
  for (int x = 0; x < width; x++) {
    float noiseScale = map(mouseX, 0, width, 0, 1);
    noiseDetail(3, 0.5);
    float r = noise((x + 10) * noiseScale);
    float g = noise((x + 200) * noiseScale);
    float b = noise((x + 255)  * noiseScale);
    stroke(r*255, g*255, b*255);
    line(x, 200, x, 300);
  }
}