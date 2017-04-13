//
//  UILabel+Addition.h
//  Addition
//
//  Created by 葱花思鸡蛋 on 2017/3/21.
//  Copyright © 2017年 葱花思鸡蛋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Addition)
/// 实例化 UILabel
///
/// @param text text
///
/// @return UILabel 默认字体 14，默认颜色 [UIColor darkGrayColor]，默认对齐方式 Left
+ (nonnull instancetype)yk_labelWithText:(nullable NSString *)text;

/// 实例化 UILabel
///
/// @param text     text
/// @param fontSize fontSize
///
/// @return UILabel 默认颜色 [UIColor darkGrayColor]，默认对齐方式 Left
+ (nonnull instancetype)yk_labelWithText:(nullable NSString *)text fontSize:(CGFloat)fontSize;

/// 实例化 UILabel
///
/// @param text      text
/// @param fontSize  fontSize
/// @param textColor textColor
///
/// @return UILabel 默认对齐方式 Left
+ (nonnull instancetype)yk_labelWithText:(nullable NSString *)text
                                fontSize:(CGFloat)fontSize
                               textColor:(nonnull UIColor *)textColor;

/// 实例化 UILabel
///
/// @param text      text
/// @param fontSize  fontSize
/// @param textColor textColor
/// @param alignment alignment
///
/// @return UILabel
+ (nonnull instancetype)yk_labelWithText:(nullable NSString *)text
                                fontSize:(CGFloat)fontSize
                               textColor:(nonnull UIColor *)textColor
                               alignment:(NSTextAlignment)alignment;


@end
