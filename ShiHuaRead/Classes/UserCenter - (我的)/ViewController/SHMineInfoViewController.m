//
//  SHMineInfoViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/21.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMineInfoViewController.h"
#import "SHMineTitleLableView.h"

@interface SHMineInfoViewController ()

@end

@implementation SHMineInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"信息设置";
    [self initView];
    // Do any additional setup after loading the view.
}

- (void)initView
{
    __weak typeof(self) weakSelf = self;
    SHMineTitleLableView *iconV = [[SHMineTitleLableView alloc] init];
    [iconV registBlock:^(NSString *title) {
        
    }];
    [iconV setTitle:@"头像" placeholder:nil];
    UIButton *iconBtn = [[UIButton alloc]init];
    [iconBtn setImage:[UIImage imageNamed:@"icon-180"] forState:UIControlStateNormal];
    [iconBtn addActionBlock:^(UIButton *sender) {
       // 选择图片
        NSLog(@"选择头像");
    }];
    
    SHMineTitleLableView *nameV = [[SHMineTitleLableView alloc] init];
    [nameV registBlock:^(NSString *title) {
        
    }];
    [nameV setTitle:@"名称" placeholder:@"请输入名字"];

    SHMineTitleLableView *minminName = [[SHMineTitleLableView alloc] init];
    [minminName registBlock:^(NSString *title) {
        
    }];
    [minminName setTitle:@"汩汩号" placeholder:@"1234444"];

    SHMineTitleLableView *sexV = [[SHMineTitleLableView alloc] init];
    [sexV registBlock:^(NSString *title) {
        
    }];
    [sexV setTitle:@"性别" placeholder:@"nan"];

    SHMineTitleLableView *aihaoV = [[SHMineTitleLableView alloc] init];
    [aihaoV registBlock:^(NSString *title) {
        
    }];
    [aihaoV setTitle:@"爱好" placeholder:@"请输入您的爱好"];

    UIButton *submit = [UIButton buttonWithTitle:@"确定"];
    [submit addActionBlock:^(UIButton *sender) {
        
    }];
    
    [self.view addSubview:iconV];
    [iconV addSubview:iconBtn];
    [self.view addSubview:nameV];
    [self.view addSubview:minminName];
    [self.view addSubview:sexV];
    [self.view addSubview:aihaoV];
    [self.view addSubview:submit];
    [iconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view).offset(zScaleH(10));
        make.height.equalTo(@(zScaleH(50)));
    }];
    
    [iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconV.lineView).offset(zScaleW(90));
        make.height.width.equalTo(@(zScaleH(30)));
        make.centerY.equalTo(iconV);

    }];
    
    [nameV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(iconV.mas_bottom);
        make.height.equalTo(@(zScaleH(50)));
    }];
    
    [minminName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(nameV.mas_bottom);
        make.height.equalTo(@(zScaleH(50)));
    }];
    
    [sexV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(minminName.mas_bottom);
        make.height.equalTo(@(zScaleH(50)));
    }];
    
    [aihaoV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(sexV.mas_bottom);
        make.height.equalTo(@(zScaleH(50)));
    }];
    
    [submit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(aihaoV.mas_bottom).offset(zScaleH(50));
        make.left.equalTo(weakSelf.view).offset(zScaleW(30));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-30));
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
