import gifAnimation.*;

GifMaker gifExport;
boolean export;

public void setup() {
  size(200, 200, OPENGL);
  frameRate(12);
  println("gifAnimation " + Gif.version());
}

void draw() {
  background(0);
  
  // Draw or display something here 
  // Put your code here
  
  // Then export the frame if we're recording
  if (export) {
    gifExport.setDelay(1);
    gifExport.addFrame();
  }
}

void keyPressed() {
  if (key == 'z') {
    export = true;
    gifExport = new GifMaker(this, "export_"+frameCount+".gif");
    gifExport.setRepeat(0); // make it an "endless" animation
    // To use all the colors, comment the line below
    gifExport.setTransparent(0, 0, 0); // make black the transparent color. every black pixel in the animation will be transparent
    println("gif export started");
  }
  if (key == ' ') {
    export = false;
    gifExport.finish();
    println("gif saved");
  }
}