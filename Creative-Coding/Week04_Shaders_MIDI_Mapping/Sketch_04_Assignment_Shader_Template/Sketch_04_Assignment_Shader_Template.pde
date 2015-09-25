// 
// Modify the shader files provided and add new parameters and calculations
// Update the parameters from Processing (in the draw function)
//

PShader shader1;
boolean use1;

PShader shader2;
boolean use2;

PShader shader3;
boolean use3;


PImage img;

void setup() {
  size(640, 360, P2D);
  shader1 = loadShader("shader1.glsl");
  shader2 = loadShader("shader1.glsl");
  shader3 = loadShader("shader1.glsl");
  
  img = loadImage("LOLCat.jpg");
}


void draw() {
  image(img, 0, 0, width, height);

  // Update the parameters of your custom shaders by setting the 
  // corresponding parameters name and pass it a value
  // shader1.set("parameter_name", value);
  // shader2.set("parameter_name", value);
  // shader3.set("parameter_name", value);

  if (use1) {
    filter(shader1);
  }
  if (use2) {
    filter(shader2);
  }
  if (use3) {
    filter(shader3);
  }

}


void keyPressed() {
  
  // Use keys 1 2 and 3 to toggle between filters
  if (key == '1') {
    use1 = !use1;
  }
  if (key == '2') {
    use2 = !use2;
  }
  if (key == '3') {
    use3 = !use3;
  }
}