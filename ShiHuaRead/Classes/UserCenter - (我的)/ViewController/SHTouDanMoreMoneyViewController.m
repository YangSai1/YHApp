//
//  SHTouDanMoreMoneyViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHTouDanMoreMoneyViewController.h"
#import "SHTouDanMoreMoneySubViewController.h"
#import "VTMenuItem.h"
#import "MenuInfo.h"

@interface SHTouDanMoreMoneyViewController ()

@property (nonatomic, strong)  NSArray *menuList;

@property(nonatomic, strong) NSMutableArray *menus;


@end

@implementation SHTouDanMoreMoneyViewController

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
    
    static NSString *gridId = @"mineMoney.identifier";
    SHTouDanMoreMoneySubViewController *viewController = [magicView dequeueReusablePageWithIdentifier:gridId];
    if (!viewController) {
        viewController = [[SHTouDanMoreMoneySubViewController alloc] init];
    }
    return viewController;
}


- (void)generateTestData {
    NSMutableArray *menuList = [[NSMutableArray alloc] initWithCapacity:4];
    NSArray *arr = @[@"全部",@"充值",@"投单"];
    
    for (int index = 0; index < arr.count; index++) {
        NSString *title = arr[index];
        
        MenuInfo *menu = [MenuInfo menuInfoWithTitl:title];
        [menuList addObject:menu];
    }
    _menuList = menuList;
}
@end
