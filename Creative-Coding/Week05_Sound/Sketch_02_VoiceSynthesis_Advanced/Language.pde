class Language {

  String language;
  ArrayList<String> voices = new ArrayList<String>();

  Language(String language) {
    this.language = language;
  }

  void add(String text) {
    voices.add(text);
  }

  String getRandomVoice() {
    if (voices.size() > 0) {
      return voices.get((int) random(voices.size()));
    }
    return null;
  }
}