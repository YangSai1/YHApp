//
//  JBDownLine.m
//  JamBoHealth
//
//  Created by ebaolife on 15/8/11.
//  Copyright (c) 2015年 zyh. All rights reserved.
//

#import "JBDownLine.h"
#import "EBUtility.h"

@implementation JBDownLine

- (id)initWithFrame:(CGRect)frame Style:(NSInteger)style
{
    if (self = [self initWithFrame:frame]) {
        UIColor *color;
        color = gray_e6e6e6;
        if (style == colorStyleC1c1c1) {
            color = gray_c1c1c1;
        } else if ( style == colorStyleE6e6e6) {
            color = gray_e6e6e6;
        }
        self.backgroundColor = color;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = gray_e6e6e6;
    }
    return self;
}

@end
