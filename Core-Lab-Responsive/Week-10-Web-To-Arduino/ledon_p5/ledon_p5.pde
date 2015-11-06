import processing.serial.*;
Serial port;

void setup() {
  println("Available serial ports:");
  println(Serial.list());
  
  // Remember to change your port:
  port = new Serial(this, Serial.list()[11], 9600);  // Open the port that the Arduino board is connected to, at 9600 baud
}

void draw() {
  String [] data = loadStrings("http://amt.dtparis.com/responsive/chris/led/led.txt"); // Insert the location of your .txt file
  //String [] data = loadStrings("http://localhost:8888/responsive/no_turnonlight/led.txt"); // Insert the location of your .txt file

  if (data.length > 0) {
    int ndata = parseInt(data[0]);
    if (ndata == 1 ){ port.write('H'); } //write our marker
    else{ port.write('L'); }
    println(ndata);
  }
}

