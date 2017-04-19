//
//  YKDetailHeaderView.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/19.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKDetailHeaderView.h"
#define yH(h) h/216.0*self.bounds.size.height

@interface YKDetailHeaderView ()
@property(nonatomic,strong)UIImageView *imgView;


@end

@implementation YKDetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
#pragma mark - 搭建界面
- (void)setupUI{
    
    [self addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kW(kSPACING));
        make.right.equalTo(self).offset(-kW(kSPACING));
        make.top.equalTo(self).offset(yH(20));
        make.bottom.equalTo(self);
    }];
}

- (UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        _imgView.image = [UIImage imageNamed:@"detail_adverimage_placehoder"];
    }
    return _imgView;
}

@end
