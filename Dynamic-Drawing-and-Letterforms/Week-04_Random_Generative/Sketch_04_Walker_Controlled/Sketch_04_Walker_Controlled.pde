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

  // Since it's no more a 1/4 split, there are more
  // chances that we pick a value between 0 and 0.4
  // than the other 0.2 steps

  if (r < 0.4) {
    x++;
  } else if (r < 0.6) {
    x--;
  } else if (r < 0.8) {
    y++;
  } else { 
    y--;
  }
}