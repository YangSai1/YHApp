//
//  SHMineCollectViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMineCollectViewController.h"
#import "VTMenuItem.h"
#import "MenuInfo.h"

#import "SHCollectICanViewController.h"
#import "SHCollectAdviceViewController.h"

@interface SHMineCollectViewController ()

@property (nonatomic, strong)  NSArray *menuList;

@property(nonatomic, strong) NSMutableArray *menus;

@property(nonatomic, strong) SHCollectICanViewController *collectICanViewController;

@property(nonatomic, strong) SHCollectAdviceViewController *collectAdviceViewController;


@end

@implementation SHMineCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = NO;
    
    
    _menus = [NSMutableArray arrayWithCapacity:0];
    
    self.magicView.navigationHeight = 30;
    self.magicView.layoutStyle = VTLayoutStyleDivide;
    self.magicView.navigationColor = [UIColor whiteColor];
    self.magicView.sliderStyle = VTSliderStyleDefault;
    self.magicView.sliderColor = RGBCOLOR(229, 229, 229);
    self.magicView.sliderColor = [UIColor whiteColor];
    [self addNotification];
    [self generateTestData];
    [self.magicView reloadDataToPage:0];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - NSNotification
- (void)addNotification {
    [self removeNotification];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(statusBarOrientationChange:)
                                                 name:UIApplicationDidChangeStatusBarOrientationNotification
                                               object:nil];
}

- (void)removeNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
}

- (void)statusBarOrientationChange:(NSNotification *)notification {
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:YES];
}

#pragma mark - VTMagicViewDataSource
- (NSArray<NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView {
    NSMutableArray *titleList = [NSMutableArray array];
    for (MenuInfo *menu in _menuList) {
        [titleList addObject:menu.title];
    }
    return titleList;
}

- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex {
    static NSString *itemIdentifier = @"itemIdentifier";
    VTMenuItem *menuItem = [magicView dequeueReusableItemWithIdentifier:itemIdentifier];
    if (!menuItem) {
        menuItem = [VTMenuItem buttonWithType:UIButtonTypeCustom];
        [menuItem setTitleColor:RGBCOLOR(50, 50, 50) forState:UIControlStateNormal];
        [menuItem setTitleColor:TabbarSelectColer forState:UIControlStateSelected];
        menuItem.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:15.f];
    }
    [_menus addObject:menuItem];
    
    menuItem.lineHidden = (_menuList.count - 1 == itemIndex) ? YES : NO;
    
    return menuItem;
}



- (void)magicView:(VTMagicView *)magicView viewDidAppear:(__kindof UIViewController *)viewController atPage:(NSUInteger)pageIndex;
{
    NSLog(@"magicView - %lu",pageIndex);
    
    for (int index = 0; index < _menus.count; index ++) {
        VTMenuItem *item = _menus[index];
        
        if (index == pageIndex) {
            item.bottomView.backgroundColor = TabbarSelectColer;
        }else{
            item.bottomView.backgroundColor = Color_E5E5E5;
        }
    }
}

- (UIViewController *)magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageIndex {
    
    NSLog(@"%lu - %lu",pageIndex,_menus.count);
    if (pageIndex == 0) {
        return self.collectAdviceViewController;
    }else{
        return self.collectICanViewController;
    }
}

#pragma mark - actions
- (void)subscribeAction {
    NSLog(@"subscribeAction");
    // against status bar or not
    self.magicView.againstStatusBar = !self.magicView.againstStatusBar;
    [self.magicView setHeaderHidden:!self.magicView.isHeaderHidden duration:0.35];
}

#pragma mark - functional methods
- (void)generateTestData {
    NSMutableArray *menuList = [[NSMutableArray alloc] initWithCapacity:4];
    NSArray *arr = @[@"公告",@"我能"];
    
    for (int index = 0; index < arr.count; index++) {
        NSString *title = arr[index];
        
        MenuInfo *menu = [MenuInfo menuInfoWithTitl:title];
        [menuList addObject:menu];
    }
    _menuList = menuList;
}


#pragma mark - init method
- (SHCollectICanViewController *)collectICanViewController
{
    if (!_collectICanViewController) {
        _collectICanViewController = [[SHCollectICanViewController alloc] init];
    }
    return _collectICanViewController;
}

- (SHCollectAdviceViewController *)collectAdviceViewController
{
    if (!_collectAdviceViewController) {
        _collectAdviceViewController = [[SHCollectAdviceViewController alloc] init];
    }
    return _collectAdviceViewController;
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
