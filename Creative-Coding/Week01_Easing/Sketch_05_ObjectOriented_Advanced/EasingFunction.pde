// Class is declared static bc it stores no information
// By doing so we don't have to create an instance of Easing function using new
// We can access it directly through EasingFunction.get(t, b, c, d, EasingType.easeInBack)
// All methods have to be declared static

static class EasingFunction {

  static float get(float t, float b, float c, float d, EasingType type) {

    // If exceeded time, then return b + c
    if (t >= d) {
       return b+c; 
    }
    
    else {
    
      if (type == EasingType.easeCustom) {
        return easeCustom(t, b, c, d);
      }
  
      else if (type == EasingType.easeNot) {
        return easeNot(t, b, c, d);
      }
      
      else if (type == EasingType.easeInQuad) {
        return easeInQuad(t, b, c, d);
      } else if (type == EasingType.easeOutQuad) {
        return easeOutQuad(t, b, c, d);
      } else if (type == EasingType.easeInOutQuad) {
        return easeInOutQuad(t, b, c, d);
      } else if (type == EasingType.easeOutInQuad) {
        return easeOutInQuad(t, b, c, d);
      }
      
      else if (type == EasingType.easeInCubic) {
        return easeInCubic(t, b, c, d);
      } else if (type == EasingType.easeOutCubic) {
        return easeOutCubic(t, b, c, d);
      } else if (type == EasingType.easeInOutCubic) {
        return easeInOutCubic(t, b, c, d);
      } else if (type == EasingType.easeOutInCubic) {
        return easeOutInCubic(t, b, c, d);
      }
      
      else if (type == EasingType.easeInQuart) {
        return easeInQuart(t, b, c, d);
      } else if (type == EasingType.easeOutQuart) {
        return easeOutQuart(t, b, c, d);
      } else if (type == EasingType.easeInOutQuart) {
        return easeInOutQuart(t, b, c, d);
      } else if (type == EasingType.easeOutInQuart) {
        return easeOutInQuart(t, b, c, d);
      }
      
      else if (type == EasingType.easeInQuint) {
        return easeInQuint(t, b, c, d);
      } else if (type == EasingType.easeOutQuint) {
        return easeOutQuint(t, b, c, d);
      } else if (type == EasingType.easeInOutQuint) {
        return easeInOutQuint(t, b, c, d);
      } else if (type == EasingType.easeOutInQuint) {
        return easeOutInQuint(t, b, c, d);
      }
      
      else if (type == EasingType.easeInSine) {
        return easeInSine(t, b, c, d);
      } else if (type == EasingType.easeOutSine) {
        return easeOutSine(t, b, c, d);
      } else if (type == EasingType.easeInOutSine) {
        return easeInOutSine(t, b, c, d);
      } else if (type == EasingType.easeOutInSine) {
        return easeOutInSine(t, b, c, d);
      }
      
      else if (type == EasingType.easeInExpo) {
        return easeInExpo(t, b, c, d);
      } else if (type == EasingType.easeOutExpo) {
        return easeOutExpo(t, b, c, d);
      } else if (type == EasingType.easeInOutExpo) {
        return easeInOutExpo(t, b, c, d);
      } else if (type == EasingType.easeOutInExpo) {
        return easeOutInExpo(t, b, c, d);
      }
      
      else if (type == EasingType.easeInCirc) {
        return easeInCirc(t, b, c, d);
      } else if (type == EasingType.easeOutCirc) {
        return easeOutCirc(t, b, c, d);
      } else if (type == EasingType.easeInOutCirc) {
        return easeInOutCirc(t, b, c, d);
      } else if (type == EasingType.easeOutInCirc) {
        return easeOutInCirc(t, b, c, d);
      }
      
      else if (type == EasingType.easeInElastic) {
        return easeInElastic(t, b, c, d);
      } else if (type == EasingType.easeOutElastic) {
        return easeOutElastic(t, b, c, d);
      } else if (type == EasingType.easeInOutElastic) {
        return easeInOutElastic(t, b, c, d);
      } else if (type == EasingType.easeOutInElastic) {
        return easeOutInElastic(t, b, c, d);
      }
      
      else if (type == EasingType.easeInBounce) {
        return easeInBounce(t, b, c, d);
      } else if (type == EasingType.easeOutBounce) {
        return easeOutBounce(t, b, c, d);
      } else if (type == EasingType.easeInOutBounce) {
        return easeInOutBounce(t, b, c, d);
      } else if (type == EasingType.easeOutInBounce) {
        return easeOutInBounce(t, b, c, d);
      }
      
      else if (type == EasingType.easeInBack) {
        return easeInBack(t, b, c, d);
      } else if (type == EasingType.easeOutBack) {
        return easeOutBack(t, b, c, d);
      } else if (type == EasingType.easeInOutBack) {
        return easeInOutBack(t, b, c, d);
      } else if (type == EasingType.easeOutInBack) {
        return easeOutInBack(t, b, c, d);
      }
    
    }
    else {
        return b + c * t/d;
    }
  }



