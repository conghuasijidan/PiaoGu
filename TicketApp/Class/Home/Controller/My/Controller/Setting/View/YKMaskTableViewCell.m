//
//  YKMaskTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/12.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKMaskTableViewCell.h"

@interface YKMaskTableViewCell ()
@property(nonatomic,weak)UIImageView *checkImageView;

@end

@implementation YKMaskTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - 搭建界面
- (void)setupUI{
    
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.font = [UIFont systemFontOfSize:14];
    titleLab.textColor = [UIColor yk_colorWithHex:0x000000];
    titleLab.text = @"消息设置";
    [self.contentView addSubview:titleLab];
    self.titleLab = titleLab;
    
    UIImageView *checkImageView = [[UIImageView alloc] init];
    checkImageView.image = [UIImage imageNamed:@"setting_mask_check"];
    [checkImageView setHidden:YES];
    [self.contentView addSubview:checkImageView];
    self.checkImageView = checkImageView;
    
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kSPACING+5);
        make.centerY.equalTo(self.contentView);
    }];
    
    [checkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-kSPACING);
        make.centerY.equalTo(self.contentView);
//        make.size.mas_equalTo(CGSizeMake(8, 14));
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor yk_colorWithHex:0xe5e5e5];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
    
}

- (void)setSelectedState:(BOOL)selectedState
{
    if (selectedState == YES) {
        _selectedState = selectedState;
        self.titleLab.textColor = [UIColor redColor];
        [self.checkImageView setHidden:NO];
    }
    else{
        self.titleLab.textColor = [UIColor yk_colorWithHex:0x333333];
        [self.checkImageView setHidden:YES];

    }
    
}
@end
