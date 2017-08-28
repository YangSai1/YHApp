//
//  SHLoginApiManager.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/13.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHLoginApiManager.h"


@interface SHLoginApiManager ()<CTAPIManagerValidator>

@end

@implementation SHLoginApiManager

#pragma mark - life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.validator = self;
    }
    return self;
}

#pragma mark - CTAPIManager
- (NSString *)methodName
{
    return @"/user/login";
}

- (NSString *)serviceType
{
    return kSHMainService;
}

- (CTAPIManagerRequestType)requestType
{
    return CTAPIManagerRequestTypePost;
}

- (BOOL)shouldCache
{
    return NO;
}

- (NSDictionary *)reformParams:(NSDictionary *)params
{
    return params;
}

#pragma mark - CTAPIManagerValidator
- (BOOL)manager:(CTAPIBaseManager *)manager isCorrectWithParamsData:(NSDictionary *)data
{
    return YES;
}

- (BOOL)manager:(CTAPIBaseManager *)manager isCorrectWithCallBackData:(NSDictionary *)data
{
    if ([data[@"status"] isEqualToString:@"0"]) {
        return YES;
    }
    
    return YES;
}

@end
