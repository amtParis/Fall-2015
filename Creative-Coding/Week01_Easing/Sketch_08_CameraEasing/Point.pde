public class Point {

  PVector pos;
  
  boolean ended;

  Point( PVector p0, PVector p1) {
    pos = p0;
    setTarget(p1);
  }


  public void setTarget(PVector p) {
    Ani.to(pos, 1.0f, "x", p.x, Ani.CUBIC_IN_OUT);
    Ani.to(pos, 1.0f, "y", p.y, Ani.CUBIC_IN_OUT);
    Ani.to(pos, 1.0f, "z", p.z, Ani.CUBIC_IN_OUT);
  }
}