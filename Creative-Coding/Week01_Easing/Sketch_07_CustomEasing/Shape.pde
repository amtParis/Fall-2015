class Shape {

  Point[] pts;

  Shape(int nPoints) {
    pts = new Point[nPoints];
    for (int i=0; i<pts.length; i++) {
      pts[i] = new Point(new PVector(width/2, height/2, 0), new PVector(random(width), random(height), 0));
    }
  }


  void draw() {

    pushStyle();
    noFill();
    stroke(255, 10);
    beginShape();
    curveVertex(pts[pts.length-1].pos.x, pts[pts.length-1].pos.y);
    for (int i=0; i<pts.length; i++) {
      curveVertex(pts[i].pos.x, pts[i].pos.y);
    }  
    curveVertex(pts[0].pos.x, pts[0].pos.y);
    curveVertex(pts[1].pos.x, pts[1].pos.y);
    endShape();
    popStyle();
  }


  void setRandomPoints() {
    setRandomPoints(new PVector(0, 0, 0), new PVector(width, height, 0));
  }

  void setRandomPoints(PVector min, PVector max) {
    for (int i=0; i<pts.length; i++) {
      pts[i].setTarget(new PVector(random(min.x, max.x), random(min.y, max.y), random(min.z, max.z)));
    }
  }
}