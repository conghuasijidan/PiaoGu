//
//  YKHomeMessageTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/18.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKHomeMessageTableViewCell.h"

@interface YKHomeMessageTableViewCell ()

@property(nonatomic,strong)UIImageView *iconImageView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UILabel *stateLabel;
@property(nonatomic,strong)UILabel *conmmentLabel;


@end

@implementation YKHomeMessageTableViewCell
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
    
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.stateLabel];
    [self.contentView addSubview:self.conmmentLabel];
    [self.contentView addSubview:self.contentLabel];

    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kW(kSPACING));
        make.top.equalTo(self.contentView).offset(kH(20, 82.0));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(kW(kSPACING));
        make.top.equalTo(self.iconImageView);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(kW(kSPACING));
        make.centerY.equalTo(self.nameLabel);
    }];
    
    [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(kH(5.0, 82.0));

    }];
    
    [self.conmmentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.top.equalTo(self.stateLabel.mas_bottom).offset(kH(5.0, 82.0));
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel);
        make.right.equalTo(self.contentView).offset(-kW(kSPACING));
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
}
- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.image = [UIImage imageNamed:@"home_message_icon_placehoder"];
        
    }
    return _iconImageView;
}
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel yk_labelWithText:@"傻傻" fontSize:14 textColor:[UIColor yk_colorWithHex:0x333333]];
    }
    return _nameLabel;
}
- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [UILabel yk_labelWithText:@"一天前" fontSize:10 textColor:[UIColor yk_colorWithHex:0x999999]];
    }
    return _timeLabel;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [UILabel yk_labelWithText:@"接下来是研发新品菜系还是店铺装修？" fontSize:10 textColor:[UIColor yk_colorWithHex:0x999999]];
        _contentLabel.numberOfLines = 2;
    }
    return _contentLabel;
}
- (UILabel *)conmmentLabel
{
    if (!_conmmentLabel) {
        _conmmentLabel = [UILabel yk_labelWithText:@"是呀~我觉得很不错" fontSize:12 textColor:[UIColor yk_colorWithHex:0x333333]];
    }
    return _conmmentLabel;
}
- (UILabel *)stateLabel
{
    if (!_stateLabel) {
        _stateLabel = [UILabel yk_labelWithText:@"给你的评论留言了" fontSize:12 textColor:[UIColor yk_colorWithHex:0x666666]];
    }
    return _stateLabel;
}

@end
