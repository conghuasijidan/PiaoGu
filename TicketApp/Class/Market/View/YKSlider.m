//
//  YKSlider.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/21.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKSlider.h"

@implementation YKSlider

// 控制slider的宽和高，这个方法才是真正的改变slider滑道的高的
- (CGRect)trackRectForBounds:(CGRect)bounds
{
    return CGRectMake(0, 0, CGRectGetWidth(self.frame), 6);
}

@end
