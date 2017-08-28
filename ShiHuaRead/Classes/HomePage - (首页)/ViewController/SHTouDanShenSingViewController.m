//
//  SHTouDanShenSingViewController.m
//  qianqu
//
//  Created by 海波的电脑 on 2017/8/9.
//  Copyright © 2017年 海波的电脑. All rights reserved.
//

#import "SHTouDanShenSingViewController.h"
#import "SHShenqingCellOne.h"
#import "SHShenQingCellTwo.h"
#import "SHShenQingCellthree.h"
#import "SHZhiFuViewController.h"

#import "SHBlueLineTextView.h"
#import "SHBlueHeadeViewTextView.h"
#import "SHBlueHeaderImageCheckView.h"

@interface SHTouDanShenSingViewController ()
@property(nonatomic, strong)UIImagePickerController *imagePicker;

@property(nonatomic,strong)UITableView * toudanTable;
@property(nonatomic,strong)UIButton * selectedBtn;
@property(nonatomic,assign)BOOL ischengnuo;


@property(nonatomic,strong)NSString * baojiaStr;
@property(nonatomic,strong)NSString * jingyanStr;
@property(nonatomic,strong)NSString * shuomingStr;
@property(nonatomic,strong)NSString * shoujihaoStr;
@end

@implementation SHTouDanShenSingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ischengnuo = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"投单申请";
    [self initView];
}

- (void)initView
{
    __weak typeof(self) weakSelf = self;

    SHBlueLineTextView *baojiaLineView = [[SHBlueLineTextView alloc] init];
    [baojiaLineView setTitle:@"报价" placeholder:@"请输入你的报价"];
    [baojiaLineView registBlock:^(NSString *text) {
        
    }];
    
    SHBlueHeadeViewTextView *blueTextView = [[SHBlueHeadeViewTextView alloc] init];
    [blueTextView.titleView setTitle:@"我的经验" placeholder:nil];
    blueTextView.textView.placeholder = @"文字内容200字以内";
    blueTextView.textView.font = font_13;
    blueTextView.textView.textDidChangedBlock = ^(NSString *text) {
        NSLog(@"%@",text);
    };
    
    SHBlueHeadeViewTextView *mineJieShaoTextView = [[SHBlueHeadeViewTextView alloc] init];
    [mineJieShaoTextView.titleView setTitle:@"我的说明" placeholder:nil];
    mineJieShaoTextView.textView.placeholder = @"文字内容200字以内";
    mineJieShaoTextView.textView.font = font_13;
    mineJieShaoTextView.textView.textDidChangedBlock = ^(NSString *text) {
        NSLog(@"%@",text);
    };

    SHBlueLineTextView *iphoneV = [[SHBlueLineTextView alloc] init];
    [iphoneV setTitle:@"联系电话" placeholder:@"请输入您的联系电话号码"];
    [iphoneV registBlock:^(NSString *text) {
        
    }];
    
    SHBlueHeaderImageCheckView *imageCheck = [[SHBlueHeaderImageCheckView alloc] initWithContainerVC:self];
    
    UILabel *moneyTipLb = [UILabel labelWithFont:font_12 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    moneyTipLb.text = @"投弹履约金：￥500元";
    
    UIButton * chengnuoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [chengnuoBtn setImage:[UIImage imageNamed:@"icon-38.png"] forState:UIControlStateNormal];
    [chengnuoBtn setImage:[UIImage imageNamed:@"icon-38-38.png"] forState:UIControlStateSelected];
    [chengnuoBtn setTitle:@" 承诺满足发单需求" forState:UIControlStateNormal];
    [chengnuoBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    chengnuoBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    chengnuoBtn.titleLabel.textColor = [UIColor darkGrayColor];
    chengnuoBtn.frame = CGRectMake(0, 30, 170, 18);
    [chengnuoBtn addActionBlock:^(UIButton *sender) {
        sender.selected = !sender.selected;
    }];
    
    UIButton *submitBtn = [UIButton buttonWithTitle:@"提交"];
    [submitBtn addActionBlock:^(UIButton *sender) {
        
        SHZhiFuViewController * zhifuVC = [[SHZhiFuViewController alloc]init];
        [weakSelf.navigationController pushViewController:zhifuVC animated:YES];

    }];
    
    [self.view addSubview:baojiaLineView];
    [self.view addSubview:blueTextView];
    [self.view addSubview:mineJieShaoTextView];
    [self.view addSubview:iphoneV];
    [self.view addSubview:imageCheck];
    [self.view addSubview:moneyTipLb];
    [self.view addSubview:chengnuoBtn];
    [self.view addSubview:submitBtn];
    
    [baojiaLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(44)));
    }];
    
    [blueTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(baojiaLineView.mas_bottom);
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(120)));
    }];
    
    [mineJieShaoTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(blueTextView.mas_bottom);
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(120)));
    }];

    
    [iphoneV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mineJieShaoTextView.mas_bottom);
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(44)));
    }];
    
    [imageCheck mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iphoneV.mas_bottom);
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(130)));
    }];

    [moneyTipLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageCheck.mas_bottom).offset(zScaleH(10));
        make.left.equalTo(weakSelf.view).offset(zScaleW(23));
    }];

    [chengnuoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(moneyTipLb.mas_bottom).offset(zScaleH(10));
        make.left.equalTo(weakSelf.view).offset(zScaleW(13));
    }];
    
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view).offset(zScaleH(-30));
        make.left.equalTo(weakSelf.view).offset(zScaleW(60));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-60));
        make.height.equalTo(@(zScaleH(44)));
    }];

}

@end
