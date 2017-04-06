//
//  LYTween.m
//  LYTween
//
//  Created by louis on 2017/4/6.
//  Copyright © 2017年 louis. All rights reserved.
//

#import "LYTween.h"

CGFloat LYLinear(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return c*t/d + b;
}


CGFloat LYQuadEaseIn(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    t /= d;
    return c * t * t + b;
}
CGFloat LYQuadEaseOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    t /= d;
    return -c * t*(t-2) + b;
}
CGFloat LYQuadEaseInOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    if ((t /= d / 2) < 1) return c / 2 * t * t + b;
    --t;
    return -c / 2 * (t * (t-2) - 1) + b;
}


CGFloat LYCubicEaseIn(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    t /= d;
    return c * t * t * t + b;
}
CGFloat LYCubicEaseOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    t = t/d - 1;
    return c * (t * t * t + 1) + b;
}
CGFloat LYCubicEaseInOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    if ((t /= d / 2) < 1) return c / 2 * t * t*t + b;
    t -= 2;
    return c / 2*(t * t * t + 2) + b;
}


CGFloat LYQuartEaseIn(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    t /= d;
    return c * t * t * t*t + b;
}
CGFloat LYQuartEaseOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    t = t/d - 1;
    return -c * (t * t * t*t - 1) + b;
}
CGFloat LYQuartEaseInOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    if ((t /= d / 2) < 1) return c / 2 * t * t * t * t + b;
    t -= 2;
    return -c / 2 * (t * t * t*t - 2) + b;
}


CGFloat LYQuintEaseIn(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    t /= d;
    return c * t * t * t * t * t + b;
}
CGFloat LYQuintEaseOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    t = t/d - 1;
    return c * (t * t * t * t * t + 1) + b;
}
CGFloat LYQuintEaseInOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    if ((t /= d / 2) < 1) return c / 2 * t * t * t * t * t + b;
    t -= 2;
    return c / 2*(t * t * t * t * t + 2) + b;
}


CGFloat LYSineEaseIn(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return -c * cos(t/d * (M_PI/2)) + c + b;
}
CGFloat LYSineEaseOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return c * sin(t/d * (M_PI/2)) + b;
}
CGFloat LYSineEaseInOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return -c / 2 * (cos(M_PI * t/d) - 1) + b;
}


CGFloat LYExpoEaseIn(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return (t==0) ? b : c * pow(2, 10 * (t/d - 1)) + b;
}
CGFloat LYExpoEaseOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return (t==d) ? b + c : c * (-pow(2, -10 * t/d) + 1) + b;
}
CGFloat LYExpoEaseInOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    if (t==0) return b;
    if (t==d) return b+c;
    if ((t /= d / 2) < 1) return c / 2 * pow(2, 10 * (t - 1)) + b;
    return c / 2 * (-pow(2, -10 * --t) + 2) + b;
}


CGFloat LYCircEaseIn(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    t /= d;
    return -c * (sqrt(1 - t * t) - 1) + b;
}
CGFloat LYCircEaseOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    t = t/d - 1;
    return c * sqrt(1 - t * t) + b;
}
CGFloat LYCircEaseInOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    if ((t /= d / 2) < 1) return -c / 2 * (sqrt(1 - t * t) - 1) + b;
    t -= 2;
    return c / 2 * (sqrt(1 - t * t) + 1) + b;
}


