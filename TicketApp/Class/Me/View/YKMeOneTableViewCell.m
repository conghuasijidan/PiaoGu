//
//  YKMeOneTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/11.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKMeOneTableViewCell.h"

@interface YKMeOneTableViewCell ()

@end

@implementation YKMeOneTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
#pragma mark - 搭建界面
- (void)setupUI{
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:@"me_name_placehoder"];
    [self.contentView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kSPACING);
        make.top.equalTo(self.contentView).offset(kSPACING*2);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:18];
    nameLabel.textColor = [UIColor yk_colorWithHex:0x333333];
    nameLabel.text = @"章梦菲";
    [self.contentView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgView.mas_right).offset(kSPACING);
        make.bottom.equalTo(imgView.mas_centerY);
        make.right.equalTo(self.contentView).offset(2*kSPACING);
    }];
    
    UILabel *accountLabel = [[UILabel alloc] init];
    accountLabel.text = @"账号:";
    accountLabel.font = [UIFont systemFontOfSize:12];
    accountLabel.textColor = [UIColor yk_colorWithHex:0x666666];
    [self.contentView addSubview:accountLabel];
    
    [accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel);
        make.width.mas_equalTo(30);
        make.top.equalTo(nameLabel.mas_bottom).offset(kSPACING*0.2);
    }];
    
    UILabel *accountIDLabel = [[UILabel alloc] init];
    accountLabel.textAlignment = NSTextAlignmentLeft;
    accountIDLabel.text = @"192u3973029";
    accountIDLabel.font = [UIFont systemFontOfSize:12];
    accountIDLabel.textColor = [UIColor yk_colorWithHex:0x666666];
    [self.contentView addSubview:accountIDLabel];
    [accountIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(accountLabel.mas_right);
        make.top.equalTo(accountLabel);
        make.right.equalTo(self.contentView).offset(-kSPACING*2);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(kSPACING);
    }];
    
}

@end
