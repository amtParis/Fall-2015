TextToSpeech tts;

void setup() {
  tts = new TextToSpeech();
}

void draw() {
}

void keyPressed() {
  tts.say("Hello World");
}