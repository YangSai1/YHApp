//
//  JBDownLine.h
//  JamBoHealth
//
//  Created by ebaolife on 15/8/11.
//  Copyright (c) 2015年 zyh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, colorStyle){
    colorStyleE6e6e6 = 1,
    colorStyleC1c1c1
};

@interface JBDownLine : UILabel

- (id)initWithFrame:(CGRect)frame Style:(NSInteger)style;

@end
