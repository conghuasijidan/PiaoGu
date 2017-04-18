//
//  UIScreen+YKScreenTools.m
//  MeiTuan
//
//  Created by 叶文凯 on 16/12/17.
//  Copyright © 2016年 葱花思鸡蛋. All rights reserved.
//

#import "UIScreen+YKScreenTools.h"

@implementation UIScreen (YKScreenTools)
+ (CGFloat)yk_screenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)yk_screenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}

+ (CGFloat)yk_scale {
    return [UIScreen mainScreen].scale;
}

+(CGFloat)yk_statusHeight{
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    return rectStatus.size.height;
}

@end
