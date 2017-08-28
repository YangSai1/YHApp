//
//  SHPublishViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/8.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHPublishViewController.h"

#import "SHPulishDetailViewController.h"

#import "SHPublishTableViewCell.h"
#import "DOPDropDownMenu.h"

#import "SHICanListApiManager.h"
#import "SHICanListReceiveData.h"

@interface SHPublishViewController ()<UITableViewDelegate,UITableViewDataSource,DOPDropDownMenuDataSource,DOPDropDownMenuDelegate,CTAPIManagerCallBackDelegate,CTAPIManagerParamSource>

@property(nonatomic, strong) UITableView * tableView;

@property(nonatomic, strong) NSArray *sorts;

@property(nonatomic, strong) NSArray *category;

@property(nonatomic, strong) NSArray *quyus;

@property(nonatomic, weak) DOPDropDownMenu *menu;

@property(nonatomic, strong) SHICanListApiManager *iCanListApiManager;

@property(nonatomic, strong) NSArray *dataArr;

@end

@implementation SHPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.iCanListApiManager loadData];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 158;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHPublishTableViewCell * gongshiCell = [tableView dequeueReusableCellWithIdentifier:@"gongshiCell"];
    
    if (gongshiCell == nil) {
        
        gongshiCell = [[SHPublishTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"gongshiCell"];
        
    }
    
//    SHICanListData *model = _dataArr[indexPath.row];
    [gongshiCell textvoid];
    gongshiCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return gongshiCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SHPulishDetailViewController * pulishDetailVc = [[SHPulishDetailViewController alloc]init];
    
//    SHICanListData *model = _dataArr[indexPath.row];
//    
//    pulishDetailVc.model = model;
    
    [self.navigationController pushViewController:pulishDetailVc animated:YES];
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
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0,0) andHeight:44];
    menu.delegate = self;
    menu.dataSource = self;
    
    [self.view addSubview:menu];
    _menu = menu;
    
    [self.view addSubview:self.tableView];
    
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


#pragma mark - CTAPIManagerParamSource
- (NSDictionary *)paramsForApi:(CTAPIBaseManager *)manager
{
    NSDictionary *params = @{@"phone":@"18937723501",@"validCode":@"1111"};
    
    if (manager == self.iCanListApiManager) {
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
    if (manager == self.iCanListApiManager) {
        [SVProgressHUD dismiss];
        NSDictionary *receiveData = [manager fetchDataWithReformer:nil];
        
        NSDictionary *realData = receiveData[@"data"];
        
        NSString *errMessage = receiveData[@"msg"];
        
        if ([receiveData[@"errcode"]integerValue] == 0) {
            
            SHICanListReceiveData *iCanListReceiveData = [SHICanListReceiveData mj_objectWithKeyValues:realData];
            
            _dataArr = iCanListReceiveData.iData;
            
            [self.tableView reloadData];
            //            [SVProgressHUD showSuccessWithStatus:@"提交成功"];
            
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
    if (manager == self.iCanListApiManager) {
        [SVProgressHUD dismiss];
        
        //        self.resultLable.text = @"fail";
        [SVProgressHUD showErrorWithStatus:@"网络错误"];
        
        //        [self layoutResultLable];
    }
}

#pragma mark - getters and setters
- (SHICanListApiManager *)iCanListApiManager
{
    if (_iCanListApiManager == nil) {
        _iCanListApiManager = [[SHICanListApiManager alloc] init];
        _iCanListApiManager.delegate = self;
        _iCanListApiManager.paramSource = self;
    }
    return _iCanListApiManager;
}


#pragma mark - init view
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth, kScreenHeight - 44) style:UITableViewStylePlain];
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
