//
//  UIView+GetVCAddTo.m
//  JamBoHealth
//
//  Created by zyh on 15/11/7.
//  Copyright © 2015年 zyh. All rights reserved.
//

#import "UIView+GetVCAddTo.h"

@implementation UIView (GetVCAddTo)

- (UIViewController *)GetCurViewController
{
    Class vcc = [UIViewController class];
    UIResponder *responder = self;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass: vcc])
            return (UIViewController *)responder;
    return nil;
}

@end
