//
//  SHShadowView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHShadowView.h"

@implementation SHShadowView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = NO;
        self.layer.cornerRadius =5.0;
        self.layer.shadowRadius = 5.0;
        self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.layer.shadowOpacity = 0.8;
        self.layer.shadowOffset = CGSizeMake(0, 0);

    }
    return self;
}
@end
