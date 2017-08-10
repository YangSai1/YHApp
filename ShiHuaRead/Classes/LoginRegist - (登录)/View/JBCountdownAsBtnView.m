//
//  JBCountdownAsBtnView.m
//  JamBoHealth
//
//  Created by zyh on 15/9/8.
//  Copyright (c) 2015年 zyh. All rights reserved.
//

#import "JBCountdownAsBtnView.h"

NSString * const DefaultVerifyCodeTitle = @"获取验证码";

@interface JBCountdownAsBtnView ()

@property (nonatomic, strong) CountdownBtnTouchBlock countdownTouchBlock;

@property (nonatomic, strong) UIImageView *bgImgView;

@property (nonatomic, strong) NSTimer *countdownTimer;
@property (nonatomic, assign) NSInteger countdownTime;

@property (nonatomic, copy) NSString *titleBeforeSend;

@end

@implementation JBCountdownAsBtnView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _bgImgView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        [self addSubview:_bgImgView];
        [_bgImgView setImage:[UIImage imageNamed:@"common_button_s"]];
        
        _titleLbl = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLbl.textAlignment = NSTextAlignmentCenter;
        _titleLbl.font = fontCommon_13;
        _titleLbl.textColor = white_ffffff;
        _titleBeforeSend = DefaultVerifyCodeTitle;
        _titleLbl.text = _titleBeforeSend;
        self.layer.cornerRadius = 5.0f;
        self.layer.masksToBounds = YES;
        [self addSubview:_titleLbl];
        
        _countdownTime = 60;
    }
    return self;
}

- (void)startCountdown
{
    [self stopCountdown];
    self.userInteractionEnabled = NO;
    _countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateCountdownTitle) userInfo:nil repeats:YES];
    [_countdownTimer fire];
}

- (void)stopCountdown
{
    if (_countdownTimer) {
        [_countdownTimer invalidate];
        _countdownTimer = nil;
    }
    _titleLbl.text = _titleBeforeSend;
    _countdownTime = 60;
    self.userInteractionEnabled = YES;
}

- (void)updateCountdownTitle
{
    if (_countdownTime > 0) {
        _titleLbl.text = [NSString stringWithFormat:@"已发送(%ld)", _countdownTime];
        _countdownTime--;
        
    }else{
        [self stopCountdown];
    }
}

- (void)setVerifyCodeTitle:(NSString *)verifyCodeTitle
{
    _titleBeforeSend = verifyCodeTitle;
    if (!_countdownTimer) {
        _titleLbl.text = verifyCodeTitle;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    if (CGRectContainsPoint(self.bounds, point))
    {
        if (_countdownTouchBlock) {
            BOOL bCanStart = self.countdownTouchBlock();
            if (bCanStart) {
                [self startCountdown];
            }
        }
    }
}

- (void)updateConstraints
{
    __weak typeof(self) weakSelf = self;
    
    [_bgImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(weakSelf);
  
    }];
    
    [_titleLbl mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(weakSelf);
  
    }];
        
    [super updateConstraints];
}

- (void)setButtonBackgroundImageWithName:(NSString *)imageName
{
    [_bgImgView setImage:[UIImage imageNamed:imageName]];
}

@end
