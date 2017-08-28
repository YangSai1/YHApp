//
//  SHExplainViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHExplainViewController.h"
#import "SHWebView.h"
#import "SHIntellectualPostViewController.h"

@interface SHExplainViewController ()

@end

@implementation SHExplainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    // Do any additional setup after loading the view.
}

- (void)initView
{
    
    __weak typeof(self) weakSelf = self;

    SHWebView *webView = [[SHWebView alloc] initWithFrame:CGRectMake(zScaleW(15), zScaleH(15), kScreenWidth - zScaleW(30), kScreenHeight - zScaleH(15 + 200))];
    webView.requestUrl = @"https://www.baidu.com";
    
    
    UIButton *submitBtn = [UIButton buttonWithTitle:@"立即上传"];
    [submitBtn addActionBlock:^(UIButton *sender) {
        SHIntellectualPostViewController *intellectualPostVc = [[SHIntellectualPostViewController alloc] init];
        [self.navigationController pushViewController:intellectualPostVc animated:YES];
    }];
    [self.view addSubview:webView];
    [self.view addSubview:submitBtn];
    
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(webView.mas_bottom).offset(zScaleH(30));
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
