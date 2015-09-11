void drawDevices(ArrayList<String> items, int index, int x, int y) {
  pushStyle();

  fill(0, 150);
  rect(0, y, width, height-y);

  pushMatrix();
  translate(x, y+20);
  
  
  fill(255);
  textAlign(CENTER, CENTER);
  text(items.get(index), 0, 0);
  
  int size = 10;
  int spacing = 5;
  int w = size*items.size() + spacing * items.size()-1;
  for (int i=0; i<items.size(); i++) {
    stroke(255);
    if (index == i) {
       fill(255); 
    }
    else {
       noFill(); 
    }
    ellipse(-w/2+i*(size+ (i>0 ? spacing : 0)), 30, size, size);
  }
  popMatrix();
  popStyle();
}