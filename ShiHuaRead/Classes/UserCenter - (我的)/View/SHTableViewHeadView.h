//
//  SHTableViewHeadView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HeaderClickBlock)();

@interface SHTableViewHeadView : UIView

- (void)registBlock:(HeaderClickBlock)block;

- (void)setTitle:(NSString *)title subTitle:(NSString *)subTitle;

@end
