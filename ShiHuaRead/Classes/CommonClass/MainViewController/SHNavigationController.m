//
//  XCFNavigationController.m
//  XCFApp
//
//  Created by callmejoejoe on 16/4/2.
//  Copyright © 2016年 Joey. All rights reserved.
//

#import "SHNavigationController.h"
#import "UIImage+Extension.h"
@interface SHNavigationController ()

@end

@implementation SHNavigationController

+ (void)initialize {
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    attrs[NSForegroundColorAttributeName] = NavTitleColoe;
    
    UINavigationBar *appearance = [UINavigationBar appearance];
    [appearance setTitleTextAttributes:attrs];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // icon-750-120
    UIImage *image = [UIImage imageNamed:@"icon-750-120"];
    image = [image scaleImage:image toSize:CGSizeMake(kScreenWidth, 64)];
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];

    
//    UIImage *image = [UIImage imageNamed:@"icon-750-120"];
//    UIImageView *barImageView = [[UIImageView alloc] init];
//    barImageView.image = image;
//    barImageView.frame = CGRectMake(0, -20, kScreenWidth, 64);
//    [self.navigationBar addSubview:barImageView];
//    self.navigationBar.barTintColor = [UIColor whiteColor];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        // 替换back按钮
        UIBarButtonItem *backBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"icon-fanhui-17-31"
                                                                           imageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 8)
                                                                                    target:self
                                                                                    action:@selector(back)];
        viewController.navigationItem.leftBarButtonItem = backBarButtonItem;
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

@end
