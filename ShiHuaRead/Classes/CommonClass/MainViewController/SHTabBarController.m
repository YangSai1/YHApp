//
//  XCFTabBarController.m
//  XCFApp
//
//  Created by callmejoejoe on 16/4/2.
//  Copyright © 2016年 Joey. All rights reserved.
//

#import "SHTabBarController.h"
#import "SHNavigationController.h"

#import "SHHomePageViewController.h"
#import "SHPublishViewController.h"
#import "SHICanViewController.h"
#import "SHChatViewController.h"
#import "SHUserCenterViewController.h"
@interface SHTabBarController ()

@end

@implementation SHTabBarController

+ (void)initialize {
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    normalAttrs[NSForegroundColorAttributeName] = TabbarNorColer;
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = normalAttrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = TabbarSelectColer;
    
    UITabBarItem *appearance = [UITabBarItem appearance];
    [appearance setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [appearance setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    
    [[UITabBar appearance] setBackgroundImage:[EBUtility PureColorImageFromColor:[UIColor whiteColor] withSize:CGSizeMake(kScreenWidth, 49)]];
        [self setupChildViewController:[[SHHomePageViewController alloc] init]
                             title:@"公告"
                             image:@"icon-gonggao-48-48"
                     selectedImage:@"icon-gonggao-48"];
    [self setupChildViewController:[[SHICanViewController alloc] init]
                             title:@"我能"
                             image:@"icon-woneng-48"
                     selectedImage:@"icon-woneng-48-48"];

    [self setupChildViewController:[[SHPublishViewController alloc] init]
                             title:@"公示"
                             image:@"icon-gongshi-46-47-"
                     selectedImage:@"icon-gongshi-46-47"];

    [self setupChildViewController:[[SHChatViewController alloc] init]
                             title:@"聊天"
                             image:@"icon-liaotian-44"
                     selectedImage:@"icon-liaotian-44-44"];
    
    [self setupChildViewController:[[SHUserCenterViewController alloc] init]
                             title:@"我的"
                             image:@"icon-wode-44"
                     selectedImage:@"icon-wode-44-44"];
}

- (void)setupChildViewController:(UIViewController *)childController
                           title:(NSString *)title
                           image:(NSString *)image
                   selectedImage:(NSString *)selectedImage {
    childController.title = title;
    [childController.tabBarItem setImage:[UIImage imageNamed:image]];
    [childController.tabBarItem setSelectedImage:[UIImage imageNamed:selectedImage]];
    SHNavigationController *navCon = [[SHNavigationController alloc] initWithRootViewController:childController];
    navCon.title = title;
    [self addChildViewController:navCon];
}


@end
