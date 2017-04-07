//
//  YKNavController.m
//  YueShiJia
//
//  Created by 葱花思鸡蛋 on 2017/3/1.
//  Copyright © 2017年 葱花思鸡蛋. All rights reserved.
//

#import "YKNavController.h"

@interface YKNavController ()<UINavigationControllerDelegate>

@end

@implementation YKNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
}
// 先走的是代理方法后走的是各个控制器的viewDidLoad方法
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //设置title为图片
    viewController.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"food+"]];
    
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:@"icon_home_search_index"] forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
    [button setHighlighted:NO];
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];

    
}



- (void)searchAction{
    
//    YKLog(@"搜索按钮被点击了");
    
    
}
@end
