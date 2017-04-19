//
//  YKHomeHeaderView.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/19.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKHomeHeaderView.h"
#define yH(h) h/237.0*self.bounds.size.height


@interface YKHomeHeaderView ()
@property(nonatomic,strong)UIImageView *bgimageView;
@property(nonatomic,strong)UILabel *totalLabel;
@property(nonatomic,strong)UILabel *totalMoneyLabel;
@property(nonatomic,strong)UILabel *lastProfitLabel;
@property(nonatomic,strong)UILabel *totalProfitLabel;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIView *shortLineView;
@property(nonatomic,strong)UIView *shortRightLineView;


@end

@implementation YKHomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
#pragma mark - 搭建界面
- (void)setupUI{
    
    [self addSubview:self.bgimageView];
    [self addSubview:self.totalLabel];
    [self addSubview:self.totalMoneyLabel];
    [self addSubview:self.lastProfitLabel];
    [self addSubview:self.lineView];
    [self addSubview:self.totalProfitLabel];
    [self addSubview:self.titleLabel];
    
    [self.bgimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.bottom.equalTo(self).offset(-yH(37));
    }];
    
    [self.totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(yH(30));
    }];
    [self.totalMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.totalLabel.mas_bottom).offset(yH(10));
    }];
    [self.lastProfitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.totalMoneyLabel.mas_bottom).offset(yH(10));
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.mas_equalTo(1);
        make.top.equalTo(self.lastProfitLabel.mas_bottom).offset(yH(30));
    }];
    [self.totalProfitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.lineView.mas_bottom).offset(yH(15));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self);
    }];
    [self addSubview:self.shortLineView];
    [self.shortLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.titleLabel.mas_left).offset(-kW(5));
        make.centerY.equalTo(self.titleLabel);
        make.size.mas_equalTo(CGSizeMake(kW(10), 1));
    }];
    [self addSubview:self.shortRightLineView];
    [self.shortRightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).offset(kW(5));
        make.centerY.equalTo(self.titleLabel);
        make.size.mas_equalTo(CGSizeMake(kW(10), 1));
    }];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.bgimageView.image = self.bgImage;
    

}


#pragma mark - 控价
- (UIImageView *)bgimageView
{
    if (!_bgimageView) {
        _bgimageView = [[UIImageView alloc] init];
        _bgimageView.image = [UIImage imageNamed:@"home_invest_header_bg"];
    }
    return _bgimageView;
}
- (UILabel *)totalLabel
{
    if (!_totalLabel) {
        _totalLabel = [UILabel yk_labelWithText:@"总金额（元）" fontSize:14 textColor:[UIColor whiteColor]];
    }
    return _totalLabel;
}
- (UILabel *)totalMoneyLabel
{
    if (!_totalMoneyLabel) {
        _totalMoneyLabel = [UILabel yk_labelWithText:@"666666.66" fontSize:30 textColor:[UIColor whiteColor]];
    }
    return _totalMoneyLabel;
}
- (UILabel *)lastProfitLabel
{
    if (!_lastProfitLabel) {
        _lastProfitLabel = [UILabel yk_labelWithText:@"昨日：+170元" fontSize:14 textColor:[UIColor yk_colorWithHex:0xffffff]];
    }
    return _lastProfitLabel;
}
- (UILabel *)totalProfitLabel
{
    if (!_totalProfitLabel) {
        _totalProfitLabel = [UILabel yk_labelWithText:@"累计收益（元）：7899" fontSize:14 textColor:[UIColor yk_colorWithHex:0xffffff]];
    }
    return _totalProfitLabel;
}
- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor yk_colorWithRed:245 green:245 blue:245 alpha:0.15];
    }
    return _lineView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel yk_labelWithText:@"产品列表" fontSize:14 textColor:[UIColor yk_colorWithHex:0x999999]];
    }
    return _titleLabel;
}
- (UIView *)shortLineView
{
    if (!_shortLineView) {
        _shortLineView = [[UIView alloc] init];
        _shortLineView.backgroundColor = [UIColor yk_colorWithRed:151 green:151 blue:151 alpha:.3];
    }
    return _shortLineView;
}
- (UIView *)shortRightLineView
{
    if (!_shortRightLineView) {
        _shortRightLineView = [[UIView alloc] init];
        _shortRightLineView.backgroundColor = [UIColor yk_colorWithRed:151 green:151 blue:151 alpha:.3];
    }
    return _shortRightLineView;
}
@end
