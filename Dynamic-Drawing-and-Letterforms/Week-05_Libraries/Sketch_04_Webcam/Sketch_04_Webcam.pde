/*

  Uses the video library from Processing
  You shall add it through 
  Sketch > Import Library > Add Library
  Then search for Video

 */

import processing.video.*;

Capture cam;

void setup() {
  size(640, 480);
  imageMode(CENTER);

  // List the cameras
  String[] cameras = Capture.list();

  // If no camera was returned, print a message
  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    cam = new Capture(this, 640, 480);
    
  } if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  }
  // Else print a list of available cameras
  else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }

    // The camera can be initialized directly using an element
    // from the array returned by list():
    cam = new Capture(this, cameras[0]);
    
    // Or, the settings can be defined based on the text in the list
    //cam = new Capture(this, 640, 480, "Built-in iSight", 30);
    
    // Start capturing the images from the camera
    cam.start();
  }
}


void draw() {
  // If a new image is available
  if (cam.available()) {
    cam.read(); // Update the image held by the camera
  }

  // Mirror the camera
  scale(-1, 1);
  translate(-width, 0);
  
  // Draw it
  image(cam, width/2, height/2);
  // The following does the same as the above image() line, but 
  // is faster when just drawing the image without any additional 
  // resizing, transformations, or tint.
  //set(width/2, height/2, cam);
}