  static float easeCustom(float t, float b, float c, float d) {
    //return c * (.5 + .75 * sin(19.295 * pow(t/d-.5, 3))) + b;
    return c * (.5 + 16 * pow(t/d - .5, 5)) + b;
  }




  /**
   * Easing equation function for a simple linear tweening, with no easing.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeNot(float t, float b, float c, float d) {
    return c * (t/d) + b;
  };


  /**
   * Easing equation function for a quadratic (t^2) easing in: accelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeInQuad(float t, float b, float c, float d) {
    t /= d;
    return c*t*t + b;
  };


  /**
   * Easing equation function for a quadratic (t^2) easing out: decelerating to zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeOutQuad(float t, float b, float c, float d) {
    t /= d;
    return -c * t*(t-2) + b;
  };


  /**
   * Easing equation function for a quadratic (t^2) easing in/out: acceleration until halfway, then deceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeInOutQuad(float t, float b, float c, float d) {
    t /= d/2;
    if (t < 1) return c/2*t*t + b;
    t--;
    return -c/2 * (t*(t-2) - 1) + b;
  };


  /**
   * Easing equation function for a quadratic (t^2) easing out/in: deceleration until halfway, then acceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeOutInQuad(float t, float b, float c, float d) {
    if (t < d/2) { 
      return easeOutQuad(t*2, b, c/2, d);
    }
    return easeInQuad((t*2)-d, b+c/2, c/2, d);
  };


  /**
   * Easing equation function for a cubic (t^3) easing in: accelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeInCubic(float t, float b, float c, float d) {
    t /= d;
    return c*t*t*t + b;
  };


  /**
   * Easing equation function for a cubic (t^3) easing out: decelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeOutCubic(float t, float b, float c, float d) {
    t /= d;
    t--;
    return c*(t*t*t + 1) + b;
  };


  /**
   * Easing equation function for a cubic (t^3) easing in/out: acceleration until halfway, then deceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeInOutCubic(float t, float b, float c, float d) {
    t /= d/2;
    if (t < 1) {
      return c/2*t*t*t + b;
    }
    t -= 2;
    return c/2*(t*t*t + 2) + b;
  };


  /**
   * Easing equation function for a cubic (t^3) easing out/in: deceleration until halfway, then acceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeOutInCubic(float t, float b, float c, float d) {
    if (t < d/2) {
      return easeOutCubic (t*2, b, c/2, d);
    }
    return easeInCubic((t*2)-d, b+c/2, c/2, d);
  };


  /**
   * Easing equation function for a quartic (t^4) easing in: accelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeInQuart(float t, float b, float c, float d) {
    t /= d;
    return c*t*t*t*t + b;
  };


  /**
   * Easing equation function for a quartic (t^4) easing out: decelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeOutQuart(float t, float b, float c, float d) {
    t /= d;
    t--;
    return -c * (t*t*t*t - 1) + b;
  };


  /**
   * Easing equation function for a quartic (t^4) easing in/out: acceleration until halfway, then deceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeInOutQuart(float t, float b, float c, float d) {
    t /= d/2;
    if (t < 1) {
      return c/2*t*t*t*t + b;
    }
    t -= 2;
    return -c/2 * (t*t*t*t - 2) + b;
  };


  /**
   * Easing equation function for a quartic (t^4) easing out/in: deceleration until halfway, then acceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeOutInQuart(float t, float b, float c, float d) {
    if (t < d/2) {
      return easeOutQuart(t*2, b, c/2, d);
    }
    return easeInQuart((t*2)-d, b+c/2, c/2, d);
  };


  /**
   * Easing equation function for a quintic (t^5) easing in: accelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeInQuint(float t, float b, float c, float d) {
    t /= d;
    return c*t*t*t*t*t + b;
  };


  /**
   * Easing equation function for a quintic (t^5) easing out: decelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeOutQuint(float t, float b, float c, float d) {
    t /= d;
    t--;
    return c*(t*t*t*t*t + 1) + b;
  };


  /**
   * Easing equation function for a quintic (t^5) easing in/out: acceleration until halfway, then deceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeInOutQuint(float t, float b, float c, float d) {
    t /= d/2;
    if (t < 1) return c/2*t*t*t*t*t + b;
    t -= 2;
    return c/2*(t*t*t*t*t + 2) + b;
  };


  /**
   * Easing equation function for a quintic (t^5) easing out/in: deceleration until halfway, then acceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeOutInQuint(float t, float b, float c, float d) {
    if (t < d/2) {
      return easeOutQuint (t*2, b, c/2, d);
    }
    return easeInQuint((t*2)-d, b+c/2, c/2, d);
  };


  /**
   * Easing equation function for a sinusoidal (sin(t)) easing in: accelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeInSine(float t, float b, float c, float d) {
    return -c * cos(t/d * (PI/2)) + c + b;
  };


  /**
   * Easing equation function for a sinusoidal (sin(t)) easing out: decelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeOutSine(float t, float b, float c, float d) {
    return c * sin(t/d * (PI/2)) + b;
  };


  /**
   * Easing equation function for a sinusoidal (sin(t)) easing in/out: acceleration until halfway, then deceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeInOutSine(float t, float b, float c, float d) {
    return -c/2 * (cos(PI*t/d) - 1) + b;
  };


  /**
   * Easing equation function for a sinusoidal (sin(t)) easing out/in: deceleration until halfway, then acceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeOutInSine(float t, float b, float c, float d) {
    if (t < d/2) {
      return easeOutSine (t*2, b, c/2, d);
    }
    return easeInSine((t*2)-d, b+c/2, c/2, d);
  };


  /**
   * Easing equation function for an exponential (2^t) easing in: accelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeInExpo(float t, float b, float c, float d) {
    //return (t==0) ? b : c * pow(2, 10 * (t/d - 1)) + b - c * 0.001;
    return c * pow( 2, 10 * (t/d - 1) ) + b;
  };


  /**
   * Easing equation function for an exponential (2^t) easing out: decelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeOutExpo(float t, float b, float c, float d) {
    // return (t==d) ? b+c : c * 1.001 * (-pow(2, -10 * t/d) + 1) + b;
    return c * ( -pow( 2, -10 * t/d ) + 1 ) + b;
  };


  /**
   * Easing equation function for an exponential (2^t) easing in/out: acceleration until halfway, then deceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeInOutExpo(float t, float b, float c, float d) {
    t /= d/2;
    if (t < 1) {
      return c/2 * pow( 2, 10 * (t - 1) ) + b;
    }
    t--;
    return c/2 * ( -pow( 2, -10 * t) + 2 ) + b;
  };


  /**
   * Easing equation function for an exponential (2^t) easing out/in: deceleration until halfway, then acceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeOutInExpo(float t, float b, float c, float d) {
    if (t < d/2) {
      return easeOutExpo (t*2, b, c/2, d);
    }
    return easeInExpo((t*2)-d, b+c/2, c/2, d);
  };


  /**
   * Easing equation function for a circular (sqrt(1-t^2)) easing in: accelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeInCirc(float t, float b, float c, float d) {
    t /= d;
    return -c * (sqrt(1 - t*t) - 1) + b;
  };


  /**
   * Easing equation function for a circular (sqrt(1-t^2)) easing out: decelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeOutCirc(float t, float b, float c, float d) {
    t /= d;
    t--;
    return c * sqrt(1 - t*t) + b;
  };


  /**
   * Easing equation function for a circular (sqrt(1-t^2)) easing in/out: acceleration until halfway, then deceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeInOutCirc(float t, float b, float c, float d) {
    t /= d/2;
    if (t < 1) return -c/2 * (sqrt(1 - t*t) - 1) + b;
    t -= 2;
    return c/2 * (sqrt(1 - t*t) + 1) + b;
  };

  /**
   * Easing equation function for a circular (sqrt(1-t^2)) easing out/in: deceleration until halfway, then acceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeOutInCirc(float t, float b, float c, float d) {
    if (t < d/2) {
      return easeOutCirc (t*2, b, c/2, d);
    }
    return easeInCirc((t*2)-d, b+c/2, c/2, d);
  };


  /**
   * Easing equation function for an elastic (exponentially decaying sine wave) easing in: accelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeInElastic(float t, float b, float c, float d) {
    if (t == 0) {
      return b;
    }
    if ((t /= d) == 1) {
      return b + c;
    }
    float p = d * .3f;
    float a = c;
    float s = p / 4;
    return -(a * pow(2, 10 * (t -= 1)) * sin((t * d - s) * (2 * PI) / p)) + b;
  }


  /**
   // TODO check validity
   * Easing equation function for an elastic (exponentially decaying sine wave) easing in:
   * accelerating from zero velocity.
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @param a             Amplitude.
   * @param p             Period.
   * @return              The correct value.  
   */
  static float easeInElastic(float t, float b, float c, float d, float a, float p) {
    if (t==0) {
      return b;
    }
    if ((t/=d)==1) {
      return b+c;
    }
    float s = 0;
    if (a == 0 || a == 1 || a < abs(c)) {
      a = c;
      s = p/4;
    } else {
      s = p/(2* PI) * asin (c/a);
    }
    return -(a * pow(2, 10*(t-=1)) * sin( (t*d-s)*(2*PI)/p )) + b;
  }

