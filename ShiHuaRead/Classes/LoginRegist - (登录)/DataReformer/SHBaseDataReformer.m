//
//  SHBaseDataReformer.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/13.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHBaseDataReformer.h"
#import "MJExtension.h"
@interface SHBaseDataReformer ()

@end

@implementation SHBaseDataReformer

- (id)manager:(CTAPIBaseManager *)manager reformData:(NSDictionary *)data
{
    id model = [[NSClassFromString(_modelClass) alloc]init];
    NSAssert(model, [NSString stringWithFormat:@"无法创建model,以及转化模型,请检查传入的模型类是否存在"],model);
    
    id returnModel = [NSClassFromString(_modelClass) mj_objectWithKeyValues:data];
    return returnModel;
}

@end
