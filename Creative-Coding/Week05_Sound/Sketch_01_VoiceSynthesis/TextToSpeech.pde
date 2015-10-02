class TextToSpeech {

  String[] voices;

  TextToSpeech() {
    voices = loadStrings("voices.txt");
    println("Loaded "+voices.length+" voices");
  }

  void say(String text) {
    String voice = (voices[(int) random(voices.length)].split(";"))[0];
    println(voice);
    try {
      Process tr = Runtime.getRuntime().exec( new String[]{ "say", "-v", voice, text } );
    }
    catch (IOException e) {
      println(e);
    }
  }
}