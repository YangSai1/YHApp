//
//  SHMineImageLableView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/21.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TipViewBlock)();


@interface SHMineImageLableView : UIView

@property(nonatomic, strong) UIView *lineView;

- (void)setImage:(NSString *)image text:(NSString *)text;

- (void)registBlock:(TipViewBlock)block;

@end
