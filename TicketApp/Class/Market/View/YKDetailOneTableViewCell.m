//
//  YKDetailOneTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/20.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKDetailOneTableViewCell.h"
#import "YKSlider.h"

@interface YKDetailOneTableViewCell ()
@property(nonatomic,strong)UILabel *storeLabel;
@property(nonatomic,strong)UILabel *descLabel;
@property(nonatomic,strong)YKSlider *slider;
@property(nonatomic,strong)UIView *maskView;
@property(nonatomic,strong)UILabel *goalMoneyLabel;
@property(nonatomic,strong)UILabel *getMoneyLabel;
@property(nonatomic,strong)UILabel *percentLabel;
@property(nonatomic,strong)UILabel *goalLabel;
@property(nonatomic,strong)UILabel *getLabel;
@property(nonatomic,strong)UILabel *perLabel;
@property(nonatomic,strong)UIView *lineView;

@end
@implementation YKDetailOneTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}
#pragma mark - 搭建界面
- (void)setupUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.storeLabel];
    [self.contentView addSubview:self.descLabel];
    [self.contentView addSubview:self.slider];
    [self.contentView addSubview:self.maskView];
    [self.contentView addSubview:self.goalMoneyLabel];
    [self.contentView addSubview:self.goalLabel];
    [self.contentView addSubview:self.getMoneyLabel];
    [self.contentView addSubview:self.getLabel];
    [self.contentView addSubview:self.percentLabel];
    [self.contentView addSubview:self.perLabel];
    [self.contentView addSubview:self.lineView];
    
    [self.storeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kW(kSPACING));
        make.top.equalTo(self.contentView).offset(20);
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.storeLabel);
        make.right.equalTo(self.contentView).offset(-kW(kSPACING));
        
        make.top.equalTo(self.storeLabel.mas_bottom).offset(10);
    }];
    [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kW(15));
        make.right.equalTo(self.contentView).offset(-kW(15));
        make.top.equalTo(self.descLabel.mas_bottom).offset(20);
    }];
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.slider);
    }];
    [self.goalMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.slider);
        make.top.equalTo(self.slider.mas_bottom).offset(15);
    }];
    [self.goalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.goalMoneyLabel);
        make.top.equalTo(self.goalMoneyLabel.mas_bottom);
    }];
    [self.getMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.goalMoneyLabel);
    }];
    [self.getLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goalLabel);
        make.centerX.equalTo(self.getMoneyLabel);
    }];
    [self.percentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.slider);
        make.top.equalTo(self.goalMoneyLabel);
    }];
    [self.perLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.percentLabel);
        make.top.equalTo(self.goalLabel);
        make.bottom.equalTo(self.contentView).offset(-20);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
}

#pragma mark - 控件
- (UILabel *)storeLabel
{
    if (!_storeLabel) {
        _storeLabel = [UILabel yk_labelWithText:@"新白鹿餐厅" fontSize:18 textColor:[UIColor yk_colorWithHex:0x666666]];
        
    }
    return _storeLabel;
}
- (UILabel *)descLabel
{
    if (!_descLabel) {
        NSString *textStr = @"杭州知名中餐连锁餐厅，成立于1998年，广受长三角人民喜爱。总部位于杭州中山北路572号，员工总数超过1000人。";
        _descLabel = [UILabel yk_labelWithText:textStr fontSize:14 textColor:[UIColor yk_colorWithHex:0x999999]];
        _descLabel.numberOfLines = 0;
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:textStr];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init
                                                   ];
        [paragraphStyle setLineSpacing:3];
        [attributedString addAttribute:NSParagraphStyleAttributeName value: paragraphStyle range:NSMakeRange(0, [textStr length])];
        _descLabel.attributedText = attributedString;
        
    }
    return _descLabel;
}

- (void)setText:(NSString *)text
{
    _text = text;
    self.descLabel.text = text;
}
- (YKSlider *)slider
{
    if (!_slider) {
        _slider = [[YKSlider alloc] init];
        _slider.minimumValue = 0.0;
        _slider.maximumValue = 1.0;
        [_slider setThumbImage:[UIImage imageNamed:@"market_detail_slider"] forState:UIControlStateNormal];
        _slider.maximumTrackTintColor = [UIColor yk_colorWithRed:232 green:232 blue:232 alpha:1];
        _slider.minimumTrackTintColor = [UIColor yk_colorWithHex:0xF48D95];
        _slider.value = 0.6;
    }
    return _slider;
}
- (UIView *)maskView
{
    if (!_maskView) {
        _maskView = [[UIView alloc] init];
        _maskView.backgroundColor = [UIColor clearColor];
    }
    return _maskView;
}
- (UILabel *)goalMoneyLabel
{
    if (!_goalMoneyLabel) {
        _goalMoneyLabel = [UILabel yk_labelWithText:@"200.00万" fontSize:14 textColor:[UIColor yk_colorWithHex:0x666666]];
    }
    return _goalMoneyLabel;
}
- (UILabel *)getMoneyLabel
{
    if (!_getMoneyLabel) {
        _getMoneyLabel = [UILabel yk_labelWithText:@"146.00万" fontSize:14 textColor:[UIColor yk_colorWithHex:0x666666]];
    }
    return _getMoneyLabel;
}
- (UILabel *)percentLabel
{
    if (!_percentLabel) {
        _percentLabel = [UILabel yk_labelWithText:@"73%" fontSize:14 textColor:[UIColor yk_colorWithHex:0x666666]];
    }
    return _percentLabel;
}
- (UILabel *)goalLabel
{
    if (!_goalLabel) {
        _goalLabel = [UILabel yk_labelWithText:@"筹集目标" fontSize:12 textColor:[UIColor yk_colorWithHex:0x999999]];
    }
    return _goalLabel;
}
- (UILabel *)getLabel
{
    if (!_getLabel) {
        _getLabel = [UILabel yk_labelWithText:@"已筹金额" fontSize:12 textColor:[UIColor yk_colorWithHex:0x999999]];
    }
    return _getLabel;
}
- (UILabel *)perLabel
{
    if (!_perLabel) {
        _perLabel = [UILabel yk_labelWithText:@"完成率" fontSize:12 textColor:[UIColor yk_colorWithHex:0x999999]];
    }
    return _perLabel;
}
- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor yk_colorWithRed:153 green:153 blue:153 alpha:.2];
    }
    return _lineView;
}

@end
