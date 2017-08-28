//
//  SHMyIntellectualViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMyIntellectualViewController.h"

#import "SHMyTIntellectualCell.h"

@interface SHMyIntellectualViewController () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSArray *dataList;

@end

@implementation SHMyIntellectualViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    SHMyTIntellectualCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cashRecordCell"];
    if (!cell) {
        cell = [[SHMyTIntellectualCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cashRecordCell"];
    }
    cell.model = nil;
    return cell;
}
#pragma mark - init view
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = YES;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = gray_f3f3f3;
        _tableView.rowHeight = zScaleH(75);
    }
    return _tableView;
    
}

@end
