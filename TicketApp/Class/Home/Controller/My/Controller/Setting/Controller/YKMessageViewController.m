//
//  YKMessageViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/17.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKMessageViewController.h"

@interface YKMessageViewController ()

@end

@implementation YKMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"消息设置";
    [self  setupUI];
}
#pragma mark - 搭建界面
- (void)setupUI{
    UISwitch *swit = [[UISwitch alloc] init];
    swit.on = YES;
    [swit addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [swit sizeToFit];
    [self.view addSubview:swit];
    [swit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(kSPACING);
        make.right.equalTo(self.view).offset(-kSPACING);
    }];
    
    UILabel *descLabel = [[UILabel alloc] init];
    descLabel.text = @"接收推送通知";
    descLabel.textColor = [UIColor yk_colorWithHex:0x333333];
    descLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:descLabel];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(kSPACING);
        make.centerY.equalTo(swit);
    }];
    
}
#pragma mark - 消息推送
- (void)switchAction:(UISwitch *)swit{
 
    if ([swit isOn]) {
        YKLog(@"开启消息推送");
    }else{
        YKLog(@"关闭消息推送");
    }
    
    
}


@end
