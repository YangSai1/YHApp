//
//  SHICanListReceiveData.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/14.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHICanListReceiveData.h"

@implementation SHICanListData

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID": @"id"};
}

+ (void)load
{
    [SHICanListData mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"pics":@"SHICanListImages"};
    }];
}


@end

@implementation SHICanListImages

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID": @"id"};
}

@end

@implementation SHICanListReceiveData

+ (void)load
{
    [SHICanListReceiveData mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"iData":@"SHICanListData"
                 };
    }];
}

@end
