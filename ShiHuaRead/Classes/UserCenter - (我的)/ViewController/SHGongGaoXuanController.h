//
//  SHGongGaoXuanController.h
//  ShiHuaRead
//
//  Created by 海波的电脑 on 2017/8/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHBaseViewController.h"

typedef void(^ChangeTitleBlock)(NSString *title);

@interface SHGongGaoXuanController : SHBaseViewController

- (void)registBlock:(ChangeTitleBlock)block;

@end
