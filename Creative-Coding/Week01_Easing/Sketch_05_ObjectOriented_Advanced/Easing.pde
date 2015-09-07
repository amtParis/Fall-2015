class Easing {

  // Two vectors to store the base position and its target shift
  PVector base;
  PVector change;
  // We store the current position in a vector 
  PVector current;

  // Start time of the movement
  float startTime;
  // Duration of the transition (in milliseconds)
  float duration = 1000;


  Easing() {

    // Center the current and target in the middle of the screen
    base = new PVector(width/2, height/2);
    change = new PVector(0, 0);

    current = new PVector();
    current.set(base);
  }

  void update() {
    // Elapsed time since start time
    float elapsedTime = millis() - startTime;

    // If we're under the duration, then  
    if (elapsedTime <= duration) {
      // Interpolate the current position based on time and change
      // f(x) = b + c * (t/d)
      current.x =  EasingFunction.get(elapsedTime, base.x, change.x, duration, EasingType.easeOutCubic);
      current.y =  EasingFunction.get(elapsedTime, base.y, change.y, duration, EasingType.easeInCirc);
      current.z =  EasingFunction.get(elapsedTime, base.z, change.z, duration, EasingType.easeInSine);
    }
  }

  void setDuration(float duration) {
    this.duration = duration;
  }


  void setTarget(float x, float y) {
    setTarget(x, y, 0);
  }


  void setTarget(float x, float y, float z) {
    startTime = millis();
    base.set(current);
    change.set(x - base.x, y - base.y, z - base.z);
  }
}