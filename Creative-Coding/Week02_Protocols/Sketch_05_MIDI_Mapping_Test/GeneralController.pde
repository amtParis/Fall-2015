public class GeneralController {

  PApplet p;


  int displayDuration = 5000;


  String lastNote = "";

  
  String lastCC = "";
  String lastProgChange = "";

  int lastCCTime;
  int lastProgChangeTime;

  int totalMsg = 0;

  int bufferInterval = 50;
  int lastNoteTime;

  int prevV;

  GeneralController(PApplet p) {
    this.p = p;

    lastNoteTime = millis();
  }


  void draw() {
    text(lastNote, 60, 40);
    
    text(lastCC, 60, 80);
    if (millis()-lastCCTime > displayDuration) {
     lastCC = ""; 
    }
    
    text(lastProgChange, 60, 120);
    if (millis()-lastProgChangeTime > displayDuration) {
     lastProgChange = ""; 
    }

  }


  void note(int type, int pitch, int velocity) {
    String s = nf(frameCount, 5)+" / "+(type == 1 ? "Note ON" : "Note OFF")+ ":  pitch [" + nf(pitch, 3) + "] velocity [ "+nf(velocity, 3) + "]";
    if (type == 1) {
      lastNote = s;
    }
    else {
     lastNote = ""; 
    }
  }

  void controller(int cc, int value) {
    String s = nf(frameCount, 5)+" / "+"CC ["+cc+"]  value ["+value+"]";

    lastCC = "Control Change ["+cc+"]  value ["+value+"]";
    lastCCTime = millis();
    totalMsg++;
    
  } 

  void program(int number) {
    String s = nf(frameCount, 5)+" / ProgChange ["+nf(number, 3)+"]";

    lastProgChange = "Program change number: ["+nf(number, 3)+"]";
    lastProgChangeTime = millis();
    totalMsg++;
  }

  void sysex(rwmidi.SysexMessage msg) {
    // TODO parse message
    String s = nf(frameCount, 5)+" / Sysex [TODO]";
  }
}