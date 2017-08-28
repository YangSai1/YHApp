//
//  SHBaseDataReformer.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/13.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTAPIBaseManager.h"

@interface SHBaseDataReformer : NSObject <CTAPIManagerDataReformer>
// 模型类名
@property(nonatomic, copy) NSString *modelClass;

@end
