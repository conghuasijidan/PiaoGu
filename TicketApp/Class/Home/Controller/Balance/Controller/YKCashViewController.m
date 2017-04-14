//
//  YKCashViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/13.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKCashViewController.h"

@interface YKCashViewController ()<UITextFieldDelegate>
@property(nonatomic,weak)UITextField *cashTextField;
@property(nonatomic,weak)UIButton *nextButton;
@property(nonatomic,weak)UIButton *selectedButton;
@property(nonatomic,weak)UILabel *costLabel;
@property(nonatomic,weak)UIButton *getMoneyButton;


@end

@implementation YKCashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"零钱提现";
    [self setupUI];
 }
#pragma mark - 搭建界面
- (void)setupUI{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tableView];
    CGFloat height = self.view.bounds.size.height - 64;
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen yk_screenWidth], height)];
    headerView.backgroundColor = [UIColor whiteColor];
    tableView.tableHeaderView = headerView;
    tableView.tableFooterView = [[UIView alloc] init];
    
    UIImageView *bgImageView= [[UIImageView alloc] init];
    bgImageView.image = [UIImage imageNamed:@"balance_cash_bg"];
    [headerView addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(headerView).offset(kSPACING);
        make.height.mas_equalTo(163);
        make.right.equalTo(headerView).offset(-kSPACING);
    }];
    
    UILabel *descLabel = [UILabel yk_labelWithText:@"提现金额（元）" fontSize:14 textColor: [UIColor yk_colorWithHex:0x666666]];
    [headerView addSubview:descLabel];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgImageView).offset(kSPACING);
        make.top.equalTo(bgImageView).offset(kSPACING*3+6);
        make.width.mas_equalTo(100);
    }];
    UILabel *servMoneyLabel = [UILabel yk_labelWithText:@"收取%0.1服务费" fontSize:10 textColor:[UIColor yk_colorWithHex:0x999999]];
    [headerView addSubview:servMoneyLabel];
    [servMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(descLabel);
        make.top.equalTo(descLabel.mas_bottom).offset(2);
    }];
    
    
    UITextField *cashTextField = [[UITextField alloc] init];
    cashTextField.placeholder = @"请输入提现金额";
    cashTextField.font = [UIFont systemFontOfSize:36];
    cashTextField.textColor = [UIColor yk_colorWithHex:0x333333];
    [cashTextField setValue:[UIColor yk_colorWithHex:0x999999]forKeyPath:@"_placeholderLabel.textColor"];
    [cashTextField setValue:[UIFont boldSystemFontOfSize:12]forKeyPath:@"_placeholderLabel.font"];
    cashTextField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    NSMutableParagraphStyle *style = [cashTextField.defaultTextAttributes[NSParagraphStyleAttributeName] mutableCopy];
    style.minimumLineHeight = cashTextField.font.lineHeight - (cashTextField.font.lineHeight - [UIFont systemFontOfSize:12].lineHeight) / 2.0;
    cashTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入提现金额" attributes:@{NSForegroundColorAttributeName: [UIColor yk_colorWithHex:0x999999],NSParagraphStyleAttributeName : style}];
    cashTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    cashTextField.keyboardType = UIKeyboardTypeNumberPad;
    [cashTextField addTarget:self action:@selector(textfieldEditChangeAction) forControlEvents:UIControlEventEditingChanged];
    cashTextField.delegate = self;
    [headerView addSubview:cashTextField];
    self.cashTextField = cashTextField;
    [cashTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(descLabel.mas_right);
        make.top.equalTo(descLabel).offset(-5);
        make.right.equalTo(headerView).offset(-kSPACING);
    }];
    
    UIView *separatelineView = [[UIView alloc] init];
    separatelineView.backgroundColor = [UIColor yk_colorWithHex:0x999999];
    separatelineView.alpha = 0.2;
    [headerView addSubview:separatelineView];
    [separatelineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgImageView).offset(2);
        make.right.equalTo(bgImageView).offset(-5);
        make.top.equalTo(servMoneyLabel.mas_bottom).offset(36);
        make.height.mas_equalTo(1);
    }];
