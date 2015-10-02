class TTS {

  HashMap<String, Language> languages = new HashMap<String, Language>(); 

  int defaultRate = 150;

  TTS() {
    String[] voices = loadStrings("voices.txt");
    println("Loaded "+voices.length+" voices");

    for (int i=0; i<voices.length; i++) {
      String lang = getLanguage(voices[i]);
      String voice = getVoice(voices[i]);

      if (!languages.containsKey(lang)) {
        Language language = new Language(lang);
        languages.put(lang, language);
      }
      languages.get(lang).add(voice);
    }
  }

  // Returns the main language from a String (ie: returns "en" from "Maria;en_UK")
  String getLanguage(String s) {
    String[] splitted = s.split(";");
    String[] info = splitted[1].split("_");
    return info[0];
  }

  // Returns the voice name from a String (ie: returns "Maria" from "Maria;en_UK")
  String getVoice(String s) {
    String[] splitted = s.split(";");
    return splitted[0];
  }

  // Get a random language from a the exisiting languages
  // Returns null if no language found
  String getRandomLanguage() {
    if (languages.size() > 0) {
      int languageRandomIndex = (int) random(languages.keySet().size());
      String language = (String) languages.keySet().toArray()[languageRandomIndex];
      return language;
    }
    return null;
  }

  // Get a random voice from a the exisiting languages
  // Returns null if no language/voice found
  String getRandomLanguageAndVoice() {
    String lang = getRandomLanguage(); 
    if (null != lang) {
      String voice = languages.get(lang).getRandomVoice();
      if (null != voice) {
        return voice;
      }
    }
    return null;
  }

  // Get a random voice from a specific language
  String getRandomVoice(String lang) {
    if (languages.containsKey(lang)) {
      String voice = languages.get(lang).getRandomVoice();
      if (null != voice) {
        return voice;
      }
    }
    return null;
  }

  // Say something
  void say(String text) {
    sayIt("Albert", text, defaultRate);
  }

  // Say using totally random voice
  void sayRandomVoice(String text) {
    sayIt(getRandomLanguageAndVoice(), text, defaultRate);
  }
  
  // Say something
  void sayUsingLanguage(String text, String lang) {
    String voice = languages.get(lang).getRandomVoice();
    if (null != voice) {
      sayIt(voice, text, defaultRate);
    }
  }

  // Say something
  void say(String voice, String text, int rate) {
    if (null != voice && rate > 1) {
      sayIt(voice, text, rate);
    }
  }
  
  private void sayIt(String voice, String text, int rate) {
    try {
      Process tr = Runtime.getRuntime().exec( new String[]{ "say", "-v", voice, "-r", ""+rate, text } );
    }
    catch (IOException e) {
      println(e);
    }
  }
}