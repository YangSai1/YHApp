//
//  SHEvaluateView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, EvaluateType)   {
    
    EvaluateTypeGood = 0,
    
    EvaluateTypeMid = 1,
    
    EvaluateTypeBad = 2
    
};

typedef void(^EvaluateTypeViewBlock)(EvaluateType type);

@interface SHEvaluateView : UIView

- (void)registEvaluateBlock:(EvaluateTypeViewBlock)block;

@end
