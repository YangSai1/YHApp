//
//  SHMineImageTextFieldView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/21.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ChangeTextFieldViewBlock)(NSString *title);

@interface SHMineImageTextFieldView : UIView

@property(nonatomic, strong) UIView *lineView;

- (void)setImage:(NSString *)image placeholder:(NSString *)placeholder;

- (void)registBlock:(ChangeTextFieldViewBlock)block;
@end
