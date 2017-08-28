//
//  SHICanTopView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHICanListReceiveData.h"

@interface SHICanTopView : UIView

@property(nonatomic, strong) UIView *bgView;

@property(nonatomic, strong) UIImageView *iconImageView;

@property(nonatomic, strong) UILabel *nameLb;

@property(nonatomic, strong) UILabel *skillLb;

@property(nonatomic, strong) UILabel *fadanNumLb;

@property(nonatomic, strong) UIImageView *fadaGoodV;

@property(nonatomic, strong) UILabel *fadanGoodLb;

@property(nonatomic, strong) UIImageView *fadaBadV;

@property(nonatomic, strong) UILabel *fadanBadLb;

@property(nonatomic, strong) UIImageView *toudanGoodV;

@property(nonatomic, strong) UILabel *toudanGoodLb;

@property(nonatomic, strong) UIImageView *toudanBadV;

@property(nonatomic, strong) UILabel *toudanBadLb;

@property(nonatomic, strong) UIView *lineView;

@property(nonatomic, strong) UILabel *detailLb;

@property(nonatomic, strong) UIImageView *detailRightV;

@end
