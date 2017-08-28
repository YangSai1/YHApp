//
//  SHMoneyPayStyleView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MoneyPayStyleViewBlock)(UIButton *btn);

@interface SHMoneyPayStyleView : UIView

@property(nonatomic, strong) UIButton *rightBtn;

- (void)setTitle:(NSString *)title withImage:(NSString *)image;

@end
