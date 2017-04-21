//
//  YKDetailOneTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/20.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKDetailOneTableViewCell.h"

@interface YKDetailOneTableViewCell ()
@property(nonatomic,strong)UILabel *storeLabel;
@property(nonatomic,strong)UILabel *descLabel;

@end
@implementation YKDetailOneTableViewCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    

}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}
#pragma mark - 搭建界面
- (void)setupUI{
//    self.contentView.backgroundColor = [UIColor orangeColor];
    
    [self.contentView addSubview:self.storeLabel];
    [self.contentView addSubview:self.descLabel];
    
    [self.storeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kW(kSPACING));
        make.top.equalTo(self.contentView).offset(20);
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.storeLabel);
        make.right.equalTo(self.contentView).offset(-kW(kSPACING));
        
        make.top.equalTo(self.storeLabel.mas_bottom).offset(10);
        make.bottom.equalTo(self.contentView).offset(-kSPACING*2);
    }];
    
    
}


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

@end
