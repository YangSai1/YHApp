//
//  SHRegistApi.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHRegistApi.h"

@interface SHRegistApi ()<CTAPIManagerValidator>

@end

@implementation SHRegistApi 

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
    return @"/user/registerUser";
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
//    NSMutableDictionary *resultParams = [[NSMutableDictionary alloc] init];
////    resultParams[@"key"] = [[CTServiceFactory sharedInstance] serviceWithIdentifier:kCTServiceGDMapV3].publicKey;
////    resultParams[@"location"] = [NSString stringWithFormat:@"%@,%@", params[kTestAPIManagerParamsKeyLongitude], params[kTestAPIManagerParamsKeyLatitude]];
////    resultParams[@"output"] = @"json";
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
