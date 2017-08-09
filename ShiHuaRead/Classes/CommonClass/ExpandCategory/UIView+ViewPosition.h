//
//  UIView+ViewPosition.h
//  JamBoHealth
//
//  Created by zyh on 15/8/22.
//  Copyright (c) 2015年 zyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ViewPosition)

/** view最右边点的x坐标*/
- (CGFloat)xRightPosition;

/** view底部的y坐标*/
- (CGFloat)yBottomPosition;

/** view的x坐标*/
- (CGFloat)xPos;

/** view的y坐标*/
- (CGFloat)yPos;

/** view的宽度*/
- (CGFloat)vWidth;

/** view的高度*/
- (CGFloat)vHeight;

@property (nonatomic) CGPoint viewOrigin;
@property (nonatomic) CGSize  viewSize;

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat centerX; // 相对于父控件
@property (nonatomic) CGFloat centerY;

/*----------------------
 * Relative coordinate *
 ----------------------*/

@property (nonatomic, readonly) CGFloat middleX; // 自己的中心点
@property (nonatomic, readonly) CGFloat middleY;
@property (nonatomic, readonly) CGPoint middlePoint;

@end
