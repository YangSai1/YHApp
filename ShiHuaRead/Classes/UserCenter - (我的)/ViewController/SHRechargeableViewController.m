//
//  SHRechargeableViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHRechargeableViewController.h"
#import "SHRechargeableRecordViewController.h"
#import "SHRechargeablePayStypeViewController.h"

@interface SHRechargeableViewController () <UITextFieldDelegate>

@end

@implementation SHRechargeableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"充值";
    [self initView];

    // Do any additional setup after loading the view.
}

- (void)initView
{
    __weak typeof(self) weakSelf = self;
    
    UIBarButtonItem *rightBarItem = [UIBarButtonItem barButtonItemWithTitle:@"充值记录" selectedTitle:@"充值记录" target:self action:@selector(rightBtn)];
    self.navigationItem.rightBarButtonItem = rightBarItem;

    
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLb = [UILabel labelWithFont:font_15 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    titleLb.text = @"充值金额:";
    
    UITextField *numF = [[UITextField alloc] init];
    numF.delegate = self;
    numF.placeholder = @"请输入充值金额";
    numF.font = font_13;
    numF.textColor = Color_252525;
    numF.keyboardType = UIKeyboardTypeNumberPad;
    
    UIButton *submitBtn = [UIButton buttonWithTitle:@"立即充值"];
    [submitBtn addActionBlock:^(UIButton *sender) {
        SHRechargeablePayStypeViewController *rechargeablePayStypeVc = [[SHRechargeablePayStypeViewController alloc] init];
        [self.navigationController pushViewController:rechargeablePayStypeVc animated:YES];
    }];
    
    [self.view addSubview:bgView];
    [bgView addSubview:titleLb];
    [bgView addSubview:numF];
    
    [self.view addSubview:submitBtn];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(60)));
    }];
    
    [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(zScaleW(15));
        make.centerY.equalTo(bgView);
    }];
    
    [numF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLb.mas_right).offset(zScaleW(5));
        make.centerY.equalTo(bgView);
        make.height.equalTo(@(zScaleH(20)));
        make.width.equalTo(@(zScaleH(200)));
    }];
    
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(zScaleW(60));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-60));
        make.height.equalTo(@(zScaleH(44)));
        make.top.equalTo(bgView.mas_bottom).offset(zScaleH(150));

    }];
    
}

- (void)rightBtn
{
    SHRechargeableRecordViewController *rechargeableRecordVc = [[SHRechargeableRecordViewController alloc] init];
    [self.navigationController pushViewController:rechargeableRecordVc animated:YES];
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
