//
//  SHSeachViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHSeachViewController.h"
#import "CXSearchSectionModel.h"
#import "CXSearchModel.h"
#import "CXSearchCollectionViewCell.h"
#import "SelectCollectionReusableView.h"
#import "SelectCollectionLayout.h"
#import "CXDBHandle.h"
#import "SHSeachBarView.h"

static NSString *const cxSearchCollectionViewCell = @"CXSearchCollectionViewCell";

static NSString *const headerViewIden = @"HeadViewIden";

@interface SHSeachViewController()<UICollectionViewDataSource,UICollectionViewDelegate,SelectCollectionCellDelegate,UICollectionReusableViewButtonDelegate,UITextFieldDelegate>

/**
 *  存储网络请求的热搜，与本地缓存的历史搜索model数组
 */
@property (nonatomic, strong) NSMutableArray *sectionArray;
/**
 *  存搜索的数组 字典
 */
@property (nonatomic,strong) NSMutableArray *searchArray;

@property (strong, nonatomic)UICollectionView *searchCollectionView;

@property(nonatomic, strong) SHSeachBarView *seachBar;

@property(nonatomic, strong) UITextField *seachTextField;

@end

@implementation SHSeachViewController

-(NSMutableArray *)sectionArray
{
    if (_sectionArray == nil) {
        _sectionArray = [NSMutableArray array];
    }
    return _sectionArray;
}

-(NSMutableArray *)searchArray
{
    if (_searchArray == nil) {
        _searchArray = [NSMutableArray array];
    }
    return _searchArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self prepareData];
    
    [self initNav];
    
    self.searchCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, zScaleH(10), kScreenWidth, kScreenHeight - zScaleH(10)) collectionViewLayout:[[SelectCollectionLayout alloc] init]];
    _searchCollectionView.contentInset = UIEdgeInsetsMake(4, zScaleW(13), 4, zScaleW(13));

    self.searchCollectionView.backgroundColor = [UIColor whiteColor];
    self.searchCollectionView.delegate = self;
    self.searchCollectionView.dataSource = self;
