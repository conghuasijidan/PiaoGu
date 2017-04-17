//
//  YKUserTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/17.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKUserTableViewCell.h"

@implementation YKUserTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
#pragma mark - 搭建界面
- (void)setupUI{
    UIImageView *bgImageView = [[UIImageView alloc] init];
    bgImageView.image = [UIImage imageNamed:@"home_user_bg"];
    [self.contentView addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
    }];
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"home_user_icon_placehoder"];
    [iconImageView sizeToFit];
    [self.contentView addSubview:iconImageView];
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kSPACING *2);
        make.top.equalTo(self.contentView).offset(15);
    }];
    UILabel *nameLabel = [UILabel yk_labelWithText:@"火锅英雄" fontSize:14 textColor:[UIColor yk_colorWithHex:0xffffff]];
    [self.contentView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconImageView.mas_right).offset(8);
        make.centerY.equalTo(iconImageView);
    }];
    UIButton *messageButton = [[UIButton alloc] init];
    [messageButton setImage:[UIImage imageNamed:@"home_message_normal"] forState:UIControlStateNormal];
    [messageButton setImage:[UIImage imageNamed:@"home_message_selected"] forState:UIControlStateSelected];
    [messageButton addTarget:self action:@selector(messageButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:messageButton];
//    messageButton
    [messageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-kSPACING*2);
        make.top.equalTo(self.contentView).offset(kSPACING*2);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    lineView.alpha = 0.15;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
    
}

- (void)messageButtonAction{
    YKLog(@"跳转到消息界面");
}

@end
