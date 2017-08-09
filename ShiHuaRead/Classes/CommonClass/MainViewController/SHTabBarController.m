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
#import "SHDiscoverViewController.h"

@interface SHTabBarController ()

@end

@implementation SHTabBarController

+ (void)initialize {
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = normalAttrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    
    UITabBarItem *appearance = [UITabBarItem appearance];
    [appearance setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [appearance setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
        [self setupChildViewController:[[SHHomePageViewController alloc] init]
                             title:@"市集"
                             image:@"tabBDeselected"
                     selectedImage:@"tabBSelected"];
    [self setupChildViewController:[[SHPublishViewController alloc] init]
                             title:@"社区"
                             image:@"tabCDeselected"
                     selectedImage:@"tabCSelected"];
    [self setupChildViewController:[[SHDiscoverViewController alloc] init]
                             title:@"我"
                             image:@"tabDDeselected"
                     selectedImage:@"tabDSelected"];
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
