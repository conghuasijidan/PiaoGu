//
//  YKHomeInformationViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/12.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKHomeInformationViewController.h"
#import "YKInforTableViewCell.h"
#import "YKNiNameViewController.h"
#import "YKPhotoViewController.h"
@interface YKHomeInformationViewController ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation YKHomeInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"个人信息";
    [self setupUI];
}
#pragma mark - 搭建界面
- (void)setupUI{
    UITableView *inforTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    inforTableView.backgroundColor = [UIColor whiteColor];
    inforTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    inforTableView.dataSource = self;
    inforTableView.delegate = self;
    [inforTableView registerClass:[YKInforTableViewCell class] forCellReuseIdentifier:YKINFORCELL];
    inforTableView.rowHeight = 50;
    [self.view addSubview:inforTableView];
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor whiteColor];
    inforTableView.tableFooterView = bgView;
    inforTableView.contentInset = UIEdgeInsetsMake(kSPACING, 0, 0, 0);
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.mas_equalTo(10);
    }];

    
}

#pragma mark - 设置数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YKInforTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKINFORCELL forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.titleLab.text = @"头像";
        cell.iconImageView.image = [UIImage imageNamed:@"home_infor_placehoder"];
        [cell.iconImageView setHidden:NO];
        [cell.contentLabel setHidden:YES];
    }else if (indexPath.row == 1){
        cell.titleLab.text = @"昵称";
        cell.contentLabel.text = @"未设置";
    }else if (indexPath.row == 2){
        cell.titleLab.text = @"签名";
        if (cell.contentLabel.text == nil) {
        
            cell.contentLabel.text = @"一句话介绍自己";

        }
        else
        {
            cell.contentLabel.text = @"";
        }
    }else if (indexPath.row == 3){
        cell.titleLab.text = @"账户";
        cell.contentLabel.text = @"";
    }

    return cell;
}
#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            YKLog(@"头像修改");
            YKPhotoViewController *vc = [[YKPhotoViewController alloc] init];
            vc.modalPresentationStyle=UIModalPresentationOverCurrentContext;
            [self presentViewController:vc animated:YES completion:nil];
        }
            break;
         case 1:
        { YKLog(@"昵称修改");
            YKNiNameViewController *vc = [[YKNiNameViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
         case 2:
        {  YKLog(@"签名修改");
           
            
        }
            break;
         case 3:
        {
            YKLog(@"账号修改");
        }
            break;
        default:
            break;
    }
    
}


@end
