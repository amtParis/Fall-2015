public class Point {

  PVector pos;
  boolean ended;

  Point(PVector p0, PVector p1) {
    pos = p0;
    setTarget(p1);
  }

  public void started() {
    ended = true;
  }

  
  public void ended() {
    ended = false;
  }

  public void setTarget(PVector p) {
    Ani.to(pos, 10.0f, "x", p.x, Ani.EXPO_OUT, this, "onStart:started, onEnd:ended");
    Ani.to(pos, 10.0f, "y", p.y, Ani.CUBIC_IN_OUT);
    Ani.to(pos, 10.0f, "z", p.z);
  }
  
}