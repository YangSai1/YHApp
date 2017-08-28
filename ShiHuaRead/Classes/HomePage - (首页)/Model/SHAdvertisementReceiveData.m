//
//  SHAdvertisementReceiveData.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/13.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHAdvertisementReceiveData.h"

@implementation SHAdvertisementReceiveData

+ (void)load
{
    [SHAdvertisementReceiveData mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"iData":@"AdvertisementList"
                 };
    }];
}

@end

@implementation SHQuerySkillImages

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID": @"id"};
}

@end

@implementation AdvertisementList

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID": @"id"};
}

+ (void)load
{
    [AdvertisementList mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"pics":@"SHQuerySkillImages"
                 };
    }];
}

@end
