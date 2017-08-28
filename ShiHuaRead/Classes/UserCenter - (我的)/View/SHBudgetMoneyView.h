//
//  SHBudgetMoneyView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/14.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TextBlock)(NSString *firstT,NSString *secoundT);

@interface SHBudgetMoneyView : UIView

- (void)registBlock:(TextBlock)block;

@end
