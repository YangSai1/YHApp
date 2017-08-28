//
//  SHQuerySkillListReceiveData.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/14.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHQuerySkillListReceiveData.h"

@implementation SHQuerySkillListData

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID": @"id"};
}


@end

@implementation SHQuerySkillListReceiveData

+ (void)load
{
    [SHQuerySkillListReceiveData mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"iData":@"SHQuerySkillListData"
                 };
    }];
}

@end
