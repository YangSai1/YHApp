//
//  SHIntellectualPostViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHIntellectualPostViewController.h"
#import "SHImagePickerView.h"
#import "SHEditView.h"

@interface SHIntellectualPostViewController ()

@property(nonatomic, strong) SHImagePickerView *imagePickerView;


@end

@implementation SHIntellectualPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"知识产权上传";
    
    __weak typeof(self) weakSelf = self;

    SHEditView *nameV = [[SHEditView alloc] init];
    [nameV setTitle:@"名称" detailTitle:nil showXing:NO placehoder:@"请输入真实名称"];
    [nameV registBlock:^(NSString *title) {
        NSLog(@"%@",title);
    }];

    SHEditView *realNameV = [[SHEditView alloc] init];
    [realNameV setTitle:@"真实姓名" detailTitle:nil showXing:NO placehoder:@"请输入真实名称"];
    [realNameV registBlock:^(NSString *title) {
        NSLog(@"%@",title);
    }];
    
    SHEditView *shenfenV = [[SHEditView alloc] init];
    [shenfenV setTitle:@"身份证" detailTitle:nil showXing:NO placehoder:@"请输入身份证号"];
    [shenfenV registBlock:^(NSString *title) {
        NSLog(@"%@",title);
    }];

    SHEditView *iphoneV = [[SHEditView alloc] init];
    [iphoneV setTitle:@"电话" detailTitle:nil showXing:YES placehoder:@"请输入电话"];
    [iphoneV registBlock:^(NSString *title) {
        NSLog(@"%@",title);
    }];

    SHEditView *dizhiV = [[SHEditView alloc] init];
    [dizhiV setTitle:@"家庭住址" detailTitle:nil showXing:YES placehoder:@"请输入住址"];
    [dizhiV registBlock:^(NSString *title) {
        NSLog(@"%@",title);
    }];

    SHImagePickerView *imagePickerView = [[SHImagePickerView alloc] initWithContainerVC:self];
    _imagePickerView = imagePickerView;
    
    UIButton *submitBtn = [UIButton buttonWithTitle:@"立即提交"];
    [submitBtn addActionBlock:^(UIButton *sender) {
        NSLog(@"%lu",imagePickerView.selectedPhotos.count);
    }];
    [self.view addSubview:nameV];
    [self.view addSubview:realNameV];
    [self.view addSubview:shenfenV];
    [self.view addSubview:iphoneV];
    [self.view addSubview:dizhiV];
    [self.view addSubview:imagePickerView];
    [self.view addSubview:submitBtn];

    [nameV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(zScaleH(8));
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(44)));
        
    }];
    
    [realNameV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameV.mas_bottom).offset(zScaleH(8));
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(44)));
        
    }];

    [shenfenV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(realNameV.mas_bottom).offset(zScaleH(8));
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(44)));
        
    }];

    [iphoneV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(shenfenV.mas_bottom).offset(zScaleH(8));
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(44)));
        
    }];

    [dizhiV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iphoneV.mas_bottom).offset(zScaleH(8));
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(44)));
        
    }];

    [imagePickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(dizhiV.mas_bottom).offset(zScaleH(30));
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(80)));

    }];
    
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(zScaleH(-30));
        make.left.equalTo(weakSelf.view).offset(zScaleW(60));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-60));
        make.height.equalTo(@(zScaleH(44)));
        
    }];

    // Do any additional setup after loading the view.
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
