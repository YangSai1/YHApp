//
//  SHImagePreViewCell.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/25.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHImagePreViewCell.h"

@implementation SHImagePreViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor colorWithWhite:1.000 alpha:0.500];
        self.clipsToBounds = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_imageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _imageView.frame = self.bounds;
}


@end
