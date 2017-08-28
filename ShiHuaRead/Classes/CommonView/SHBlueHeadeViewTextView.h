//
//  SHBlueHeadeViewTextView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHBlueLineTextView.h"
#import "SHShadowView.h"
#import "STTextView.h"

@interface SHBlueHeadeViewTextView : UIView

@property(nonatomic, strong) SHBlueLineTextView *titleView;

@property(nonatomic, strong) SHShadowView *shadowBgView;

@property(nonatomic, strong) STTextView *textView;

@end
