// PROCESSING - INTRODUCTION

// Processing language reference : http://processing.org/reference

/*

Here is a list of all the language's elements we covered during week 1

https://processing.org/reference/size_.html
https://processing.org/reference/background_.html

https://processing.org/reference/fill_.html
https://processing.org/reference/noFill_.html
https://processing.org/reference/stroke_.html
https://processing.org/reference/noStroke_.html
https://processing.org/reference/strokeWeight_.html

https://processing.org/reference/rect_.html
https://processing.org/reference/rectMode_.html

https://processing.org/reference/point_.html

https://processing.org/reference/line_.html

https://processing.org/reference/ellipse_.html
https://processing.org/reference/ellipseMode_.html

https://processing.org/reference/triangle_.html

https://processing.org/reference/pushStyle_.html
https://processing.org/reference/popStyle_.html

https://processing.org/reference/int.html
https://processing.org/reference/float.html

https://processing.org/reference/width.html
https://processing.org/reference/height.html

https://processing.org/reference/addition.html
https://processing.org/reference/minus.html
https://processing.org/reference/multiply.html
https://processing.org/reference/divide.html

https://processing.org/reference/color_datatype.html

https://processing.org/reference/for.html

https://processing.org/reference/text_.html
https://processing.org/reference/textSize_.html

https://processing.org/reference/loadFont_.html
https://processing.org/reference/createFont_.html
https://processing.org/reference/textFont_.html
https://processing.org/reference/textAlign_.html

https://processing.org/reference/String.html

https://processing.org/reference/random_.html

https://processing.org/reference/if.html
https://processing.org/reference/else.html

https://processing.org/reference/save_.html

*/

  //
  // SIZE
  //

  // Set the size of the window to a width of 800 pixels and a height of 500 pixels
  size(800, 500);


  //
  // BACKGROUND
  //

  // Note : all color information is a range from 0 (no color) to 255 (full color)
  //background(127); // Grayscale
  background(131, 42, 109); // Change the background color with R, G, B (red, green, blue) color
  // background(#832A6D); // Same as above but with hex (hexadecimal) color code


  //
  // DRAWING COLOR MANAGEMENT (stroke, fill, stroke weight) 
  //

  // By default, Processing uses a default stroke (black) and fill (white)

  // Use the explicit fill and stroke color functions to choose the color of your "pen"
  // Can be applied to other methods (stroke, background, etc ...)
  //fill(127); // Grayscale
  //fill(127, 100); // Grayscale and alpha of 100 out of 255 (solid), 0 being transparent
  //fill(127, 100, 127); // RGB color
  //fill(127, 100, 127, 100); // R, G, B, color and Alpha channel
  //noFill(); // The shape won't be filled

  //stroke(127); // Grayscale
  //stroke(127, 100); // Grayscale and alpha of 100 out of 255 (solid), 0 being transparent
  //stroke(127, 100, 127); // RGB color
  //stroke(127, 100, 127, 100); // R, G, B, color and Alpha channel
  //noStroke(); // no stroke will be drawn

  //strokeWeight(5); // Change the stroke's width to 5 pixels

  // In practice
  //fill(0); // Set the fill color to black
  //stroke(255); // Set the stroke color to white
  //strokeWeight(5); // Change the stroke's width to 5 pixels
  //rect(300, 10, 200, 200); // Draw a 200x200 rectangle at position 300x10 (x, y) 

  //
  // RECT
  //

  //rect(10, 10, 200, 200); // Draw a 200x200 pixels rectangle at coordinates 10, 10 (x, y) for the top left corner


  // This is the default reference system to draw a rectangle
  //rectMode(CORNER);
  // When calling rect(a, b, c, d); a and b be will be x and y of the top left corner and c and d the width and height  
  //rect(300, 10, 200, 200); // Draw a 200x200 rectangle at position 300x10 (x, y) 

  // You can explicitly change the reference system to CORNERS
  //rectMode(CORNERS); // Uses top left coordinates and bottom right coordinates
  // When calling rect(a, b, c, d); a and b will be the coords of the top left corner and c and d the coords of the bottom right corner  
  //rect(10, 10, 200, 200);

  //rectMode(CENTER); // Use the center of the rect as coordinate plus width and height
  // When calling rect(a, b, c, d); a and b will be the coords of the center of the rectangle and c and d the width and height of the rectangle  
  //rect(width/2, height/2, width, height);

  //
  // POINT
  //

  //point(100, 30); // Draw a point at coords 100, 30 (x, y)  

  //
  // LINE
  //

  //line(0, 100, 300, 100); // Draw a line between point A (0, 100) and point B (300, 100)


  // ELLIPSE

  // Default ellipse coordinate system ( ellipseMode() ) is CENTER
  //ellipse(100, 200, 50, 100); // Draw an ellipse at coords 100, 200 (center of the ellipse) with a width of 50 and height of 100

  //ellipseMode(CORNER); // Top left corner
  //ellipse(100, 200, 50, 100); // Draw an ellipse. 100,200 are the coordinates of an horizontal line crossing the top of the ellipse and a vertical line crossing the left of the ellipse 

  //ellipseMode(CORNERS); // Top left corner and bottom right
  // Draw an ellipse. 
  // 100,200 are the coordinates of an horizontal line crossing the top of the ellipse and a vertical line crossing the left of the ellipse
  // 50,100 are the coordinates of an horizontal line crossing the bottom of the ellipse and a vertical line crossing the right of the ellipse
  //ellipse(100, 200, 50, 100); 
  
  // 
  // TRIANGLE
  //

  //triangle(10, 10, 200, 10, 145, 100); // Draw a triangle which corners are located at corner 1 : 10,10 corner 2: 200,20 and corner 3 : 145,100


  //
  // RELATIVE POSITIONNING USING PROCESSING BUILT-IN VARIABLES
  //

  // width and height are variables based on the size of the window (which may vary depending if you change values in size(800, 500))
  // you can use width and height to draw a shape at a position relative to the size of the window
  //rect(width/2, height/2, 200, 300); // Draw a 200x300 pixels rectangle whose top left corner is at the middle of the screen
  //rect(0, 0, width/2, height/2); // Draw a half window's width x half window's height rectangle whose top left corner is at the top left corner (0, 0) of the screen


  //
  // PUSHSTYLE POPSTYLE 
  // TEMPORARILY CHANGE THE COLORS AND STYLING PARAMETERS
  //

  //fill(0);
  //pushStyle();
  //fill(255); // Won't affect rect color below
  //ellipse(10, 10, 50, 50)
  //popStyle();
  //rect(100, 100, 50, 25); 


  //
  // VARIABLES
  //

  // A variable is a way to store information of a certain type (number, text, ...)
  // To set a variable, we have to mention its type, choose a name and assign it a value with =

  //int x = 0; // This is an integer (no decimal value) 
  //float f = 0.5; // This is a float (floating point value)
  //float g = .5; // You can omit the 0 before the decimal point

  // You can to operations on values using these operator :
  // + addition
  // - substraction
  // * multiply
  // / divide

  // width and height are two variables handled by Processing and matching the size of the window
  // When you write size(200, 300); width will be equal to 200 and height to 300
  //int x = width/2; // Creates a variable named x and whose values is half of the width of the screen
  //int y = height/2; // Creates a variable named y and whose values is half of the height of the screen


  // It is also possible to set a variable by calling a function nameofthefunction() retuning a value
  // A method is another way to name a function
  // Type of variable / name /  = / nameofthefunction(value)
  // The function color(255) returns a value of type color corresponding to the white color
  //color pink = color(232, 124, 205); // Return a variable of type color and assign it to pink which is of type color 
  //color blue = color(20, 40, 255);
  //color white = color(255);

  // You can then use this variables in your sketch 
  // stroke(white); // Set the stroke to white


  //
  // LOOPS (repeat something without duplicating code)
  //

  // How the for loop works
  // Initialise a variable i of type int with a value of 0
  // As long as i is lower than 15
  // Do what's inside the brackets
  // Add 1 to i
  // Check if stop condition is met
  // If not do what's inside the brackets again, otherwise, exit and continue to the next lines of the sketch
  
  //int x = 0; // Initialise x with 0 as value
  //int y = 0; // Initialise y with as value corresponding to the middle of the screen
  //int spacing = 50; // Initialise spacing with a value of 50
  //for (int i=0; i<15; i++) { // Note i++ is the same as i = i+1 is the same as increment i by 1
  //  ellipse(x, y, 50, 50); // Draw an ellipse at x, y coordinates
  //  x = x + spacing; // Add the value of spacing to x and assign the result to x
  //}

  //
  // TEXT
  //

  //text("Hello", 10, 10); // Write Hello at coordinates 10, 10 (x,y) using the default font and font size

  //textSize(40); // Set the text size to 40 pixels (height)
  //text("Hello", 10, 10);

  //
  // FONTS
  //

  // Load a font from a file you created 
  // To generate the font file, use Tools => Create font and give it a name (or choose the  proposed one)
  // The font will be saved in a variable of type PFont named font
  //PFont font = loadFont("myfont.vlw"); // Load a font named myfont.vlw
  // OR 
  //PFont font = createFont("Georgia", 32); // The font should match the name of a font installed on your system

  //textFont(font); // Set it as the font to be used
  //textSize(40); // Set the font size
  //text("Hello", 10, 10); // Write Hello at coordinates 10, 10 (x,y)

  //
  // TEXT ALIGNMENT
  //

  //textAlign(CENTER); // Horizontal alignment. Other possible values are LEFT OR RIGHT
  //textAlign(CENTER, CENTER); // Horizontal and vertical alignment. Horizontal CENTER, LEFT or RIGHT and Vertical CENTER, TOP or BOTTOM 

  //
  // STRING
  //

  // String is a type to store text
  //String s1 = "Hello"; // Create a variable of type String containing the value Hello
  //String space = " ";
  //String s2 = "World";

  //// You can concatenate text by using + between two String variables
  //String message = s1 + space + s2;


  //
  // RANDOM
  //

  // The random() function returns a value of type float
  //float a = random(100); // Pick a value between 0 and 100
  //float b = random(50, 100); // Pick a value between 50 and 100

  // To force random to return an integer, you have to cast it explicitly to int using (int) 
  //int x = (int) random(width); // Retuns an integer between 0 and the value of width


  //
  // IF STATEMENT
  //

  float a = random(1); // Pick a random value between 0 and 1 and assign it to a
  if (a < 0.5) { // If r is lower than 0.5
    fill(0); // Fill color is black
  } else { // Else
    fill(255); // Fill color is white
  }

  //
  // RANDOM IN PRACTICE
  //

  color pink = color(232, 124, 205); // Define a variable of type color, named pink and assign it a value
  color white = color(255); // Define a variable of type color, named white and assign it a value

  float x; // Define a variable x of type float
  float y; // Define a variable y of type float
  String message = "Hello world"; // Define a variable of type String containing the value Hello world 

  PFont font = createFont("Georgia", 32); // Create a font using the Georgia font
  textFont(font); // Use this font

  for (int i=0; i<100; i++) { // Repeat what's inside the brackets 100 times
    float r = random(1); // Pick a random value between 0 and 1 and assign it to r
    if (r < 0.5) { // If r is lower than 0.5
      fill(pink); // Fill color is pink
    } else { // Else
      fill(white); // Fill color is white
    }
    float size = random(10, 50); // Pick a number between 10 and 50
    textSize(size); // Use it as the size of the text

    x = random(width); // Pick a random value between 0 and width (width of the windo) and assign it to x
    y = random(height); // Pick a random value between 0 and height (height of the window) and assign it to y
    text(message, x, y); // Write the value of message (Hello world) at coordinates x,y
  }

  // 
  // SAVE
  //

  save("screenshot.png"); // Save an image named "screenshot" in the sketch's folder
  
  