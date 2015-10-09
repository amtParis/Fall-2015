// Coded initially in 2004 Benjamin Gaulon corrupt.recyclism.com // more info on www.recyclism.com //
// Feel free to use / modify / Share this //

// Glitched images can be viewed using Ted Davis' jpeg viewer
// https://github.com/ffd8/jpg_viewer/releases

PImage img;
String fileName = "Test"; // You file name here (should be in the DATA Folder)
String fileExt = ".jpg"; // file extansion (works best with JPG or PNG)

void setup() {
  
  size(950, 150);

  // Load the file as a binary file
  byte b[] = loadBytes(fileName + fileExt);

  // change 30 to any value to generate more images
  for (int j = 0; j < 30; j ++) {

    // Make a copy of the binary file
    byte bCopy[] = new byte[b.length];
    arrayCopy(b, bCopy);
    
    // scramble start excludes 10 bytes///
    int scrambleStart = 10;

    // scramble end ///
    int scrambleEnd = b.length;

    // Number of Replacements - Go easy with this as too much will just kill the file ///
    int nbOfReplacements = int (random(1, 10));

    // Swap bits ///
    for (int i = 0; i < nbOfReplacements; i++) {
      int randomByte1 = int(random (scrambleStart, scrambleEnd));
      int randomByte2 = int(random (scrambleStart, scrambleEnd));

      // Invert two bytes using a temporary variable (byte)
      byte tmpByte = bCopy[randomByte1];
      bCopy[randomByte1] = bCopy[randomByte2];
      bCopy[randomByte2] = tmpByte;
    }

    // Save the file  in "corrupted" folder ///
    saveBytes("./results/"+fileName + Integer.toString(j) + fileExt, bCopy);
  }
  
  
}

void draw() {
  background(0);
  text("DONE", width/2, height/2);
  delay(5000);
  exit();
  
}