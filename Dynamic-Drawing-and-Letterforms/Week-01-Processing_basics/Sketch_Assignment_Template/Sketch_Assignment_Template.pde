//
// ASSIGNMENT FOR FRIDAY
// 

// Apply modifications to the sketch below, using the drawing methods you learnt last Friday
// Run it 9 times and try to have quite different results (play with random and if statements)
// Take screenshots of the results

size(800, 600);

float bR = random(255);
float bG = random(255);
float bB = random(255);

// Set a random background color
background(bR, bG, bB);

// Number of times to repeat the loop
// Option A
int nTimes = 40; 
// Option B
//int nTimes = random(10, 40); // Pick a number between 10 and 40

// Repeat this nTimes times
for (int i=0; i<nTimes; i++) {
  float fR = random(255); // Random value for Red
  float fG = random(255); // Random value for Green
  float fB = random(255); // Random value for Blue
  color fillColor = color(fR, fG, fB); // Define a random color named fillColor

  float sR = random(255);
  float sG = random(255);
  float sB = random(255);
  color strokeColor = color(sR, sG, sB); // Define a random color named strokeColor

  float x = random(width); // random x coordinate
  float y = random(height); // random y coordinate
  float size = random(10, 100); // random size

  // Draw something using these colors, position and size
  // Here you can change drawing methods to draw using different types of shapes, ...
  fill(fillColor);
  noStroke();
  ellipse(x, y, size, size);

  // if statement
  float drawSomethingElse = random(2); // Pick a random number between 0 and 2
  if (drawSomethingElse < 1) { // Draw another ellipse if drawSomethingElse is lower than 1
    // Here you can change drawing methods as well 
    fill(0);
    ellipse(x, y, size/2, size/2);
  }
}

save("screenshot.png");