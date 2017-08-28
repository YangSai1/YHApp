//
//  SHTouDanMoreMoneySubViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHTouDanMoreMoneySubViewController.h"
#import "SHMinePointsTableViewCell.h"

@interface SHTouDanMoreMoneySubViewController () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSArray *dataList;

@end

@implementation SHTouDanMoreMoneySubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"履约金交易记录";
    [self initView];
    [self initData];
    // Do any additional setup after loading the view.
}

- (void)initView
{
    [self.view addSubview:self.tableView];
}

- (void)initData
{
    _dataList = @[@"1",@"2",@"3"];
    
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHMinePointsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineMorePointsCell"];
    if (!cell) {
        cell = [[SHMinePointsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MineMorePointsCell"];
    }
    [cell text];
    return cell;
}
#pragma mark - init view
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, kScreenWidth, kScreenHeight - 10) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = YES;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = gray_f3f3f3;
        _tableView.rowHeight = zScaleH(53);
    }
    return _tableView;
    
}

@end
