//
//  SHSettingViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/21.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHSettingViewController.h"
#import "SHMineImageLableView.h"
#import "SHChangePasswordViewController.h"
#import "SHMineInfoViewController.h"

@interface SHSettingViewController ()

@end

@implementation SHSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"设置";
    [self initView];
    // Do any additional setup after loading the view.
}

- (void)initView
{
    __weak typeof(self) weakSelf = self;

    SHMineImageLableView *xiugaiM = [[SHMineImageLableView alloc] init];
    [xiugaiM setImage:@"icon-denglumima-39" text:@"修改密码"];
    [xiugaiM registBlock:^{
        SHChangePasswordViewController *changePassWordVc = [[SHChangePasswordViewController alloc] init];
        [self.navigationController pushViewController:changePassWordVc animated:YES];
    }];
    
    SHMineImageLableView *logoutM = [[SHMineImageLableView alloc] init];
    logoutM.lineView.hidden = YES;
    [logoutM setImage:@"icon-denglumima-39" text:@"退出当前账户"];
    [logoutM registBlock:^{
        
    }];
    
    SHMineImageLableView *mineZiLiao = [[SHMineImageLableView alloc] init];
    [mineZiLiao setImage:@"icon-mincheng-51" text:@"修改个人资料"];
    [mineZiLiao registBlock:^{
        SHMineInfoViewController *mineInfoVc = [[SHMineInfoViewController alloc] init];
        [self.navigationController pushViewController:mineInfoVc animated:YES];
    }];
    
    [self.view addSubview:mineZiLiao];
    [self.view addSubview:xiugaiM];
    [self.view addSubview:logoutM];

    [mineZiLiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(zScaleH(10));
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(50)));
    }];
    
    [xiugaiM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mineZiLiao.mas_bottom);
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(50)));
    }];

    [logoutM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(xiugaiM.mas_bottom);
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(50)));
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