  /**
   * Easing equation function for an elastic (exponentially decaying sine wave) easing out: decelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeOutElastic(float t, float b, float c, float d) {
    if (t == 0) {
      return b;
    }
    if ((t /= d) == 1) {
      return b + c;
    }
    float p = d * .3f;
    float a = c;
    float s = p / 4;
    return (a * pow(2, -10 * t) * sin((t * d - s) * (2 * PI) / p) + c + b);
  }

  /**
   * Easing equation function for an elastic (exponentially decaying sine wave) easing in/out: acceleration until halfway, then deceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @param a             Amplitude.
   * @param p             Period.
   * @return              The correct value.
   */
  static float easeOutElastic(float t, float b, float c, float d, float a, float p) {
    if (t==0) {
      return b;
    }
    if ((t/=d)==1) {
      return b+c;
    }
    float s = 0;
    if (a == 0 || a == 1 || a < abs(c)) {
      a = c;
      s = p/4;
    } else {
      s = p/(2* PI) * asin (c/a);
    }
    return (a * pow(2, -10*t) * sin( (t*d-s)*(2*PI)/p ) + c + b);
  }

  /**
   * Easing equation function for an elastic (exponentially decaying sine wave) easing in/out: acceleration until halfway, then deceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeInOutElastic(float t, float b, float c, float d) {
    if (t == 0) {
      return b;
    }
    if ((t /= d / 2) == 2) {
      return b + c;
    }
    float p = d * (.3f * 1.5f);
    float a = c;
    float s = p / 4;
    if (t < 1) {
      return -.5f * (a * pow(2, 10 * (t -= 1)) * sin((t * d - s) * (2 * PI) / p)) + b;
    }
    return a * pow(2, -10 * (t -= 1)) * sin((t * d - s) * (2 * PI) / p) * .5f + c + b;
  }

  /**
   * Easing equation function for an elastic (exponentially decaying sine wave) easing out/in: deceleration until halfway, then acceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @param a             Amplitude.
   * @param p             Period.
   * @return              The correct value.
   */
  static float easeOutInElastic(float t, float b, float c, float d, float a, float p) {
    if (t < d/2) {
      return easeOutElastic (t*2, b, c/2, d, a, p);
    }
    return easeInElastic((t*2)-d, b+c/2, c/2, d, a, p);
  }


