//
//  SHBottomView.h
//  ShiHuaRead
//
//  Created by 海波的电脑 on 2017/8/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SHICanListReceiveData, SHICanListData;

@interface SHBottomView : UIView

@property(nonatomic, strong) UIView * imagesView;

@property(nonatomic, strong) UIView * XinXiView;

@property(nonatomic, strong) UILabel * xinxiOne;

@property(nonatomic, strong) UILabel * xinxiTwo;

@property(nonatomic, strong) UILabel * xinxiThree;

@property(nonatomic, strong) UILabel * xinxiFoure;

@property(nonatomic, strong) UILabel * xinxiFive;

@property(nonatomic, strong) UILabel * xinxiliu;

@property(nonatomic, strong) UILabel * xinxiSeven;

@property(nonatomic, strong) UILabel * xinxiEight;

@property(nonatomic, strong) SHICanListData *model;

@end
