//
//  SHBlueLineTextView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^EditTextViewBlocl)(NSString *text);

@interface SHBlueLineTextView : UIView

@property(nonatomic, strong) UIView *lineView;

@property(nonatomic, strong) UITextField *detailText;


- (void)setTitle:(NSString *)title placeholder:(NSString *)placeHolder;

- (void)registBlock:(EditTextViewBlocl)block;

@end
