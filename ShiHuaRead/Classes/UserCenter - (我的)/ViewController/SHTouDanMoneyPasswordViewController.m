//
//  SHTouDanMoneyPasswordViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHTouDanMoneyPasswordViewController.h"
#import "SHTouDanMoneyPasswordView.h"
#import "SHTouDanMoneyViewController.h"

@interface SHTouDanMoneyPasswordViewController ()


@end

@implementation SHTouDanMoneyPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"开启账户";
    self.navigationController.navigationBar.hidden = NO;
    [self initView];
    
    // Do any additional setup after loading the view.
}

- (void)initView
{
    UIView *topBgView = [[UIView alloc] init];
    topBgView.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLb = [UILabel labelWithFont:font_14 textColor:Color_157efb numberOfLines:1 textAlignment:NSTextAlignmentCenter];
    titleLb.text = @"奖励账户";
    
    UILabel *subTitleLb = [UILabel labelWithFont:font_12 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentCenter];
    subTitleLb.text = @"当前账户未开启,要开启吗?";
    SHTouDanMoneyPasswordView *passwordV = [[SHTouDanMoneyPasswordView alloc] init];
    [passwordV setTitle:@"账户密码" placeholder:@"请输入密码"];
    [passwordV registBlock:^(NSString *title) {

    }];
    
    __weak typeof(self) weakSelf = self;
    SHTouDanMoneyPasswordView *againPasswordV = [[SHTouDanMoneyPasswordView alloc] init];
    [againPasswordV setTitle:@"账户密码确认" placeholder:@"请输入确认密码"];
    [againPasswordV registBlock:^(NSString *title) {
        
    }];

    UIButton *submitBtn = [UIButton buttonWithTitle:@"提交"];
    [submitBtn addActionBlock:^(UIButton *sender) {
        SHTouDanMoneyViewController *touDanMoneyVc = [[SHTouDanMoneyViewController alloc] init];
        [self.navigationController pushViewController:touDanMoneyVc animated:YES];
    }];
     [self.view addSubview:topBgView];
    [topBgView addSubview:titleLb];
    [topBgView addSubview:subTitleLb];
    
    [self.view addSubview:passwordV];
    [self.view addSubview:againPasswordV];
    [self.view addSubview:submitBtn];
    
    [topBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(zScaleH(5));
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(55)));
    }];
    
    [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(topBgView);
        make.top.equalTo(topBgView).offset(zScaleH(8));
    }];
    
    [subTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(topBgView);
        make.top.equalTo(titleLb.mas_bottom);
    }];
    
    [passwordV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topBgView.mas_bottom).offset(zScaleH(20));
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(40)));
    }];
    [againPasswordV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passwordV.mas_bottom).offset(zScaleH(10));
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(40)));
    }];
    
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(againPasswordV.mas_bottom).offset(zScaleH(30));
        make.left.equalTo(weakSelf.view).offset(zScaleW(60));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-60));
        make.height.equalTo(@(zScaleH(44)));
    }];



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
