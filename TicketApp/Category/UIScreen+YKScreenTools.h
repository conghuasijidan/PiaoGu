//
//  UIScreen+YKScreenTools.h
//  MeiTuan
//
//  Created by 叶文凯 on 16/12/17.
//  Copyright © 2016年 葱花思鸡蛋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (YKScreenTools)
/// 屏幕宽度
+ (CGFloat)yk_screenWidth;
/// 屏幕高度
+ (CGFloat)yk_screenHeight;
/// 分辨率
+ (CGFloat)yk_scale;
/// 状态栏高度
+(CGFloat)yk_statusHeight;

@end