CGFloat LYElasticEaseIn(CGFloat t, CGFloat b, CGFloat c, CGFloat d, CGFloat a, CGFloat p) {
    CGFloat s;
    if (t==0) return b;
    if ((t /= d) == 1) return b + c;
    if (p == 0) p = d * .3;
    if (!a || a < fabs(c)) {
        s = p / 4;
        a = c;
    } else {
        s = p / (2 * M_PI) * asin(c / a);
    }
    t -= 1;
    return -(a * pow(2, 10 * t) * sin((t * d - s) * (2 * M_PI) / p)) + b;
}
CGFloat LYElasticEaseOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d, CGFloat a, CGFloat p) {
    CGFloat s;
    if (t==0) return b;
    if ((t /= d) == 1) return b + c;
    if (p == 0) p = d * .3;
    if (!a || a < fabs(c)) {
        a = c;
        s = p / 4;
    } else {
        s = p/(2*M_PI) * asin(c/a);
    }
    return (a * pow(2, -10 * t) * sin((t * d - s) * (2 * M_PI) / p) + c + b);
}
CGFloat LYElasticEaseInOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d, CGFloat a, CGFloat p) {
    CGFloat s;
    if (t==0) return b;
    if ((t /= d / 2) == 2) return b+c;
    if (p == 0) p = d * (.3 * 1.5);
    if (!a || a < fabs(c)) {
        a = c;
        s = p / 4;
    } else {
        s = p / (2  *M_PI) * asin(c / a);
    }
    if (t < 1) {
        t -= 1;
        return -.5 * (a * pow(2, 10* t) * sin((t * d - s) * (2 * M_PI) / p)) + b;
    }
    t -= 1;
    return a * pow(2, -10 * t) * sin((t * d - s) * (2 * M_PI) / p ) * .5 + c + b;
}

CGFloat LYBackEaseIn(CGFloat t, CGFloat b, CGFloat c, CGFloat d, CGFloat s) {
    if (s == 0) s = 1.70158;
    t /= d;
    return c * t * t * ((s + 1) * t - s) + b;
}
CGFloat LYBackEaseOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d, CGFloat s) {
    if (s == 0) s = 1.70158;
    t = t/d - 1;
    return c * (t * t * ((s + 1) * t + s) + 1) + b;
}
CGFloat LYBackEaseInOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d, CGFloat s) {
    if (s == 0) s = 1.70158;
    if ((t /= d / 2) < 1) {
        s *= (1.525);
        return c / 2 * (t * t * ((s + 1) * t - s)) + b;
    }
    t -= 2;
    s *= (1.525);
    return c / 2*(t * t * ((s + 1) * t + s) + 2) + b;
}

CGFloat LYBounceEaseOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    if ((t /= d) < (1 / 2.75)) {
        return c * (7.5625 * t * t) + b;
    } else if (t < (2 / 2.75)) {
        t -= (1.5 / 2.75);
        return c * (7.5625 * t * t + .75) + b;
    } else if (t < (2.5 / 2.75)) {
        t -= (2.25 / 2.75);
        return c * (7.5625 * t * t + .9375) + b;
    } else {
        t -= (2.625 / 2.75);
        return c * (7.5625 * t * t + .984375) + b;
    }
}
CGFloat LYBounceEaseIn(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    return c - LYBounceEaseOut(d-t, 0, c, d) + b;
}
CGFloat LYBounceEaseInOut(CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    if (t < d / 2) {
        return LYBounceEaseIn(t * 2, 0, c, d) * .5 + b;
    } else {
        return LYBounceEaseOut(t * 2 - d, 0, c, d) * .5 + c * .5 + b;
    }
}



