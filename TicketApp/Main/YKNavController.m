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
#import "YKHomeIncomeViewController.h"
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
    if ([viewController isKindOfClass:[YKHomeIncomeViewController class]]) {
        [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"home_income_nav_bg"] forBarMetrics:UIBarMetricsDefault];
    }else{
    // 设置通用的导航栏背景颜色
    [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar_background_image"] forBarMetrics:UIBarMetricsDefault];
    }
    viewController.navigationController.navigationBar.translucent = NO;
    // 设置导航栏title字体颜色和大小
    viewController.navigationController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:17]};
    
    //设置通用的返回按钮
    
    if (self.viewControllers.count > 1) {
        
        UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(backBarButtonItemAction)];
        backBarButtonItem.image = [[UIImage imageNamed:@"nav_back_leftArrow"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        viewController.navigationItem.leftBarButtonItem = backBarButtonItem;
    }

    
}

- (void)backBarButtonItemAction{
    
    [self popViewControllerAnimated:YES];
}



@end
