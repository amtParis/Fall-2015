/*

 This sketch is Using the modified library GifAnimation
 http://github.com/01010101/GifAnimation
 
 Download and unizp the library (Download zip)
 Rename it to GifAnimation
 Copy the folder to your sketchbook/libraries folder
 
 */

// Use the GifAnimation library
import gifAnimation.*;

// Array to store the loaded gigs
ArrayList<MoveableGif> gifs = new ArrayList<MoveableGif>();


void setup() {
  size(400, 400);
  cursor(CROSS);

  imageMode(CENTER);

  // Load first gif
  MoveableGif gif = new MoveableGif(this, "lebowski1.gif");
  gif.play();  // Start looping
  gifs.add(gif); // Add it to the gifs array

  // Allow to resize the window
  surface.setResizable(true);
}


void draw() {
  background(255);
  // Loop throught the array and draw the images
  for (int i=0; i<gifs.size(); i++) {
    gifs.get(i).draw(); // We use the MoveableGif draw method
  }
}

// Method invoked when the user selects a file or cancels
void fileSelected(File selection) {
  if (null != selection) { // null if user canceled the file selection
    MoveableGif gif = new MoveableGif(this, selection.getPath(), (int) random(width), (int) random(height));
    gif.loop();
    gifs.add(gif);
  }
}


void keyPressed() {
  // Press o to import a new file
  if (key == 'o') {
    selectInput("Select a GIF process:", "fileSelected");
  }
  // Press x to remove elements
  else if (key == 'x') {
    if (gifs.size() > 0) { // If at least one element, then remove the last one
      gifs.remove(gifs.size()-1);
    }
  }
  // Press c to clear all elements
  else if (key == 'c') {
    gifs.clear();
  }
}


// When mouse if dragges, position the last element
void mouseDragged() {
  // Move last element 
  if (gifs.size() > 0) { // If at least one element in the array
    // Shift the last element by the mouse move since last call (pmouseX means last mouseX position)
    gifs.get(gifs.size()-1).shift(mouseX - pmouseX, mouseY - pmouseY);
  }
}