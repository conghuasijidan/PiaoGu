//
//  YKDetailThreeTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/20.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKDetailThreeTableViewCell.h"

@interface YKDetailThreeTableViewCell ()
@property(nonatomic,strong)UIImageView *iconImgView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *descLabel;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UIImageView *comImgView;
@property(nonatomic,strong)UILabel *comCountLabel;

@end

@implementation YKDetailThreeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
#pragma mark - 搭建界面
- (void)setupUI{
    
    [self.contentView addSubview:self.iconImgView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.descLabel];
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.comImgView];
    [self.contentView addSubview:self.comCountLabel];
    
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kSPACING);
        make.top.equalTo(self.contentView).offset(20);
        make.size.mas_offset(CGSizeMake(40, 40));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).offset(kSPACING);
        make.top.equalTo(self.iconImgView);
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.right.equalTo(self.contentView).offset(-kSPACING);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(6);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.descLabel.mas_bottom).offset(20);
        make.height.mas_equalTo(1);
    }];
    [self.comImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView);
        make.top.equalTo(self.lineView.mas_bottom).offset(kSPACING);
        make.bottom.equalTo(self.contentView);
    }];
    [self.comCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.comImgView.mas_right).offset(5);
        make.centerY.equalTo(self.comImgView);
        
    }];
    
}

- (UIImageView *)iconImgView
{
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc] init];
        _iconImgView.image = [UIImage imageNamed:@"market_detail_user"];
    }
    return _iconImgView;
}
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel yk_labelWithText:@"周老板" fontSize:14 textColor:[UIColor yk_colorWithHex:0x666666]];
    }
    return _nameLabel;
}
- (UILabel *)descLabel
{
    if (!_descLabel) {
        _descLabel = [UILabel yk_labelWithText:@"丑八怪，咿呀咿呀。。。其实我不在意有很多机会，像巨人一样的无畏" fontSize:12 textColor:[UIColor yk_colorWithHex:0x999999]];
//        _descLabel.numberOfLines = 0;
    }
    return _descLabel;
}
- (UIImageView *)comImgView
{
    if (!_comImgView) {
        _comImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"market_detail_comment_icon"]];
    }
    return _comImgView;
}
- (UILabel *)comCountLabel
{
    if (!_comCountLabel) {
        _comCountLabel = [UILabel yk_labelWithText:@"评论（888条）" fontSize:14 textColor:[UIColor yk_colorWithHex:0x999999]];
    }
    return _comCountLabel;
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
