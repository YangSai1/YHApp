//
//  SHMineTitleLableView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/21.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TitleFieldViewBlock)(NSString *title);

@interface SHMineTitleLableView : UIView

@property(nonatomic, strong) UIView *lineView;

- (void)setTitle:(NSString *)title placeholder:(NSString *)placeholder;

- (void)registBlock:(TitleFieldViewBlock)block;

@end
