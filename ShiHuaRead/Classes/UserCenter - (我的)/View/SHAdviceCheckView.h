//
//  SHAdviceCheckView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AdviceType) {
    AdviceTypeInform, // 举报
    AdviceTypeComplain, // 投诉
    AdviceTypeAdvice // 建议
};

typedef void(^AdviceTypeBlock)(AdviceType type);
@interface SHAdviceCheckView : UIView

- (void)registBlock:(AdviceTypeBlock)type;

@end
