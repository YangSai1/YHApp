//
//  HomePageViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/8.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHHomePageViewController.h"
#import "HomeTableViewCell.h"
#import "SHHomeDetailViewController.h"
#import "DOPDropDownMenu.h"
#import "SHSeachBarView.h"
@interface SHHomePageViewController ()<UITableViewDelegate,UITableViewDataSource,DOPDropDownMenuDataSource,DOPDropDownMenuDelegate>

@property(nonatomic,strong)UITableView * HomeTableView;

@property (nonatomic, strong) NSArray *sorts;

@property(nonatomic, strong) NSArray *category;

@property (nonatomic, weak) DOPDropDownMenu *menu;

@property(nonatomic, strong) SHSeachBarView *seachBar;

@end

@implementation SHHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setUpHomeTable];
    [self initNav];
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
    return 104;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell * HomeCell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
    if (HomeCell == nil) {
        HomeCell = [HomeTableViewCell HomeTableCell];
    }
    HomeCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
    
    return HomeCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SHHomeDetailViewController * DeTailVC = [[SHHomeDetailViewController alloc]init];
    
    
    [self.navigationController pushViewController:DeTailVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)initData
{
    _sorts = @[@"默认排序",@"离我最近",@"好评优先",@"人气优先",@"最新发布"];
    _category = @[@"全部分类",@"人才",@"物品",@"机构",@"服务"];
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
    return 2;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
    if (column == 0) {
        return self.category.count;
    }else {
        return self.sorts.count;
    }
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        return self.category[indexPath.row];
    }else {
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


- (void)initNav
{
    _seachBar = [[SHSeachBarView alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    
    self.navigationItem.titleView = _seachBar;
    
    UIBarButtonItem *leftBarItem = [UIBarButtonItem barButtonItemWithTitle:@"汩汩" target:nil action:nil];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -5;
    
    UIBarButtonItem *rightBarItem = [UIBarButtonItem barButtonRightItemWithImageName:@"icon-shaixuan-38-37" target:self action:@selector(rightBtn)];
    
    self.navigationItem.leftBarButtonItems = @[leftBarItem];
    
    self.navigationItem.rightBarButtonItems = @[negativeSpacer,rightBarItem];
    
}


@end
