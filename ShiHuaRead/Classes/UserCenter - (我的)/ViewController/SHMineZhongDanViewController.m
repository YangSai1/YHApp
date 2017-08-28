//
//  SHMineZhongDanViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMineZhongDanViewController.h"

#import "VTMenuItem.h"
#import "MenuInfo.h"
#import "SHMineZhongDanSubViewController.h"

@interface SHMineZhongDanViewController ()

@property (nonatomic, strong)  NSArray *menuList;

@property(nonatomic, strong) NSMutableArray *menus;


@end

@implementation SHMineZhongDanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = NO;
    
    //    UIBarButtonItem *rightBarItem = [UIBarButtonItem barButtonRightItemWithImageName:@"新增-(1)" target:self action:@selector(rightBtn)];
    //    self.navigationItem.rightBarButtonItem = rightBarItem;
    
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
    
    static NSString *gridId = @"mineZhongDan.identifier";
    SHMineZhongDanSubViewController *viewController = [magicView dequeueReusablePageWithIdentifier:gridId];
    if (!viewController) {
        viewController = [[SHMineZhongDanSubViewController alloc] init];
    }
    //    SHMineNoticeSubViewController.menuInfo = _menuList[pageIndex];
    return viewController;
}

#pragma mark - actions
- (void)subscribeAction {
    NSLog(@"subscribeAction");
    // against status bar or not
    self.magicView.againstStatusBar = !self.magicView.againstStatusBar;
    [self.magicView setHeaderHidden:!self.magicView.isHeaderHidden duration:0.35];
}

#pragma mark - functional methods
- (void)integrateComponents {
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    [rightButton addTarget:self action:@selector(subscribeAction) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitleColor:RGBACOLOR(169, 37, 37, 0.6) forState:UIControlStateSelected];
    [rightButton setTitleColor:RGBCOLOR(169, 37, 37) forState:UIControlStateNormal];
    [rightButton setTitle:@"+" forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont boldSystemFontOfSize:28];
    rightButton.center = self.view.center;
    self.magicView.rightNavigatoinItem = rightButton;
}

- (void)generateTestData {
    NSMutableArray *menuList = [[NSMutableArray alloc] initWithCapacity:4];
    NSArray *arr = @[@"全部",@"待支付",@"待开标",@"已开标"];
    
    for (int index = 0; index < arr.count; index++) {
        NSString *title = arr[index];
        
        MenuInfo *menu = [MenuInfo menuInfoWithTitl:title];
        [menuList addObject:menu];
    }
    _menuList = menuList;
}

@end
