// The variable to keep track of the size of the shape
int size = 100;

// The variable to keep track of the current tool
// 0 for ellipse
// 1 rectangle
int tool = 0;

// The variable to keep track of the current color used to draw
color currentColor = color(126, 23, 78);

// The variable to keep track if we shall fill (or not) the shape drawn
boolean filled = true;


void setup() {
  size(400, 400);
  background(255);

  // Default to no stroke
  noStroke();
  rectMode(CENTER);
}

void draw() {
  
}

// When the mouse is dragged, draw using the current tool values
void mouseDragged() {
  useTool(); // Call the useTool() method/function
}

void useTool() {
  
  // The alpha (opacity is realtive to the position of the mouse on the screen)
  // We limit it to a value between 10 and 40
  int alpha = (int) map(mouseX*mouseY, 0, width * height, 10, 40);
  
  // If filled is true, then we set the fill color and alpha value and set no stroke
  if (filled) {
    fill(currentColor, alpha);
    noStroke();      
  }
  // Else we set no fill and set the stroke's color and alpha value
  else {
    noFill();
    stroke(currentColor, alpha);
  }

  // Then we draw using the selected tool
  if (tool == 0) {
    ellipse(mouseX, mouseY, size, size);
  } else if (tool == 1) {
    rect(mouseX, mouseY, size, size);
  }
}


void keyReleased() {
  
  //
  // Hints :
  // You can add more tools and colors
  // You can add a "clear all" function (which will call the "background(255);" function)
  // You can add a "save" function (which will call the "saveFrame();" function)
  // You can use the up/down keys to change the size of the shape (see )
  //
  //
  
  // Tools management
  if (key == 'r') {
    println("r was typed");
    tool = 1; // Set tool to be a rectangle
  } else if (key == 'c') {
    println("c was typed");
    tool = 0; // Set tool to be a circle
  }
  
  // Color management
  else if (key == '1') {
    currentColor = color(127, 64, 240);
  } else if (key == '2') {
    currentColor = color(0, 34, 215);
  } else if (key == '3') {
    currentColor = color(187, 200, 10);
  }
  
  // Pressing the space bar toggles between filled and not filled 
  else if (key == ' ') {
    // Invert the value of the "filled" boolean variable (true or false) 
    // If true, it becomes false
    // If false, it becomes true
    filled = !filled; 
  }

}