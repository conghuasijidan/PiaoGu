//
//  UIColor+Addtion.m
//  YueShiJia
//
//  Created by 葱花思鸡蛋 on 2017/3/1.
//  Copyright © 2017年 葱花思鸡蛋. All rights reserved.
//

#import "UIColor+Addtion.h"

@implementation UIColor (Addtion)
#pragma mark - 颜色函数
+ (instancetype)yk_colorWithHex:(u_int32_t)hex {
    u_int8_t red = (hex & 0xFF0000) >> 16;
    u_int8_t green = (hex & 0x00FF00) >> 8;
    u_int8_t blue = hex & 0x0000FF;
    
    return [UIColor yk_colorWithRed:red green:green blue:blue];
}

+ (instancetype)yk_colorWithRed:(u_int8_t)red green:(u_int8_t)green blue:(u_int8_t)blue {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}

+ (nonnull instancetype)yk_colorWithRed:(u_int8_t)red green:(u_int8_t)green blue:(u_int8_t)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}

+ (instancetype)yk_randomColor {
    u_int8_t red = arc4random_uniform(256);
    u_int8_t green = arc4random_uniform(256);
    u_int8_t blue = arc4random_uniform(256);
    
    return [UIColor yk_colorWithRed:red green:green blue:blue];
}

#pragma mark - 颜色值
- (u_int8_t)yk_redValue {
    return (u_int8_t)(CGColorGetComponents(self.CGColor)[0] * 255);
}

- (u_int8_t)yk_greenValue {
    return (u_int8_t)(CGColorGetComponents(self.CGColor)[1] * 255);
}

- (u_int8_t)yk_blueValue {
    return (u_int8_t)(CGColorGetComponents(self.CGColor)[2] * 255);
}

- (CGFloat)yk_alphaValue {
    return CGColorGetComponents(self.CGColor)[3];
}



@end
