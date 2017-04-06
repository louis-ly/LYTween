//
//  LYTween.h
//  LYTween
//
//  Created by louis on 2017/4/6.
//  Copyright © 2017年 louis. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LYTweenType) {
    LYTweenTypeLinear, // 线性匀速运动效果；
    LYTweenTypeQuadratic, // 二次方的缓动（t^2）；
    LYTweenTypeCubic, // 三次方的缓动（t^3）；
    LYTweenTypeQuartic, // 四次方的缓动（t^4）；
    LYTweenTypeQuintic, // 五次方的缓动（t^5）；
    LYTweenTypeSinusoidal, // 正弦曲线的缓动（sin(t)）；
    LYTweenTypeExponential, // 指数曲线的缓动（2^t）；
    LYTweenTypeCircular, // 圆形曲线的缓动（sqrt(1-t^2)）；
    LYTweenTypeElastic, // 指数衰减的正弦曲线缓动；
    LYTweenTypeBack, // 超过范围的三次方缓动（(s+1)*t^3 – s*t^2）；
    LYTweenTypeBounce, // 指数衰减的反弹缓动。
};

typedef NS_ENUM(NSUInteger, LYTweenOption) {
    LYTweenOptionEaseIn,
    LYTweenOptionEaseOut,
    LYTweenOptionEaseInOut,
};

CGFloat LYTweenWithType(LYTweenType type, LYTweenOption option, CGFloat t, CGFloat b, CGFloat c, CGFloat d);
