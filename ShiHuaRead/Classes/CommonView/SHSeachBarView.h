//
//  SHSeachBarView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/10.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SeachBlock)(NSString *title);

typedef void(^SeachBtnBlock)();
@interface SHSeachBarView : UIView

@property(nonatomic, strong) UITextField *seachTextField;

- (void)registBlock:(SeachBlock)block;

- (void)registBtnBlock:(SeachBtnBlock)block;

@end
