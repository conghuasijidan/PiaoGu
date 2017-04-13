//
//  UILabel+Addition.m
//  Addition
//
//  Created by 葱花思鸡蛋 on 2017/3/21.
//  Copyright © 2017年 葱花思鸡蛋. All rights reserved.
//

#import "UILabel+Addition.h"

@implementation UILabel (Addition)
+ (instancetype)yk_labelWithText:(NSString *)text {
    return [self yk_labelWithText:text fontSize:14 textColor:[UIColor darkGrayColor] alignment:NSTextAlignmentLeft];
}

+ (instancetype)yk_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize {
    return [self yk_labelWithText:text fontSize:fontSize textColor:[UIColor darkGrayColor] alignment:NSTextAlignmentLeft];
}

+ (instancetype)yk_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor {
    return [self yk_labelWithText:text fontSize:fontSize textColor:textColor alignment:NSTextAlignmentLeft];
}

+ (instancetype)yk_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor alignment:(NSTextAlignment)alignment {
    
    UILabel *label = [[self alloc] init];
    
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = textColor;
    label.numberOfLines = 0;
    label.textAlignment = alignment;
    
    [label sizeToFit];
    
    return label;
}

@end
