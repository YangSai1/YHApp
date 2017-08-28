//
//  SHGongGaoXuanController.m
//  ShiHuaRead
//
//  Created by 海波的电脑 on 2017/8/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHGongGaoXuanController.h"
#import "SHPinLeiTableViewCell.h"
@interface SHGongGaoXuanController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * xuanzeTable;

@property(nonatomic, copy) ChangeTitleBlock block;

@end

@implementation SHGongGaoXuanController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"公告品类选择";
    self.view.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setUpTableView];
}
-(void)setUpTableView{
    UITableView * xuanzeTable = [[UITableView alloc]init];
    xuanzeTable.delegate = self;
    xuanzeTable.dataSource = self;
    xuanzeTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.xuanzeTable = xuanzeTable;
    xuanzeTable.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
    xuanzeTable.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64);
    [self.view addSubview:xuanzeTable];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SHPinLeiTableViewCell * pinleiCell = [[SHPinLeiTableViewCell alloc]init];
    pinleiCell.selectionStyle = UITableViewCellSelectionStyleNone;
    pinleiCell.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
    switch (indexPath.row) {
        case 0:
            pinleiCell.titleArray = @[@"导演",@"制片",@"群演",@"灯光",@"编辑"];
            pinleiCell.titleView.text = @"人才";
            break;
        case 1:
            pinleiCell.titleArray = @[@"古装",@"玩具",@"滑板"];
            pinleiCell.titleView.text = @"物品";
            break;
        case 2:
            pinleiCell.titleArray = @[@"影视公司",@"特效公司",@"租赁公司"];
            pinleiCell.titleView.text = @"机构";
            break;
        case 3:
            pinleiCell.titleArray = @[@"租车",@"盒饭",@"酒店"];
            pinleiCell.titleView.text = @"服务";
            break;

        default:
            break;
    }
    for (int i = 0; i < pinleiCell.buttonView.subviews.count; i ++) {
        UIButton * xuanzeBtn = pinleiCell.buttonView.subviews[i];
        [xuanzeBtn addTarget:self action:@selector(xuanzeTableClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return pinleiCell;
}
//点击选择类型按钮
-(void)xuanzeTableClick:(UIButton *)btn{
    NSString * titleStr = btn.titleLabel.text;
    
    if (_block) {
        _block(titleStr);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)registBlock:(ChangeTitleBlock)block
{
    _block = block;
}
@end
