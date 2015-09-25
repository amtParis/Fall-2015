class Pt {

  // Variables
  int x;
  int y;

  // Constructor(s)
  // called when doing Pt pt = new Pt();
  Pt() {
    x = 0;
    y = 0;
  }

  // Other constructor with parameters
  // called when doing Pt pt = new Pt(10, 20);
  Pt(int x, int y) {
    this.x = x;
    this.y = y;
  }

  // Method(s)
  
  void draw() {
     point(x, y); 
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
}