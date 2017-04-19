//
//  YKRecordTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/19.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKRecordTableViewCell.h"

@interface YKRecordTableViewCell ()
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *weekLabel;
@property(nonatomic,strong)UIImageView *iconImageView;
@property(nonatomic,strong)UILabel *incomeLabel;
@property(nonatomic,strong)UILabel *sourceLabel;
@property(nonatomic,strong)UIView *lineView;

@end
@implementation YKRecordTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setupUI];
}

#pragma mark - 搭建界面
- (void)setupUI{
    [self.contentView addSubview:self.weekLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.incomeLabel];
    [self.contentView addSubview:self.sourceLabel];
    [self.contentView addSubview:self.lineView];
    
    [self.weekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kW(10));
        make.top.equalTo(self.contentView).offset(kH(20.0, 80.0));
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.weekLabel);
        make.top.equalTo(self.weekLabel.mas_bottom).offset(kH(10, 80.0));
    }];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.timeLabel.mas_right).offset(kW(20));
    }];
    [self.incomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView);
        make.left.equalTo(self.iconImageView.mas_right).offset(kW(15));
    }];
    [self.sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.incomeLabel);
        make.bottom.equalTo(self.timeLabel);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
}
#pragma mark - 控件
- (UILabel *)weekLabel
{
    if (!_weekLabel) {
        _weekLabel = [UILabel yk_labelWithText:@"周二" fontSize:14 textColor:[UIColor yk_colorWithHex:0x999999]];
    }
    return _weekLabel;
}
- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [UILabel yk_labelWithText:@"08:20" fontSize:12 textColor:[UIColor yk_colorWithHex:0x999999]];
    }
    return _timeLabel;
}
- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_record_icon_placeholder"]];
    }
    return _iconImageView;
}
- (UILabel *)incomeLabel
{
    if (!_incomeLabel) {
        _incomeLabel = [UILabel yk_labelWithText:@" +123.00" fontSize:18 textColor:[UIColor yk_colorWithHex:0x333333]];
    }
    return _incomeLabel;
}
- (UILabel *)sourceLabel
{
    if (!_sourceLabel) {
        _sourceLabel = [UILabel yk_labelWithText:@"【投资宝】收入于外婆家（湖滨店）" fontSize:12 textColor:[UIColor yk_colorWithHex:0x666666]];
    }
    return _sourceLabel;
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
