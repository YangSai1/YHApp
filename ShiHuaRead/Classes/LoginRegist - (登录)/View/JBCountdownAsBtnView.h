//
//  JBCountdownAsBtnView.h
//  JamBoHealth
//
//  Created by zyh on 15/9/8.
//  Copyright (c) 2015年 zyh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef BOOL(^CountdownBtnTouchBlock)();

@interface JBCountdownAsBtnView : UIView

@property (nonatomic, strong) UILabel *titleLbl;

- (void)startCountdown;
- (void)stopCountdown;

/** 设置验证码发送前的title，默认是"获取验证码"*/
- (void)setVerifyCodeTitle:(NSString *)verifyCodeTitle;

- (void)setCountdownTouchBlock:(CountdownBtnTouchBlock)touchBlock;

- (void)setButtonBackgroundImageWithName:(NSString *)imageName;

@end
