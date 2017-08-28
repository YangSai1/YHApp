//
//  SHThrowMoneryView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/14.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ChangeBlock)(BOOL isHave);

@interface SHThrowMoneryView : UIView

- (void)registBlock:(ChangeBlock)block;

@end
