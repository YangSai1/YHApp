//
//  SHThirdLoginBtn.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/9.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHThirdLoginBtn.h"

@implementation SHThirdLoginBtn

- (instancetype)initWithImage:(NSString *)imageStr title:(NSString *)title
{
    if (self = [super initWithFrame:CGRectZero]) {
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:imageStr];
        
        UILabel *titleLb = [UILabel labelWithFont:fontCommon_12 textColor:LoginTitleColer numberOfLines:1 textAlignment:NSTextAlignmentCenter];
        titleLb.text = title;
        
        [self addSubview:imageView];
        [self addSubview:titleLb];

        __weak typeof(self) weakSelf = self;
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf);
            make.centerX.equalTo(weakSelf);
            make.width.height.equalTo(@(28));
        }];
        
        [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imageView.mas_bottom).offset(2);
            make.centerX.equalTo(weakSelf);
        }];

        
    }
    return self;
}

- (void)initView
{
}
@end
