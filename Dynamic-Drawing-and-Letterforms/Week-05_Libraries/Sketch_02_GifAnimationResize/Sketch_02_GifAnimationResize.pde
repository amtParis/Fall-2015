/*

 This sketch is Using the modified library GifAnimation
 http://github.com/01010101/GifAnimation
 
 Download and unizp the library (Download zip)
 Rename it to GifAnimation
 Copy the folder to your sketchbook/libraries folder
 
 */

import gifAnimation.*;

ArrayList<MoveableGif> gifs = new ArrayList<MoveableGif>();  

boolean editMode = true;
int selected = -1;

public void setup() {
  size(400, 400);
  cursor(CROSS);

  imageMode(CENTER);
  rectMode(CENTER);
  
  surface.setResizable(true);
}

void draw() {
  background(255);
  // Loop through the gif array and draw them
  for (int i=0; i<gifs.size(); i++) {
    // We pass "true" or "false" when the gif is the one currently selected
    // so it knows it should highlight itself
    gifs.get(i).draw(selected > -1 && selected == i);
  }
}

void keyPressed() {
  // Press o to select a file
  if (key == 'o') {
    selectInput("Select a GIF process:", "fileSelected");
  }
  // Press m to toggle view of the currently selected picture 
  else if (key == 'm') {
    editMode = !editMode; // Invert editMode flag (from true to false or from false to true)
    if (!editMode) {
      selected = -1; // If no editMode, then set selected to -1
    } else {
      selected = gifs.size() -1; // If editMode, then set selected to the last index
    }
  } else if (keyCode == LEFT) {
    if (gifs.size() > 0 && selected >= 0) {
      selected--;
      if (selected < 0) { 
        // If we are below the first element of the array (index -1)
        // then editMode to the last element of the array 
        selected = gifs.size()-1;
      }
    }
  } else if (keyCode == RIGHT) {
    if (gifs.size() > 0 && selected >= 0) {
      selected++;
        println("step2");
      if (selected >= gifs.size()) { 
        // If we reached then last element of the array
        // then editMode to the first one (index 0)
        println("step2");
        selected = 0;
      }
    }
  } 
  // ReeditMode the currently selected gif and  
  else if (key == 'x') {
    if (editMode) {
      println("Removing GIF");
      gifs.remove(selected);
      selected--;
      if (gifs.size() > 0 && selected < 0) {
        selected = gifs.size()-1;
      }
    }
  }
  else if (key == 'c') {
    selected = -1;
    gifs.clear();
  }
  // Scale current gif up or down
  else if (keyCode == UP) {
    if (gifs.size() > 0 && selected > -1) {
      gifs.get(selected).scale(1.1);
    }
  }
  else if (keyCode == DOWN) {
    if (gifs.size() > 0 && selected > -1) {
      gifs.get(selected).scale(0.9);
    }
  }
}

void mouseDragged() {
  // If a gif is currently selected ( > -1), then move it
  // Move is based on the difference between he previous (pmouse) and current mouse position  
  if (gifs.size() > 0 && selected > -1) {
    gifs.get(selected).shift(mouseX - pmouseX, mouseY - pmouseY);
  }
}

// Callback function called once we pick a new file
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    // Try to create a file from it
    MoveableGif gif = new MoveableGif(this, selection.getPath(), mouseX, mouseY);
    // Start looping
    gif.loop();
    // Set position
    // Add it to the list
    gifs.add(gif);
    // editMode the selected pointer to the last added gif so it can be positionned
    selected = gifs.size() -1;
  }
}