  /**
   * Easing equation function for an elastic (exponentially decaying sine wave) easing out/in: deceleration until halfway, then acceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeOutInElastic(float t, float b, float c, float d) {
    if (t < d/2) {
      return easeOutElastic (t*2, b, c/2, d);
    }
    return easeInElastic((t*2)-d, b+c/2, c/2, d);
  }



  // Easing equation function for a bounce (exponentially decaying parabolic bounce) easing in:
  // accelerating from zero velocity.
  static float easeInBounce(float t, float b, float c, float d) {
    return c - easeOutBounce (d-t, 0, c, d) + b;
  }

  // Easing equation function for a bounce (exponentially decaying parabolic bounce) easing out:
  // decelerating from zero velocity.
  static float easeOutBounce(float t, float b, float c, float d) {
    if ((t/=d) < (1/2.75)) {
      return c*(7.5625*t*t) + b;
    } else if (t < (2/2.75)) {
      return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
    } else if (t < (2.5/2.75)) {
      return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
    } else {
      return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
    }
  }

  // Easing equation function for a bounce (exponentially decaying parabolic bounce) easing in/out: 
  // acceleration until halfway, then deceleration.
  static float easeInOutBounce(float t, float b, float c, float d) {
    if (t < d/2) {
      return easeInBounce (t*2, 0, c, d) * .5 + b;
    }
    return easeOutBounce (t*2-d, 0, c, d) * .5 + c*.5 + b;
  }

  // Easing equation function for a bounce (exponentially decaying parabolic bounce) easing out/in: 
  // deceleration until halfway, then acceleration.
  static float easeOutInBounce(float t, float b, float c, float d) {
    if (t < d/2) {
      return easeOutBounce (t*2, b, c/2, d);
    }
    return easeInBounce((t*2)-d, b+c/2, c/2, d);
  }

  /**
   * Easing equation function for a back (overshooting cubic easing: (s+1)*t^3 - s*t^2) easing in: accelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @param s             Overshoot ammount: higher s means greater overshoot (0 produces cubic easing with no overshoot, and the default value of 1.70158 produces an overshoot of 10 percent).
   * @return              The correct value.
   */  static float easeInBack(float t, float b, float c, float d, float s) {
    s = 1.70158f;
    return c * (t /= d) * t * ((s + 1) * t - s) + b;
  }

