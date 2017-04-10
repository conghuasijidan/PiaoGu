//
//  YKNavController.m
//  YueShiJia
//
//  Created by 葱花思鸡蛋 on 2017/3/1.
//  Copyright © 2017年 葱花思鸡蛋. All rights reserved.
//

#import "YKNavController.h"
#import "YKHomeViewController.h"
#import "YKMarketViewController.h"
#import "YKMeViewController.h"
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
    //设置每个控制器的title
    if ([viewController isKindOfClass:[YKHomeViewController class]]) {
        viewController.navigationItem.title = @"首页";
//        viewController.navigationItem
        
    }else if ([viewController isKindOfClass:[YKMarketViewController class]])
    {
        viewController.navigationItem.title = @"票谷";
    }else if ([viewController isKindOfClass:[YKMeViewController class]]){
        viewController.navigationItem.title = @"我的门店";
    }
    // 设置通用的导航栏背景颜色
    [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar_background_image"] forBarMetrics:UIBarMetricsDefault];
    viewController.navigationController.navigationBar.translucent = NO;
    viewController.navigationController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:17]};
    
    //设置通用的返回按钮
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(backBarButtonItemAction)];
    
    viewController.navigationItem.backBarButtonItem = backBarButtonItem;
    
}
- (void)backBarButtonItemAction{
    [self popViewControllerAnimated:YES];
}



@end
