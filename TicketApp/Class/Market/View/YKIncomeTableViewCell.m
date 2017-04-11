//
//  YKIncomeTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/11.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKIncomeTableViewCell.h"

@interface YKIncomeTableViewCell ()
@property(nonatomic,weak)UIImageView *imgView;
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UILabel *descLable;

@end

@implementation YKIncomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
#pragma mark - 搭建界面
- (void)setupUI{
    self.backgroundColor = [UIColor whiteColor];
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:@"investcell_img_placehoder"];
    [self.contentView addSubview:imgView];
    self.imgView = imgView;
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kSPACING);
        make.top.equalTo(self.contentView).offset(kSPACING*2);
        make.right.equalTo(self.contentView.mas_centerX);
        make.bottom.equalTo(self.contentView).offset(-kSPACING*2);
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"新白鹿餐厅";
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [UIColor blackColor];
    [titleLabel sizeToFit];
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgView.mas_right).offset(kSPACING);
        make.top.equalTo(imgView);
    }];
    
    UILabel *descLabel = [[UILabel alloc] init];
    NSString *textStr = @"杭州知名中餐连锁餐厅，成立于1998年，广受长三角人民喜爱";
    descLabel.font = [UIFont systemFontOfSize:12];
    descLabel.textColor = [UIColor yk_colorWithHex:0x999999];
    descLabel.numberOfLines = 2;
    // 调整行间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:textStr];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:3];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [textStr length])];
    descLabel.attributedText = attributedString;
    [self.contentView addSubview:descLabel];
    self.descLable = descLabel;
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel);
        make.top.equalTo(titleLabel.mas_bottom).offset(kSPACING*0.5);
        make.right.equalTo(self.contentView).offset(-kSPACING);
        make.height.mas_equalTo(34);
    }];
    
    UIButton *detailButton = [[UIButton alloc] init];
    [detailButton setTitle:@"查看详情" forState:UIControlStateNormal];
    detailButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [detailButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIImage *image = [UIImage imageNamed:@"invest_detal_rightArrow"];
    [detailButton addTarget:self action:@selector(detailButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [detailButton setImage:image forState:UIControlStateNormal];
    float labelWidth = 55;
    [detailButton setImageEdgeInsets:UIEdgeInsetsMake(0, labelWidth, 0, -labelWidth)];
    [detailButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -image.size.width, 0, image.size.width)];
    [detailButton sizeToFit];
    
    [self.contentView addSubview:detailButton];
    [detailButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-kSPACING*2);
        make.bottom.equalTo(imgView);
    }];
    
    
}
#pragma mark - 跳转详情页面
- (void)detailButtonAction{
    YKLog(@"跳转详情页面");
    if (self.detailBlock != nil) {
        NSString *model = @"我是model";
        self.detailBlock(model);
    }
    
}



@end
