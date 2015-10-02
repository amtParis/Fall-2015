TTS tts;

void setup() {
  tts = new TTS();
}

void draw() {
}

void keyPressed() {
  
  // Say voice, text, speed
  
  
  if (keyCode == UP) {
    tts.say("Hello World");
  }
  else if (keyCode == DOWN) {
    tts.sayUsingLanguage("Hello World", "en");
  }
  else if (("abcdefghijklmnopqrstuvwxyz"). indexOf(""+key) > -1) {
    tts.sayRandomVoice("Hello world");
  }
}