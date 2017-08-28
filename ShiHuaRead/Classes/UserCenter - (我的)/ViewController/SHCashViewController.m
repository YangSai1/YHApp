//
//  SHCashViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHCashViewController.h"
#import "SHCashMoneyTitleTextFieldView.h"
#import "SHCashRecordViewController.h"

@interface SHCashViewController ()

@end

@implementation SHCashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"申请提现";
    [self initView];
    
    // Do any additional setup after loading the view.
}

- (void)initView
{
    
    UIBarButtonItem *rightBarItem = [UIBarButtonItem barButtonItemWithTitle:@"提现记录" selectedTitle:@"提现记录" target:self action:@selector(rightBtn)];
    self.navigationItem.rightBarButtonItem = rightBarItem;

    
    __weak typeof(self) weakSelf = self;

    SHCashMoneyTitleTextFieldView *cashMoneyV = [[SHCashMoneyTitleTextFieldView alloc] init];
    UILabel *rightLb = [UILabel labelWithFont:font_12 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    rightLb.text = @"元";
    
    [cashMoneyV setTitle:@"提现金额" placeholder:@"请输入提现金额"];
    [cashMoneyV registBlock:^(NSString *title) {
        
    }];
    
    UILabel *tipLb = [UILabel labelWithFont:font_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    tipLb.text = @"   *注意:此处最多可提现500.00元,每次最少提现100.0元";
    
    SHCashMoneyTitleTextFieldView *bankNameV = [[SHCashMoneyTitleTextFieldView alloc] init];
    [bankNameV setTitle:@"开户银行" placeholder:@"请输入开户银行名称"];
    [bankNameV registBlock:^(NSString *title) {
        
    }];
    SHCashMoneyTitleTextFieldView *cashBankNumV = [[SHCashMoneyTitleTextFieldView alloc] init];
    [cashBankNumV setTitle:@"提现账户" placeholder:@"请输入提现账户卡号"];
    [cashBankNumV registBlock:^(NSString *title) {
        
    }];
    SHCashMoneyTitleTextFieldView *bankCardName = [[SHCashMoneyTitleTextFieldView alloc] init];
    [bankCardName setTitle:@"银行卡开户名" placeholder:@"请输入银行卡开户名"];
    [bankCardName registBlock:^(NSString *title) {
        
    }];
    SHCashMoneyTitleTextFieldView *beizhuV = [[SHCashMoneyTitleTextFieldView alloc] init];
    [beizhuV setTitle:@"备注" placeholder:@"请输入相关备注信息"];
    [beizhuV registBlock:^(NSString *title) {
        
    }];
    
    SHCashMoneyTitleTextFieldView *passWordV = [[SHCashMoneyTitleTextFieldView alloc] init];
    [passWordV setTitle:@"交易密码" placeholder:@"请输入交易密码"];
    [passWordV registBlock:^(NSString *title) {
        
    }];

    UIButton *submitBtn = [UIButton buttonWithTitle:@"提现申请"];
    [submitBtn addActionBlock:^(UIButton *sender) {
        
    }];
    
    [self.view addSubview:cashMoneyV];
    [cashMoneyV addSubview:rightLb];
    [self.view addSubview:tipLb];
    [self.view addSubview:bankNameV];
    [self.view addSubview:cashBankNumV];
    [self.view addSubview:bankCardName];
    [self.view addSubview:beizhuV];
    [self.view addSubview:passWordV];
    [self.view addSubview:submitBtn];

    [cashMoneyV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view).offset(zScaleH(10));
        make.height.equalTo(@(zScaleH(44)));
    }];
    
    [rightLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(cashMoneyV).offset(zScaleW(-20));
        make.centerY.equalTo(cashMoneyV);
    }];
    
    [tipLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(weakSelf.view);
        make.top.equalTo(cashMoneyV.mas_bottom);
        make.height.equalTo(@(zScaleH(30)));
    }];
    
    [bankNameV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(weakSelf.view);
        make.top.equalTo(tipLb.mas_bottom);
        make.height.equalTo(@(zScaleH(44)));
    }];
    
    [cashBankNumV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(weakSelf.view);
        make.top.equalTo(bankNameV.mas_bottom).offset(zScaleH(10));
        make.height.equalTo(@(zScaleH(44)));
    }];
    [bankCardName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(weakSelf.view);
        make.top.equalTo(cashBankNumV.mas_bottom).offset(zScaleH(10));
        make.height.equalTo(@(zScaleH(44)));
    }];
    [beizhuV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(weakSelf.view);
        make.top.equalTo(bankCardName.mas_bottom).offset(zScaleH(10));
        make.height.equalTo(@(zScaleH(44)));
    }];
    [passWordV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(weakSelf.view);
        make.top.equalTo(beizhuV.mas_bottom).offset(zScaleH(10));
        make.height.equalTo(@(zScaleH(44)));
    }];
    
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(zScaleH(60));
        make.right.equalTo(weakSelf.view).offset(zScaleH(-60));
        make.top.equalTo(passWordV.mas_bottom).offset(zScaleH(70));
        make.height.equalTo(@(zScaleH(44)));
    }];

}

- (void)rightBtn
{
    SHCashRecordViewController *cashRecordVc = [[SHCashRecordViewController alloc] init];
    [self.navigationController pushViewController:cashRecordVc animated:YES];
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