//  收取的手续费
    //model 里面的余额
    NSString *numStr = [NSString stringWithFormat:@"可用余额%.2f元",2384.88];
    UILabel *costLabel = [UILabel yk_labelWithText:numStr fontSize:12 textColor:[UIColor yk_colorWithHex:0x999999]];
    [headerView addSubview:costLabel];
    self.costLabel = costLabel;
    [costLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgImageView).offset(kSPACING);
        make.top.equalTo(separatelineView.mas_bottom).offset(kSPACING*2);
    }];
    // 全部体现按钮
    UIButton *getMoneyBtn = [[UIButton alloc] init];
    [getMoneyBtn setTitle:@"全部提现" forState:UIControlStateNormal];
    [getMoneyBtn setTitleColor:[UIColor yk_colorWithHex:0xf75e6f] forState:UIControlStateNormal];
    [getMoneyBtn addTarget:self action:@selector(getAllMoneyAction) forControlEvents:UIControlEventTouchUpInside];
    getMoneyBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [getMoneyBtn setHidden:NO];
    [headerView addSubview:getMoneyBtn];
    self.getMoneyButton = getMoneyBtn;
    [getMoneyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(bgImageView).offset(-kSPACING);
        make.centerY.equalTo(costLabel);
    }];
    
    
    UILabel *typeLabel = [UILabel yk_labelWithText:@"提现方式" fontSize:14 textColor:[UIColor yk_colorWithHex:0x999999]];
    [headerView addSubview:typeLabel];
    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView);
        make.top.equalTo(bgImageView.mas_bottom).offset(kSPACING*2);
    }];
    UIView *leftline = [[UIView alloc] init];
    leftline.backgroundColor = [UIColor yk_colorWithHex:0x979797];
    leftline.alpha = 0.3;
    [headerView addSubview:leftline];
    [leftline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(typeLabel.mas_left).offset(-kSPACING*0.5);
        make.width.mas_equalTo(12);
        make.height.mas_equalTo(1);
        make.centerY.equalTo(typeLabel);
    }];
    UIView *rightline = [[UIView alloc] init];
    rightline.backgroundColor = [UIColor yk_colorWithHex:0x979797];
    rightline.alpha = 0.3;
    [headerView addSubview:rightline];
    [rightline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(typeLabel.mas_right).offset(kSPACING*0.5);
        make.width.mas_equalTo(12);
        make.height.mas_equalTo(1);
        make.centerY.equalTo(typeLabel);
    }];
    
    UIButton *weiXinBtn = [[UIButton alloc] init];
    [weiXinBtn setImage:[UIImage imageNamed:@"balance_weixin_normal"] forState:UIControlStateNormal];
    [weiXinBtn setImage:[UIImage imageNamed:@"balance_weixin_selected"] forState:UIControlStateSelected];
    [weiXinBtn addTarget:self action:@selector(weiXinBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:weiXinBtn];
    
    UIButton *alipayBtn = [[UIButton alloc] init];
    [alipayBtn setImage:[UIImage imageNamed:@"balance_alipay_normal"] forState:UIControlStateNormal];
    [alipayBtn setImage:[UIImage imageNamed:@"balance_alipay_selected"] forState:UIControlStateSelected];
    [alipayBtn addTarget:self action:@selector(alipayBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:alipayBtn];
    
    [weiXinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(headerView.mas_centerX).offset(-kSPACING*2);
        make.top.equalTo(typeLabel.mas_bottom).offset(kSPACING*2);
        //测出大小
        make.size.mas_equalTo(CGSizeMake(75, 75));
    }];
    [alipayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView.mas_centerX).offset(kSPACING*2);
        make.top.equalTo(typeLabel.mas_bottom).offset(kSPACING*2);
        make.size.mas_equalTo(CGSizeMake(75, 75));
    }];
    
    
    UILabel *weixinLabel = [UILabel yk_labelWithText:@"微信" fontSize:12 textColor:[UIColor yk_colorWithHex:0x999999]];
    [headerView addSubview:weixinLabel];
    [weixinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weiXinBtn.mas_bottom).offset(kSPACING);
        make.centerX.equalTo(weiXinBtn);
    }];
    UILabel *alipayLabel = [UILabel yk_labelWithText:@"支付宝" fontSize:12 textColor:[UIColor yk_colorWithHex:0x999999]];
    [headerView addSubview:alipayLabel];
    [alipayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(alipayBtn.mas_bottom).offset(kSPACING);
        make.centerX.equalTo(alipayBtn);
    }];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchesBeganAction)];
    [headerView addGestureRecognizer:tapRecognizer];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    // 可以尝试给个动画效果
    UIButton *nextBtn = [[UIButton alloc] init];
    [nextBtn setImage:[UIImage imageNamed:@"balance_cash_btn"] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextBtnAction) forControlEvents:UIControlEventTouchUpInside];
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    [window addSubview:nextBtn];
    self.nextButton = nextBtn;
    [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(window);
        make.bottom.equalTo(window);
    }];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [self.nextButton removeFromSuperview];
}
#pragma mark - textfield 的代理方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self.cashTextField resignFirstResponder];
    //返回一个BOOL值，指明是否允许在按下回车键时结束编辑
    return YES;
}

- (void)textfieldEditChangeAction{
    
    YKLog(@"textField 变化");
    if (self.cashTextField.text.length > 0) {
        float cost = [self.cashTextField.text floatValue]*0.001;
        self.costLabel.text = [NSString stringWithFormat:@"扣除手续费%.2f元",cost];
        [self.getMoneyButton setHidden:YES];
    }else
    {
        self.costLabel.text = [NSString stringWithFormat:@"可用余额%.2f元",2384.88];
        [self.getMoneyButton setHidden:NO];
    }
    
    if (self.cashTextField.text.length > 6) {
        self.cashTextField.text = [self.cashTextField.text substringToIndex:6];
    }
    
}
#pragma mark - 微信 支付宝Action

- (void)weiXinBtnAction:(UIButton *)button
{
    [self.cashTextField resignFirstResponder];
    self.selectedButton.selected = NO;
    self.selectedButton = button;
    self.selectedButton.selected = YES;
    self.selectedButton.tag = 10;
}
- (void)alipayBtnAction:(UIButton *)button{
    [self.cashTextField resignFirstResponder];
    self.selectedButton.selected = NO;
    self.selectedButton = button;
    self.selectedButton.selected = YES;
    self.selectedButton.tag = 20;
}
// 手势
- (void)touchesBeganAction
{
    [self.cashTextField resignFirstResponder];
}
// 提现按钮事件
- (void)nextBtnAction{
    if (self.selectedButton.tag == 10) {
        YKLog(@"使用微信方式提现")
    }else if (self.selectedButton.tag == 20){
        YKLog(@"使用支付宝方式提现");
    }
    
}
// 余额全部体现按钮
- (void)getAllMoneyAction{
    YKLog(@"余额全部提现");
    // 把余额赋值给文本框
    self.cashTextField.text = @"2384.88";
}

@end
