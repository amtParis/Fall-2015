class MoveableGif extends Gif {

  int x;
  int y;

  float scale = 1;

  MoveableGif(PApplet parent, String filename) {
    // We call the constructor of the Gif object (super is for the Gif object)
    super(parent, filename);
    // We set our custom variables
    x = width/2;
    y = height/2;
  }

  MoveableGif(PApplet parent, String filename, int x, int y) {
    // We call the constructor of the Gif object (super is for the Gif object)
    super(parent, filename);
    // We set our custom variables
    this.x = x;
    this.y = y;
  }

  void draw(boolean selected) {
    // We call the constructor of the Gif object (super is for the Gif object)
    // We scale the image using the 4th and 5th parameters.
    // We get the original gif image size using once again super
    image(this, x, y, super.width * scale, super.height * scale);
    if (selected) {
      pushStyle(); // Beginning of temporary style change
      fill(255, 0, 0, 100);
      noStroke();
      rect(x, y, super.width * scale, super.height * scale);
      popStyle(); // // End of temporary style change
    }
  }

  void shift(int xShift, int yShift) {
    x += xShift; // Same as x = x + xShift
    y += yShift;
  }

  // Scale up or down
  void scale(float coef) {
    scale *= coef;
  }
}