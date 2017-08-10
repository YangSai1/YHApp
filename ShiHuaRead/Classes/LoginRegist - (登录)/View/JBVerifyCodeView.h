//
//  JBVerifyCodeView.h
//  JamBoHealth
//
//  Created by zyh on 15/9/7.
//  Copyright (c) 2015年 zyh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBCountdownAsBtnView.h"
#import "JBDownLine.h"

typedef BOOL(^SendVerifyCodeBlock)(JBCountdownAsBtnView *countdownBtn);

@interface JBVerifyCodeView : UIView

@property (nonatomic, strong) UITextField *verifyCodeTxtField;
@property (nonatomic, copy, readonly) NSString *verifyCodeContent;
@property (nonatomic, strong) JBDownLine *downLine;
@property (nonatomic, strong) JBCountdownAsBtnView *countdownBtnView;

- (void)setSendVerifyCodeBlock:(SendVerifyCodeBlock)sendBlock;

- (void)setLineColor:(UIColor *)color;

- (void)setBtnTitle:(NSString *)title;

- (void)setLettImage:(NSString *)imageStr;

/** 关闭倒计时的定时器，防止内存泄漏*/
- (void)endVerifyCode;

@end
