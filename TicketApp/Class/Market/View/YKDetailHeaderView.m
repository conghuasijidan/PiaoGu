//
//  YKDetailHeaderView.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/19.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKDetailHeaderView.h"
#define yH(h) h/216.0*self.bounds.size.height

@interface YKDetailHeaderView ()
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UILabel *gradeLabel;



@end

@implementation YKDetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
#pragma mark - 搭建界面
- (void)setupUI{
    
    [self addSubview:self.imgView];
    [self addSubview:self.bgView];
    [self addSubview:self.gradeLabel];
    
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kW(kSPACING));
        make.right.equalTo(self).offset(-kW(kSPACING));
        make.top.equalTo(self).offset(yH(20));
    }];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.imgView);
        make.height.mas_equalTo(yH(30));
    }];
    [self.gradeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(kW(5));
        make.centerY.equalTo(self.bgView);
    }];
    
    
    
}
#pragma mark - 控件
- (UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        _imgView.image = [UIImage imageNamed:@"detail_adverimage_placehoder"];
    }
    return _imgView;
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor yk_colorWithRed:51 green:51 blue:51 alpha:0.6];
    }
    return _bgView;
}
- (UILabel *)gradeLabel
{
    if (!_gradeLabel) {
        _gradeLabel = [UILabel yk_labelWithText:@"风险评级：A+" fontSize:14 textColor:[UIColor whiteColor]];
    }
    return _gradeLabel;
}


@end
