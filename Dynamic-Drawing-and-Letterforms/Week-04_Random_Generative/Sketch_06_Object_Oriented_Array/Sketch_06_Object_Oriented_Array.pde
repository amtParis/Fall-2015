ArrayList<Pt> points = new ArrayList<Pt>();

void setup() {
  size(600, 600);
  background(255);
  
  for (int i=0; i<20; i++) {
    Pt point = new Pt((int) random(width), (int) random(height)); 
    points.add(point);
  }
}

void draw() {

    for (int i=0; i<points.size(); i++) {
       points.get(i).draw();
       points.get(i).step(); 
      
      // Same as below where we use a temporary Pt object instead
      // Pt currentPoint = points.get(i);
      // pt.draw();
      // pt.step();
    }


}