//    [self.searchCollectionView setCollectionViewLayout:[[SelectCollectionLayout alloc] init] animated:YES];
    [self.searchCollectionView registerClass:[SelectCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewIden];
    [self.searchCollectionView registerNib:[UINib nibWithNibName:@"CXSearchCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:cxSearchCollectionViewCell];
    
    [self.view addSubview:_searchCollectionView];
    /***  可以做实时搜索*/
    //    [self.cxSearchTextField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)initNav
{
    _seachBar = [[SHSeachBarView alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
    _seachBar.seachTextField.delegate = self;
    _seachTextField = _seachBar.seachTextField;
    self.navigationItem.titleView = _seachBar;
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -5;
    
    UIBarButtonItem *rightBarItem = [UIBarButtonItem barButtonItemWithTitle:@"取消" selectedTitle:@"取消" target:self action:@selector(cancle)];
    
    self.navigationItem.rightBarButtonItems = @[negativeSpacer,rightBarItem];
    
}

- (void)cancle
{
    [_seachTextField resignFirstResponder];
    
}

- (void)prepareData
{
    
    /***  去数据查看 是否有数据*/
    NSDictionary *parmDict  = @{@"category":@"1"};
    NSDictionary *dbDictionary =  [CXDBHandle statusesWithParams:parmDict];

    NSMutableArray *testArray = [@[] mutableCopy];

    if (dbDictionary.count) {
        [testArray addObject:dbDictionary];
        [self.searchArray addObjectsFromArray:dbDictionary[@"section_content"]];
    }
    
    for (NSDictionary *sectionDict in testArray) {
        CXSearchSectionModel *model = [[CXSearchSectionModel alloc]initWithDictionary:sectionDict];
        [self.sectionArray addObject:model];
    }
    
    [self.searchCollectionView reloadData];


    
//    for (NSDictionary *sectionDict in testArray) {
//        CXSearchSectionModel *model = [[CXSearchSectionModel alloc]initWithDictionary:sectionDict];
//        [self.sectionArray addObject:model];
//    }
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_seachTextField becomeFirstResponder];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    CXSearchSectionModel *sectionModel =  self.sectionArray[section];
    return sectionModel.section_contentArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CXSearchCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cxSearchCollectionViewCell forIndexPath:indexPath];
    CXSearchSectionModel *sectionModel =  self.sectionArray[indexPath.section];
    CXSearchModel *contentModel = sectionModel.section_contentArray[indexPath.row];
    [cell.contentButton setTitle:contentModel.content_name forState:UIControlStateNormal];
    cell.selectDelegate = self;
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.sectionArray.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    if ([kind isEqualToString: UICollectionElementKindSectionHeader]){
        SelectCollectionReusableView* view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerViewIden forIndexPath:indexPath];
        view.delectDelegate = self;
        CXSearchSectionModel *sectionModel =  self.sectionArray[indexPath.section];
        [view setText:sectionModel.section_title];
        /***  此处完全 也可以自定义自己想要的模型对应放入*/
        if(indexPath.section == 0)
        {
            [view setImage:@"cxSearch"];
            view.delectButton.hidden = NO;
        }
//        }else{
//            [view setImage:@"cxSearch"];
//            view.delectButton.hidden = NO;
//        }
        reusableview = view;
    }
    return reusableview;
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CXSearchSectionModel *sectionModel =  self.sectionArray[indexPath.section];
    if (sectionModel.section_contentArray.count > 0) {
        CXSearchModel *contentModel = sectionModel.section_contentArray[indexPath.row];
        return [CXSearchCollectionViewCell getSizeWithText:contentModel.content_name];
    }
    return CGSizeMake(80, 24);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

#pragma mark - SelectCollectionCellDelegate
- (void)selectButttonClick:(CXSearchCollectionViewCell *)cell;
{
    NSIndexPath* indexPath = [self.searchCollectionView indexPathForCell:cell];
    CXSearchSectionModel *sectionModel =  self.sectionArray[indexPath.section];
    CXSearchModel *contentModel = sectionModel.section_contentArray[indexPath.row];
    NSLog(@"您选的内容是：%@",contentModel.content_name);
    
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"您该去搜索 %@ 的相关内容了",contentModel.content_name] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"知道了！", nil];
    [al show];
}

#pragma mark - UICollectionReusableViewButtonDelegate
- (void)delectData:(SelectCollectionReusableView *)view;
{
    if (self.sectionArray.count > 0) {
        [self.sectionArray removeLastObject];
        [self.searchArray removeAllObjects];
        [self.searchCollectionView reloadData];
        [CXDBHandle saveStatuses:@{} andParam:@{@"category":@"1"}];
    }
}
#pragma mark - scrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_seachTextField resignFirstResponder];
}
#pragma mark - textField
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([[textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]){
        return NO;
    }
    
//    [_seachTextField resignFirstResponder];

    /***  每搜索一次   就会存放一次到历史记录，但不存重复的*/
    if ([self.searchArray containsObject:[NSDictionary dictionaryWithObject:textField.text forKey:@"content_name"]]) {
        return YES;
    }
    [self reloadData:textField.text];
    return YES;
}
- (void)reloadData:(NSString *)textString
{
    [self.searchArray addObject:[NSDictionary dictionaryWithObject:textString forKey:@"content_name"]];
    
    NSDictionary *searchDict = @{@"section_id":@"1",@"section_title":@"搜索历史",@"section_content":self.searchArray};
    
    /***由于数据量并不大 这样每次存入再删除没问题  存数据库*/
    NSDictionary *parmDict  = @{@"category":@"1"};
    [CXDBHandle saveStatuses:searchDict andParam:parmDict];
    
    CXSearchSectionModel *model = [[CXSearchSectionModel alloc]initWithDictionary:searchDict];
        [self.sectionArray addObject:model];
    if (_sectionArray.count > 1) {
        [_sectionArray removeObjectAtIndex:0];
    }
    [self.searchCollectionView reloadData];
    self.seachTextField.text = @"";
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
