public class Point {

  PVector pos;
  
  boolean ended;
  PApplet parent;

  Point(PApplet p, PVector p0, PVector p1) {
    this.parent = p;
    pos = p0;
    setTarget(p1);
  }


  public void setTarget(PVector p) {
    // Once easing is finished, the "ended" method of the parent (= PApplet =first tab of this sketch) will be called
    Ani.to(pos, 1.0f, "x", p.x, Ani.CUBIC_IN_OUT, parent, "onEnd:ended");
    Ani.to(pos, 1.0f, "y", p.y, Ani.CUBIC_IN_OUT);
    Ani.to(pos, 1.0f, "z", p.z, Ani.CUBIC_IN_OUT);
  }
}