CGFloat LYTweenWithType(LYTweenType type, LYTweenOption option, CGFloat t, CGFloat b, CGFloat c, CGFloat d) {
    CGFloat result = 0;
    switch (type) {
        case LYTweenTypeLinear: {
            return LYLinear(t, b, c, d);
        }   break;
        case LYTweenTypeQuadratic: {
            switch (option) {
                case LYTweenOptionEaseIn:
                    return LYQuadEaseIn(t, b, c, d);
                    break;
                case LYTweenOptionEaseOut:
                    return LYQuadEaseOut(t, b, c, d);
                    break;
                case LYTweenOptionEaseInOut:
                    return LYQuadEaseInOut(t, b, c, d);
                    break;
                default:
                    break;
            }
        }   break;
        case LYTweenTypeCubic: {
            switch (option) {
                case LYTweenOptionEaseIn:
                    return LYCubicEaseIn(t, b, c, d);
                    break;
                case LYTweenOptionEaseOut:
                    return LYCubicEaseOut(t, b, c, d);
                    break;
                case LYTweenOptionEaseInOut:
                    return LYCubicEaseInOut(t, b, c, d);
                    break;
                default:
                    break;
            }
        }   break;
        case LYTweenTypeQuartic: {
            switch (option) {
                case LYTweenOptionEaseIn:
                    return LYQuartEaseIn(t, b, c, d);
                    break;
                case LYTweenOptionEaseOut:
                    return LYQuartEaseOut(t, b, c, d);
                    break;
                case LYTweenOptionEaseInOut:
                    return LYQuartEaseInOut(t, b, c, d);
                    break;
                default:
                    break;
            }
        }   break;
        case LYTweenTypeQuintic: {
            switch (option) {
                case LYTweenOptionEaseIn:
                    return LYQuintEaseIn(t, b, c, d);
                    break;
                case LYTweenOptionEaseOut:
                    return LYQuintEaseOut(t, b, c, d);
                    break;
                case LYTweenOptionEaseInOut:
                    return LYQuintEaseInOut(t, b, c, d);
                    break;
                default:
                    break;
            }
        }   break;
        case LYTweenTypeSinusoidal: {
            switch (option) {
                case LYTweenOptionEaseIn:
                    return LYSineEaseIn(t, b, c, d);
                    break;
                case LYTweenOptionEaseOut:
                    return LYSineEaseOut(t, b, c, d);
                    break;
                case LYTweenOptionEaseInOut:
                    return LYSineEaseInOut(t, b, c, d);
                    break;
                default:
                    break;
            }
        }   break;
        case LYTweenTypeExponential: {
            switch (option) {
                case LYTweenOptionEaseIn:
                    return LYExpoEaseIn(t, b, c, d);
                    break;
                case LYTweenOptionEaseOut:
                    return LYExpoEaseOut(t, b, c, d);
                    break;
                case LYTweenOptionEaseInOut:
                    return LYExpoEaseInOut(t, b, c, d);
                    break;
                default:
                    break;
            }
        }   break;
        case LYTweenTypeCircular: {
            switch (option) {
                case LYTweenOptionEaseIn:
                    return LYCircEaseIn(t, b, c, d);
                    break;
                case LYTweenOptionEaseOut:
                    return LYCircEaseOut(t, b, c, d);
                    break;
                case LYTweenOptionEaseInOut:
                    return LYCircEaseInOut(t, b, c, d);
                    break;
                default:
                    break;
            }
        }   break;
        case LYTweenTypeElastic: {
            switch (option) {
                case LYTweenOptionEaseIn:
                    return LYElasticEaseIn(t, b, c, d, 0, 0);
                    break;
                case LYTweenOptionEaseOut:
                    return LYElasticEaseOut(t, b, c, d, 0, 0);
                    break;
                case LYTweenOptionEaseInOut:
                    return LYElasticEaseInOut(t, b, c, d, 0, 0);
                    break;
                default:
                    break;
            }
        }   break;
        case LYTweenTypeBack: {
            switch (option) {
                case LYTweenOptionEaseIn:
                    return LYBackEaseIn(t, b, c, d, 0);
                    break;
                case LYTweenOptionEaseOut:
                    return LYBackEaseOut(t, b, c, d, 0);
                    break;
                case LYTweenOptionEaseInOut:
                    return LYBackEaseInOut(t, b, c, d, 0);
                    break;
                default:
                    break;
            }
        }   break;
        case LYTweenTypeBounce: {
            switch (option) {
                case LYTweenOptionEaseIn:
                    return LYBounceEaseIn(t, b, c, d);
                    break;
                case LYTweenOptionEaseOut:
                    return LYBounceEaseOut(t, b, c, d);
                    break;
                case LYTweenOptionEaseInOut:
                    return LYBounceEaseInOut(t, b, c, d);
                    break;
                default:
                    break;
            }
        }   break;
        default:
            break;
    }
    return result;
}

