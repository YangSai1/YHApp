//
//  SHMineICanViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMineICanViewController.h"
#import "SHMineICanEiderViewController.h"

@interface SHMineICanViewController ()

@end

@implementation SHMineICanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的我能";
    self.navigationController.navigationBar.hidden = NO;
    UIBarButtonItem *rightBarItem = [UIBarButtonItem barButtonRightItemWithImageName:@"icon-shaixuan-38-37" target:self action:@selector(rightBtn)];
    self.navigationItem.rightBarButtonItem = rightBarItem;

    // Do any additional setup after loading the view.
}
- (void)rightBtn
{
    SHMineICanEiderViewController *mineNoticeEditorVc = [[SHMineICanEiderViewController alloc] init];
    [self.navigationController pushViewController:mineNoticeEditorVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
