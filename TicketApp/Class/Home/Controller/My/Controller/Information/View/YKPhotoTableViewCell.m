//
//  YKPhotoTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/17.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKPhotoTableViewCell.h"

@implementation YKPhotoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self setupUI];
}


#pragma mark - 搭建界面
- (void)setupUI{
    
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    bgView.hidden = YES;
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentView);
        make.height.mas_equalTo(kH(10.0, 60.0));
    }];
//    NSLog(@"%f",kH(10, 60.0));
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.font = [UIFont systemFontOfSize:14];
    titleLab.textColor = [UIColor yk_colorWithHex:0x000000];
    titleLab.text = @"拍照";
    [self.contentView addSubview:titleLab];
    
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-kH(15.0, 50));
//        make.centerY.equalTo(self.contentView);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor yk_colorWithHex:0xe5e5e5];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
    
    titleLab.text = _title;
    if (_isHidden == NO) {
        bgView.hidden = NO;
    }
}

@end
