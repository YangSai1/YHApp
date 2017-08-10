//
//  UIWindow+Extension.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/9.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "UIWindow+Extension.h"

@implementation UIWindow (Extension)
 //获取当前window
+ (UIWindow *)currentWindow
{
     UIApplication *app = [UIApplication sharedApplication];
     if ([app.delegate respondsToSelector:@selector(window)])
         {
             return [app.delegate window];
        }
     else
         {
             return [app keyWindow];
            }
 }
@end
