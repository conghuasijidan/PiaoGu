//
//  YKMaskTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/12.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKMaskTableViewCell.h"

@interface YKMaskTableViewCell ()
@property(nonatomic,strong)UIImageView *checkImageView;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UIView *lineView;

@end

@implementation YKMaskTableViewCell


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
    
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.checkImageView];
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kW(15.0));
        make.centerY.equalTo(self.contentView);
    }];
    
    [_checkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-kH(15.0, 50));
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
// 赋值
    self.titleLab.text = _title;
}

- (void)setSelectedState:(BOOL)selectedState
{
    if (selectedState == YES) {
        self.titleLab.textColor = [UIColor redColor];
        [self.checkImageView setHidden:NO];
    }
    else{
        self.titleLab.textColor = [UIColor yk_colorWithHex:0x333333];
        [self.checkImageView setHidden:YES];

    }
}

- (UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.font = [UIFont systemFontOfSize:14];
        _titleLab.textColor = [UIColor yk_colorWithHex:0x000000];
        _titleLab.text = @"消息设置";
    }
    return _titleLab;
}
- (UIImageView *)checkImageView{
    if (!_checkImageView) {
        _checkImageView = [[UIImageView alloc] init];
        _checkImageView.image = [UIImage imageNamed:@"setting_mask_check"];
        [_checkImageView setHidden:YES];
    }
    return _checkImageView;
}
- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor yk_colorWithHex:0xe5e5e5];
    }
    return _lineView;
}
@end
