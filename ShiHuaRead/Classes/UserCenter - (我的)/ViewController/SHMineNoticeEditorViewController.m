//
//  SHMineNoticeEditorViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMineNoticeEditorViewController.h"
#import "SHEditListView.h"
#import "CommonMenuView.h"
#import "SHEditView.h"

@interface SHMineNoticeEditorViewController ()

@property(nonatomic, strong) UIScrollView *scrollview;

@property(nonatomic, strong) UIView *contView;

@property(nonatomic, strong) NSArray *dataArr;

@end

@implementation SHMineNoticeEditorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"公告发布";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
    
    // Do any additional setup after loading the view.
}

- (void)initView
{
    _scrollview = [[UIScrollView alloc] init];
    
    _contView = [[UIView alloc] init];
    
    [_scrollview addSubview:_contView];
    
    [self.view addSubview:_scrollview];
    
    __weak typeof(self) weakSelf = self;
    
    
    [_scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@(zScaleH(10.0f)));
        make.left.right.bottom.equalTo(weakSelf.view);
        
    }];
    
    [_contView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(weakSelf.scrollview);
        make.width.equalTo(weakSelf.scrollview);
        
    }];
    
    CGFloat topMarge = 10;
    CGFloat hight = 44;
    
    SHEditListView *fenleiV = [[SHEditListView alloc] init];
    
    NSDictionary *dict1 = @{@"imageName" : @"icon_button_affirm",
                            @"itemName" : @"撤回"
                            };
    NSDictionary *dict2 = @{@"imageName" : @"icon_button_recall",
                            @"itemName" : @"确认"
                            };
    NSDictionary *dict3 = @{@"imageName" : @"icon_button_record",
                            @"itemName" : @"记录"
                            };
    NSArray *dataArray = @[dict1,dict2,dict3];
    _dataArr = dataArray;
    
    
    //    __weak typeof(self) weakSelf = self;

    
    
    [fenleiV registBlock:^(SHEditListView *view, NSString *title) {
        NSLog(@"%@",title);
    }];
    
    [fenleiV setTitle:@"公告分类" detailTitle:@"请选择公告分类"];
    
    
    
    SHEditListView *leixinV = [[SHEditListView alloc] init];
    [leixinV setTitle:@"公告类型" detailTitle:@"请选择公告类型"];
    
    NSDictionary *dict5 = @{@"imageName" : @"icon_button_affirm",
                            @"itemName" : @"撤回加快"
                            };
    NSDictionary *dict6 = @{@"imageName" : @"icon_button_recall",
                            @"itemName" : @"确认hsas"
                            };
    NSDictionary *dict7 = @{@"imageName" : @"icon_button_record",
                            @"itemName" : @"记录撒了"
                            };
    NSArray *dataArray1 = @[dict5,dict6,dict7];

    [leixinV registBlock:^(SHEditListView *view, NSString *title) {
        NSLog(@"%@",title);
    }];

    leixinV.dataArr = dataArray1;
    
    

    SHEditView *xukezhengV = [[SHEditView alloc] init];
    [xukezhengV setTitle:@"拍摄许可证" detailTitle:nil];
    [xukezhengV registBlock:^(NSString *title) {
       
        NSLog(@"%@",title);
        
    }];
    
    SHEditView *xuqiuV = [[SHEditView alloc] init];
    [xuqiuV setTitle:@"需求标题" detailTitle:@"需求的服务或产品名称"];
    [xuqiuV registBlock:^(NSString *title) {
        
        NSLog(@"%@",title);
        
    }];

    
    
    [_contView addSubview:fenleiV];

    [_contView addSubview:leixinV];

    [_contView addSubview:xukezhengV];

    [fenleiV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contView);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
    }];
    
    [leixinV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fenleiV.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
    }];

    
    [xukezhengV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leixinV.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
        make.bottom.equalTo(weakSelf.contView).offset(-10);
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
