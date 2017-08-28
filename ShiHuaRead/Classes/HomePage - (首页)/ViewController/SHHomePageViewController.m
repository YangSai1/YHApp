//
//  HomePageViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/8.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHHomePageViewController.h"
#import "SHHomePageTableViewCell.h"
#import "SHHomeDetailViewController.h"
#import "SHSeachViewController.h"

#import "DOPDropDownMenu.h"
#import "SHSeachBarView.h"

#import "SHAdvertisementListApiManager.h"
#import "SHAdvertisementReceiveData.h"
@interface SHHomePageViewController ()<UITableViewDelegate,UITableViewDataSource,DOPDropDownMenuDataSource,DOPDropDownMenuDelegate,CTAPIManagerCallBackDelegate,CTAPIManagerParamSource>

@property(nonatomic,strong) UITableView * HomeTableView;

@property(nonatomic, strong) NSArray *sorts;

@property(nonatomic, strong) NSArray *category;

@property(nonatomic, weak) DOPDropDownMenu *menu;

@property(nonatomic, strong) UIView *seachBar;

@property(nonatomic, strong) SHAdvertisementListApiManager *advertisementListApiManager;



@property(nonatomic, strong) NSArray *dataArr;

@end

@implementation SHHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
    [self initNav];
    [self.advertisementListApiManager loadData];

}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}
-(void)setUpHomeTable
{
    UITableView * homeTable = [[UITableView alloc]init];
    homeTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    homeTable.dataSource = self;
    homeTable.delegate = self;
    homeTable.frame = CGRectMake(0, 44, kScreenWidth, kScreenHeight - 159);
    homeTable.rowHeight = zScaleH(141);

    self.HomeTableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        
    }];
    
    self.HomeTableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
        
    }];
    
    self.HomeTableView = homeTable;
    [self.view addSubview:homeTable];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SHHomePageTableViewCell * homeCell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
    if (homeCell == nil) {
        homeCell = [[SHHomePageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeCell"];
    }
    homeCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    AdvertisementList *model = _dataArr[indexPath.row];
    
    homeCell.model  = model;
    return homeCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AdvertisementList *model = _dataArr[indexPath.row];

    
    SHHomeDetailViewController * DeTailVC = [[SHHomeDetailViewController alloc]init];
    
    DeTailVC.model = model;
    
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
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0,0) andHeight:44];
    menu.delegate = self;
    menu.dataSource = self;
    
    [self.view addSubview:menu];
    _menu = menu;
    
    [self setUpHomeTable];

    
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


- (void)rightBtn
{
    
}

- (void)initNav
{
    CGFloat barH = 30;
    _seachBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
    UIImageView *searchView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.seachBar.width, barH)];
    searchView.layer.cornerRadius = 6.0f;
    searchView.image = [UIImage imageNamed:@"icon-shoushuokuang-5453-60"];
    searchView.userInteractionEnabled = YES;
    searchView.clipsToBounds = YES;
    [_seachBar addSubview:searchView];
    
    UIImageView *searchImgView = [[UIImageView alloc] initWithFrame:CGRectMake(8, (barH - 22)/2, 22, 22)];
    searchImgView.userInteractionEnabled = YES;
    
    searchImgView.image = [UIImage imageNamed:@"icon-shoushuo-39"];
    searchImgView.contentMode = UIViewContentModeScaleAspectFit;
    [searchView addSubview:searchImgView];
    
    UIButton *seachBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,searchView.width,barH)];
    [seachBtn setTitle:@"搜索内容" forState:UIControlStateNormal];
    seachBtn.titleLabel.font = font_12;
    [seachBtn addActionBlock:^(UIButton *sender) {
        SHSeachViewController *seachVc = [[SHSeachViewController alloc] init];
        [self.navigationController pushViewController:seachVc animated:YES];

    }];
    [searchView addSubview:seachBtn];

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


#pragma mark - CTAPIManagerParamSource
- (NSDictionary *)paramsForApi:(CTAPIBaseManager *)manager
{
    NSDictionary *params = @{@"phone":@"18937723501",@"validCode":@"1111"};
    
    if (manager == self.advertisementListApiManager) {
        //        params = @{
        //                   kTestAPIManagerParamsKeyLatitude:@(31.228000),
        //                   kTestAPIManagerParamsKeyLongitude:@(121.454290)
        //                   };
        
        [SVProgressHUD showWithStatus:@"数据加载中"];
        
        NSString *userId = [SHUserManager shareManager].userModel.ID;
        params = @{@"userId":userId};
        
    }
    
    return params;
}

#pragma mark - CTAPIManagerCallBackDelegate
- (void)managerCallAPIDidSuccess:(CTAPIBaseManager *)manager
{
    if (manager == self.advertisementListApiManager) {
        
        [SVProgressHUD dismiss];
        NSDictionary *receiveData = [manager fetchDataWithReformer:nil];
        
        NSDictionary *realData = receiveData[@"data"];
        
        NSString *errMessage = receiveData[@"msg"];
        
        if ([receiveData[@"errcode"]integerValue] == 0) {
            
            SHAdvertisementReceiveData *advertisementReceiveData = [SHAdvertisementReceiveData mj_objectWithKeyValues:realData];
            _dataArr = advertisementReceiveData.iData;
            [self.HomeTableView reloadData];
            //            [SVProgressHUD showSuccessWithStatus:@""];
            
            //            [SHUserManager shareManager].userModel = loginReceiveData;
            
            //        self.resultLable.text = @"success";
            
        }else{
            
            [SVProgressHUD showErrorWithStatus:errMessage];
            
        }
        
        
        NSLog(@"%@", [manager fetchDataWithReformer:nil]);
        //        [self layoutResultLable];
    }
}

- (void)managerCallAPIDidFailed:(CTAPIBaseManager *)manager
{
    if (manager == self.advertisementListApiManager) {
        [SVProgressHUD dismiss];

        //        self.resultLable.text = @"fail";
        [SVProgressHUD showErrorWithStatus:@"网络错误"];
        
        //        [self layoutResultLable];
    }
}

#pragma mark - getters and setters
- (SHAdvertisementListApiManager *)advertisementListApiManager
{
    if (_advertisementListApiManager == nil) {
        _advertisementListApiManager = [[SHAdvertisementListApiManager alloc] init];
        _advertisementListApiManager.delegate = self;
        _advertisementListApiManager.paramSource = self;
    }
    return _advertisementListApiManager;
}

@end
