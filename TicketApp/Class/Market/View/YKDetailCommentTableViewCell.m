//
//  YKDetailCommentTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/20.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKDetailCommentTableViewCell.h"

@interface YKDetailCommentTableViewCell ()
@property(nonatomic,strong)UIImageView *iconImgView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *dateLabel;
@property(nonatomic,strong)UIButton *praiseButton;
@property(nonatomic,strong)UILabel *contenLabel;
@property(nonatomic,strong)UIButton *replyButton;
@property(nonatomic,strong)UIView *lineView;


@end
@implementation YKDetailCommentTableViewCell

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
    [self.contentView addSubview:self.dateLabel];
    [self.contentView addSubview:self.praiseButton];
    [self.contentView addSubview:self.contenLabel];
    [self.contentView  addSubview:self.replyButton];
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.lineView];

    
    
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kSPACING);
        make.top.equalTo(self.contentView).offset(2*kSPACING);
        make.size.mas_offset(CGSizeMake(30, 30));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).offset(6);
        make.top.equalTo(self.iconImgView);
    }];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(6);
        make.bottom.equalTo(self.nameLabel);
    }];
    
    [self.praiseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-kSPACING);
        make.bottom.equalTo(self.nameLabel.mas_bottom);
    }];
    [self.contenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(6);
        make.right.equalTo(self.contentView).offset(-kSPACING);
    }];
    [self.replyButton sizeToFit];
    [self.replyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.praiseButton);
        make.top.equalTo(self.contenLabel.mas_bottom);
        make.bottom.equalTo(self.contentView).offset(-kSPACING);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        
        make.height.mas_equalTo(1);
    }];
}
- (UIImageView *)iconImgView
{
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"market_detail_comment_icon_placeholder"]];
    }
    return _iconImgView;
}
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel yk_labelWithText:@"闪电侠" fontSize:12 textColor:[UIColor yk_colorWithHex:0x666666]];
    }
    return _nameLabel;
}
- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [UILabel yk_labelWithText:@"一天前" fontSize:10 textColor:[UIColor yk_colorWithHex:0x999999]];
    }
    return _dateLabel;
}
- (UILabel *)contenLabel
{
    if (!_contenLabel) {
        _contenLabel = [UILabel yk_labelWithText:@"那就这样吧，再爱都曲终人散了。那就分手吧，再爱都无需挣扎。" fontSize:12 textColor:[UIColor yk_colorWithHex:0x333333]];
    }
    return _contenLabel;
}
- (UIButton *)praiseButton
{
    if (!_praiseButton) {
        _praiseButton = [[UIButton alloc] init];
        [_praiseButton setImage:[UIImage imageNamed:@"market_detail_comment_praise_normal"] forState:UIControlStateNormal];
         [_praiseButton setImage:[UIImage imageNamed:@"market_detail_comment_praise_selected"] forState:UIControlStateSelected];
        [_praiseButton setTitle:@"2" forState:UIControlStateNormal];
        _praiseButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_praiseButton setTitleColor:[UIColor yk_colorWithHex:0x999999] forState:UIControlStateNormal];
        [_praiseButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    }
    return _praiseButton;
}
- (UIButton *)replyButton
{
    if (!_replyButton) {
        _replyButton = [[UIButton alloc] init];
        [_replyButton setTitle:@"回复" forState:UIControlStateNormal];
        _replyButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_replyButton setTitleColor:[UIColor yk_colorWithHex:0x999999] forState:UIControlStateNormal];
        
    }
    return _replyButton;
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
