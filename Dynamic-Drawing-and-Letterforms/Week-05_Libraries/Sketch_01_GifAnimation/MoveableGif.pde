/*

 This class extends the possibilities of the Gif object
 it allows to customize it
 
 */


class MoveableGif extends Gif {

  int x;
  int y;

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

  void draw() {
    // We draw the image using "this" since 
    // MoveableGif extends Gif who himself extends PImage
    image(this, x, y);
  }

  void shift(int xShift, int yShift) {
    x += xShift; // Same as x = x + xShift
    y += yShift;
  }
}