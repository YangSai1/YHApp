//
//  UIImage+Extension.m
//  XCFApp
//
//  Created by callmejoejoe on 16/4/3.
//  Copyright © 2016年 Joey. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

- (UIImage *)circleImage {
    
    // 1. 开启图形上下文
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    // 2. 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 3. 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    // 4. 裁剪
    CGContextClip(ctx);
    // 5. 画上图片
    [self drawInRect:rect];
    // 6. 取出图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 7. 终止上下文
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)scaleImage:(UIImage *)img toSize:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}


@end
