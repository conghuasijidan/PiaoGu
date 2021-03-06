//
//  YKPhotoViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/17.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKPhotoViewController.h"
#import "YKPhotoTableViewCell.h"
#define kScale (160.0/667.0)


@interface YKPhotoViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation YKPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yk_colorWithHex:0x666666];
    self.view.alpha = 0.5;
    [self setupUI];

}
#pragma mark - 搭建界面
- (void)setupUI{
    float height = [UIScreen yk_screenHeight]-[UIScreen yk_screenHeight]*kScale;
    UITableView *maskTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, height, [UIScreen yk_screenWidth], [UIScreen yk_screenHeight]*kScale) style:UITableViewStylePlain];
    maskTableView.backgroundColor = [UIColor whiteColor];
    maskTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    maskTableView.dataSource = self;
    maskTableView.delegate = self;
    [maskTableView registerClass:[YKPhotoTableViewCell class] forCellReuseIdentifier:YKPHOTOCELL];
    [self.view addSubview:maskTableView];
    maskTableView.tableFooterView = [[UIView alloc] init];
    
}
#pragma mark - 数据源 代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger num = 0;
    switch (section) {
        case 0:
            num = 2;
            break;
        case 1:
            num = 1;
            break;
        default:
            break;
    }
    return num;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YKPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKPHOTOCELL forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.title = @"拍照";
        cell.isHidden = YES;
    }else if (indexPath.section == 0 && indexPath.row == 1){
        cell.title = @"从手机相册中选择";
        cell.isHidden = YES;
    }else if (indexPath.section == 1 && indexPath.row == 0)
    {
        cell.isHidden = NO;
        cell.title = @"取消";
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        YKLog(@"打开相机,设置权限");
    }else if (indexPath.section == 0 && indexPath.row == 1){
        YKLog(@"打开相册，设置权限");
        
    }else if (indexPath.section == 1 && indexPath.row == 0)
    {
         YKLog(@"取消");
         [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 50/160.0*tableView.bounds.size.height;
    }else
    {
        return 60/160.0*tableView.bounds.size.height;
    }
}


@end
