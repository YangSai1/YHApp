//
//  UIImage+Extension.h
//  XCFApp
//
//  Created by callmejoejoe on 16/4/3.
//  Copyright © 2016年 Joey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

- (UIImage *)circleImage;

- (UIImage *)scaleImage:(UIImage *)img toSize:(CGSize)size;

// 缩小0.5
+ (UIImage *)resizedImage:(NSString *)name;

/**
 *  用颜色返回一张图片
 */
+ (UIImage *)createImageWithColor:(UIColor*) color;

/**
 *  带边框的图片
 *
 *  @param name        图片名字
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 */
+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

@end