  /**
   * Easing equation function for a back (overshooting cubic easing: (s+1)*t^3 - s*t^2) easing in: accelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeInBack(float t, float b, float c, float d) {
    float s = 1.70158f;
    return c * (t /= d) * t * ((s + 1) * t - s) + b;
  }

  /**
   * Easing equation function for a back (overshooting cubic easing: (s+1)*t^3 - s*t^2) easing out: decelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @param s             Overshoot ammount: higher s means greater overshoot (0 produces cubic easing with no overshoot, and the default value of 1.70158 produces an overshoot of 10 percent).
   * @return              The correct value.
   */
  static float easeOutBack(float t, float b, float c, float d, float s) {
    return c * ((t = t / d - 1) * t * ((s + 1) * t + s) + 1) + b;
  }

  /**
   * Easing equation function for a back (overshooting cubic easing: (s+1)*t^3 - s*t^2) easing out: decelerating from zero velocity.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeOutBack(float t, float b, float c, float d) {
    float s = 1.70158f;
    return c * ((t = t / d - 1) * t * ((s + 1) * t + s) + 1) + b;
  }


  /**
   * Easing equation function for a back (overshooting cubic easing: (s+1)*t^3 - s*t^2) easing in/out: acceleration until halfway, then deceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @param s             Overshoot ammount: higher s means greater overshoot (0 produces cubic easing with no overshoot, and the default value of 1.70158 produces an overshoot of 10 percent).
   * @return              The correct value.
   */
  static float easeInOutBack(float t, float b, float c, float d, float s) {
    if ((t /= d / 2) < 1) {
      return c / 2 * (t * t * (((s *= (1.525f)) + 1) * t - s)) + b;
    }
    return c / 2 * ((t -= 2) * t * (((s *= (1.525f)) + 1) * t + s) + 2) + b;
  }

  /**
   * Easing equation function for a back (overshooting cubic easing: (s+1)*t^3 - s*t^2) easing in/out: acceleration until halfway, then deceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeInOutBack(float t, float b, float c, float d) {
    float s = 1.70158f;
    if ((t /= d / 2) < 1) {
      return c / 2 * (t * t * (((s *= (1.525f)) + 1) * t - s)) + b;
    }
    return c / 2 * ((t -= 2) * t * (((s *= (1.525f)) + 1) * t + s) + 2) + b;
  }

  /**
   * Easing equation function for a back (overshooting cubic easing: (s+1)*t^3 - s*t^2) easing out/in: deceleration until halfway, then acceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @param s             Overshoot ammount: higher s means greater overshoot (0 produces cubic easing with no overshoot, and the default value of 1.70158 produces an overshoot of 10 percent).
   * @return              The correct value.
   */
  static float easeOutInBack(float t, float b, float c, float d, float s) {
    if (t < d/2) {
      return easeOutBack (t*2, b, c/2, d, s);
    }
    return easeInBack((t*2)-d, b+c/2, c/2, d, s);
  }

  /**
   * Easing equation function for a back (overshooting cubic easing: (s+1)*t^3 - s*t^2) easing out/in: deceleration until halfway, then acceleration.
   *
   * @param t             Current time (in frames or seconds).
   * @param b             Starting value.
   * @param c             Change needed in value.
   * @param d             Expected easing duration (in frames or seconds).
   * @return              The correct value.
   */
  static float easeOutInBack(float t, float b, float c, float d) {
    if (t < d/2) {
      return easeOutBack (t*2, b, c/2, d);
    }
    return easeInBack((t*2)-d, b+c/2, c/2, d);
  }
}