//
//  SHTextFieldLineView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/9.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SHTextFieldLineViewBlock)(NSString *value);

@interface SHTextFieldLineView : UIView

- (instancetype)initWithImage:(NSString *)leftImage placeholder:(NSString *)placeholder valueAction:(SHTextFieldLineViewBlock)block;

@end
