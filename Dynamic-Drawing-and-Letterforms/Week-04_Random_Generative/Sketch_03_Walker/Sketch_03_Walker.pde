// From Daniel Shiffman / The Nature of Code

int x;
int y;

void setup() {
  size(600, 600);
  background(255);
  x = width/2;
  y = height/2;
}

void draw() {
  point(x, y);
  step();
}

void step() {
  float r = random(1);

  if (r < 0.25) {
    x++;
  } else if (r < 0.5) {
    x--;
  } else if (r < 0.75) {
    y++;
  } else { 
    y--;
  }
}