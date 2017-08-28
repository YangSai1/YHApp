//
//  SHForgetPasswordViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/21.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHForgetPasswordViewController.h"
#import "JBCountdownAsBtnView.h"
#import "SHForgetPasswordSubViewController.h"

@interface SHForgetPasswordViewController ()

@property(nonatomic, strong) UITextField *iphoneTextF;

@property(nonatomic, strong) UITextField *codeTextF;

@property(nonatomic, strong) JBCountdownAsBtnView *countdownBtnView;

@end

@implementation SHForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"忘记密码";
    
    [self initView];
    [self initData];
    
    // Do any additional setup after loading the view.
}

- (void)initView
{
    UILabel *tipLb = [UILabel labelWithFont:font_15 textColor:Color_666666 numberOfLines:0 textAlignment:NSTextAlignmentLeft];
    tipLb.text = @"请填写你注册时使用的手机号";
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = white_ffffff;
    
    _iphoneTextF = [[UITextField alloc] init];
    _iphoneTextF.placeholder = @"请输入手机号";
    _iphoneTextF.textColor = Color_333333;
    _iphoneTextF.font = font_15;
    
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = Color_E5E5E5;
    
    
    _codeTextF = [[UITextField alloc] init];
    _codeTextF.placeholder = @"验证码";
    _codeTextF.textColor = Color_333333;
    _codeTextF.font = font_15;
    
    _countdownBtnView = [[JBCountdownAsBtnView alloc] initWithFrame:CGRectMake(kScreenWidth - 15 - 80, (cellH - 15)/2, 80, 25)];
    _countdownBtnView.backgroundColor = Color(@"157efb");
    [_countdownBtnView setCountdownTouchBlock:^{
        BOOL bResult = YES;
        
        NSLog(@"发送验证码");
        return bResult;
    }];

    UIButton *submitB = [UIButton buttonWithTitle:@"验证"];
    [submitB addActionBlock:^(UIButton *sender) {
        NSLog(@"验证");
        
        SHForgetPasswordSubViewController *subVc = [[SHForgetPasswordSubViewController alloc] init];
        [self.navigationController pushViewController:subVc animated:YES];
    }];
    
    [self.view addSubview:tipLb];
    [self.view addSubview:bgView];
    [bgView addSubview:_iphoneTextF];
    [bgView addSubview:_codeTextF];
    [bgView addSubview:lineView];
    [bgView addSubview:_countdownBtnView];
    [self.view addSubview:submitB];

    __weak typeof(self) weakSelf = self;
    
    [tipLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(zScaleH(10));
        make.left.equalTo(weakSelf.view).offset(zScaleW(20));
    }];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(zScaleW(15));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-15));
        make.top.equalTo(tipLb.mas_bottom).offset(zScaleH(10));
        make.height.equalTo(@(zScaleH(100)));
    }];
    
    [_iphoneTextF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(zScaleW(30));
        make.height.equalTo(@(zScaleH(30)));
        make.right.equalTo(bgView).offset(zScaleW(-30));
        make.centerY.equalTo(bgView).offset(zScaleH(-25));
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView);
        make.right.equalTo(bgView);
        make.centerY.equalTo(bgView);
        make.height.equalTo(@(1.0));
    }];
    
    [_codeTextF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(zScaleW(30));
        make.height.equalTo(@(zScaleH(30)));
        make.right.equalTo(bgView).offset(zScaleW(-30));
        make.centerY.equalTo(bgView).offset(zScaleH(25));
    }];

    [_countdownBtnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(zScaleW(80)));
        make.height.equalTo(@(zScaleH(25)));
        make.centerY.equalTo(weakSelf.codeTextF);
        make.right.equalTo(weakSelf.codeTextF);
    }];
    
    [submitB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(zScaleW(20));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-20));
        make.top.equalTo(bgView.mas_bottom).offset(zScaleH(35));
    }];
}

- (void)initData
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
