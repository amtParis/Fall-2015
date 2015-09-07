public class Point {

  PVector pos;
  boolean ended;

  // Create your custom easing at http://www.greensock.com/customease/
  CustomEasing customEasing1 = CustomEasing.create("customEasing1","[{s:0,cp:0.383,e:0.644},{s:0.644,cp:0.905,e:1.044},{s:1.044,cp:1.183,e:1.012},{s:1.012,cp:0.841,e:1}]");
  CustomEasing customEasing2 = CustomEasing.create("customEasing2", "[{s:0,cp:-0.067,e:-0.052},{s:-0.052,cp:-0.037,e:0.06},{s:0.06,cp:0.157,e:-0.064},{s:-0.064,cp:-0.28499,e:0.064},{s:0.064,cp:0.413,e:-0.08},{s:-0.08,cp:-0.57299,e:0.56799},{s:0.56799,cp:1.709,e:1}]");

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
    //Ani.to(pos, 10.0f, "x", p.x, Ani.EXPO_OUT, this, "onStart:started, onEnd:ended");
    //Ani.to(pos, 10.0f, "y", p.y, Ani.CUBIC_IN_OUT);
    //Ani.to(pos, 10.0f, "z", p.z);
    Ani.to(pos, 10.0f, "x", p.x, CustomEasing.byName("customEasing1"), this, "onStart:started, onEnd:ended");
    Ani.to(pos, 10.0f, "y", p.y, CustomEasing.byName("customEasing2"));
    Ani.to(pos, 10.0f, "z", p.z);
  }
}