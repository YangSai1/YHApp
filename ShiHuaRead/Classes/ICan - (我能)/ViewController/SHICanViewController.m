//
//  SHICanViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/9.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHICanViewController.h"
#import "WoNengTableViewCell.h"
#import "SHWoNengXiangqingController.h"
#import "DOPDropDownMenu.h"
@interface SHICanViewController ()<UITableViewDelegate,UITableViewDataSource,DOPDropDownMenuDataSource,DOPDropDownMenuDelegate>
@property(nonatomic,strong)UITableView * HomeTableView;
@property (nonatomic, strong) NSArray *sorts;

@property(nonatomic, strong) NSArray *category;

@property(nonatomic, strong) NSArray *quyus;

@property (nonatomic, weak) DOPDropDownMenu *menu;
@end

@implementation SHICanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self initData];
    [self initView];
    [self setUpHomeTable];
}
-(void)setUpHomeTable{
    UITableView * homeTable = [[UITableView alloc]init];
    homeTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    homeTable.dataSource = self;
    homeTable.delegate = self;
    homeTable.frame = CGRectMake(0, 108, kScreenWidth, kScreenHeight - 159);
    self.HomeTableView = homeTable;
    [self.view addSubview:homeTable];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 137;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WoNengTableViewCell * wonengCell = [tableView dequeueReusableCellWithIdentifier:@"woneng"];
    if (wonengCell == nil) {
        wonengCell = [WoNengTableViewCell WoNengTableViewCell];
    }
    wonengCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return wonengCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SHWoNengXiangqingController * xiangqingVC = [[SHWoNengXiangqingController alloc]init];
    [self.navigationController pushViewController:xiangqingVC animated:YES];
}
- (void)initData
{
    _sorts = @[@"默认排序",@"离我最近",@"好评优先",@"人气优先",@"最新发布"];
    _category = @[@"全部分类",@"人才",@"物品",@"机构",@"服务"];
    _quyus = @[@"全部分类",@"人才",@"物品",@"机构",@"服务"];

}

- (void)initView
{
    // 添加下拉菜单
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:44];
    menu.delegate = self;
    menu.dataSource = self;
    
    [self.view addSubview:menu];
    _menu = menu;
    
}
- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
    return 3;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
    if (column == 0) {
        return self.category.count;
    }else if(column == 1){
        return self.sorts.count;
    }else{
        return self.quyus.count;
    }
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        return self.category[indexPath.row];
    }else if(indexPath.column == 1){
        return self.sorts[indexPath.row];
    }else{
        return self.sorts[indexPath.row];
    }
}


// new datasource


- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfItemsInRow:(NSInteger)row column:(NSInteger)column
{
    return 0;
}

/**
 *  返回 menu 标题image
 */
- (NSString *)menu:(DOPDropDownMenu *)menu imageNumberOfRowsInColumn:(NSInteger)column
{
    return @"icon-wode-44";
    
}

/**
 *  返回 menu 标题选中image
 */
- (NSString *)menu:(DOPDropDownMenu *)menu imageSelectNumberOfRowsInColumn:(NSInteger)column
{
    if (column == 0) {
        return @"icon-fenlei-34";
    }else{
        return @"icon-paixu-33";
    }
    
}

- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath
{
    NSLog(@"点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
    
}
@end
