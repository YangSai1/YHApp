//
//  SHRechargeablePayStypeViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHRechargeablePayStypeViewController.h"
#import "SHMoneyPayStyleView.h"
#import "SHRechargeableRecordViewController.h"

typedef NS_ENUM(NSUInteger, PayStyle) {
    PayStyleAli,
    PayStyleWeiXin
};

@interface SHRechargeablePayStypeViewController () <UITextFieldDelegate>

@property(nonatomic, assign) PayStyle payStyle;

@property(nonatomic, strong) UIButton *payStyleAliBtn;

@property(nonatomic, strong) UIButton *payStyleWeinxinBtn;
@end

@implementation SHRechargeablePayStypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"充值方式";
    [self initView];
    [self initData];
    // Do any additional setup after loading the view.
}

- (void)initView
{
    __weak typeof(self) weakSelf = self;
    
    UIBarButtonItem *rightBarItem = [UIBarButtonItem barButtonItemWithTitle:@"充值记录" selectedTitle:@"充值记录" target:self action:@selector(rightBtn)];
    self.navigationItem.rightBarButtonItem = rightBarItem;

    
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor whiteColor];
    
    UILabel *moneyTitleLb = [UILabel labelWithFont:font_16 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    moneyTitleLb.text = @"金额(¥):";
    
    UITextField *numF = [[UITextField alloc] init];
    numF.delegate = self;
    numF.placeholder = @"请输入充值金额";
    numF.font = font_13;
    numF.textColor = Color_252525;
    numF.keyboardType = UIKeyboardTypeNumberPad;

    
    
    UILabel *titleLb = [UILabel labelWithFont:font_15 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    titleLb.text = @"   支付方式";
    titleLb.backgroundColor = [UIColor whiteColor];
    
    UIView *firstLine = [[UIView alloc] init];
    firstLine.backgroundColor = Color_E5E5E5;
    
    SHMoneyPayStyleView *aliPayView = [[SHMoneyPayStyleView alloc] init];
    _payStyleAliBtn = aliPayView.rightBtn;
    [_payStyleAliBtn addActionBlock:^(UIButton *sender) {
        [weakSelf changPayStyle:PayStyleAli];
    }];

    [aliPayView setTitle:@"支付宝支付" withImage:@"充值-支付宝"];
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = Color_E5E5E5;
    
    SHMoneyPayStyleView *weiXinPayView = [[SHMoneyPayStyleView alloc] init];
    _payStyleWeinxinBtn = weiXinPayView.rightBtn;
    [_payStyleWeinxinBtn addActionBlock:^(UIButton *sender) {
        [weakSelf changPayStyle:PayStyleWeiXin];

    }];
    [weiXinPayView setTitle:@"微信支付" withImage:@"充值-微信"];
    UIButton *submitBtn = [UIButton buttonWithTitle:@"确认充值"];
    
    [submitBtn addActionBlock:^(UIButton *sender) {
        NSLog(@"%lu",(unsigned long)_payStyle);
    }];
    
    [self.view addSubview:bgView];
    [bgView addSubview:moneyTitleLb];
    [bgView addSubview:numF];

    
    [self.view addSubview:titleLb];
    [self.view addSubview:firstLine];
    [self.view addSubview:aliPayView];
    [self.view addSubview:weiXinPayView];
    [self.view addSubview:submitBtn];
    [self.view addSubview:lineView];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(60)));
    }];
    
    [moneyTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(zScaleW(15));
        make.centerY.equalTo(bgView);
    }];
    
    [numF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(moneyTitleLb.mas_right).offset(zScaleW(5));
        make.centerY.equalTo(bgView);
        make.height.equalTo(@(zScaleH(20)));
        make.width.equalTo(@(zScaleH(200)));
    }];

    [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(bgView.mas_bottom).offset(zScaleH(20));
        make.height.equalTo(@(zScaleH(40)));
    }];
    
    [firstLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(zScaleW(15));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-15));
        make.top.equalTo(titleLb.mas_bottom);
        make.height.equalTo(@(1));
    }];
    
    [aliPayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(firstLine.mas_bottom);
        make.height.equalTo(@(zScaleH(60)));
    }];

    [weiXinPayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(aliPayView.mas_bottom);
        make.height.equalTo(@(zScaleH(60)));
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(zScaleW(15));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-15));
        make.top.equalTo(aliPayView.mas_bottom);
        make.height.equalTo(@(zScaleH(1)));
    }];

    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(zScaleW(60));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-60));
        make.top.equalTo(weiXinPayView.mas_bottom).offset(zScaleH(100));
        make.height.equalTo(@(zScaleH(44)));
    }];

    
}

- (void)initData
{
    [self changPayStyle:PayStyleAli];
}

- (void)changPayStyle:(PayStyle)payStyle
{
    if (payStyle == PayStyleAli) {
        _payStyleWeinxinBtn.selected = NO;
        _payStyleAliBtn.selected = YES;
        _payStyle = PayStyleAli;
    }else{
        _payStyleWeinxinBtn.selected = YES;
        _payStyleAliBtn.selected = NO;
        _payStyle = PayStyleWeiXin;
    }
}

- (void)rightBtn
{
    SHRechargeableRecordViewController *rechargeableRecordVc = [[SHRechargeableRecordViewController alloc] init];
    [self.navigationController pushViewController:rechargeableRecordVc animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
