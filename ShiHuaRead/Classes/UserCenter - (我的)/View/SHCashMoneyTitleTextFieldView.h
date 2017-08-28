//
//  SHCashMoneyTitleTextFieldView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TitleFieldViewBlock)(NSString *title);

@interface SHCashMoneyTitleTextFieldView : UIView

- (void)setTitle:(NSString *)title placeholder:(NSString *)placeholder;

- (void)registBlock:(TitleFieldViewBlock)block;

@end
