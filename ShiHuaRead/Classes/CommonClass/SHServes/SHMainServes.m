//
//  SHServes.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/8.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMainServes.h"
#import "CTNetworkingConfigurationManager.h"

@implementation SHMainServes

#pragma mark - CTServiceProtocal
- (BOOL)isOnline
{
    return [CTNetworkingConfigurationManager sharedInstance].serviceIsOnline;
}

- (NSString *)offlineApiBaseUrl
{
    return @"http://restapi.amap.com";
}

- (NSString *)onlineApiBaseUrl
{
    return @"http://restapi.amap.com";
}

- (NSString *)offlineApiVersion
{
    return @"v3";
}

- (NSString *)onlineApiVersion
{
    return @"v3";
}

- (NSString *)onlinePublicKey
{
    return @"384ecc4559ffc3b9ed1f81076c5f8424";
}

- (NSString *)offlinePublicKey
{
    return @"384ecc4559ffc3b9ed1f81076c5f8424";
}

- (NSString *)onlinePrivateKey
{
    return @"";
}

- (NSString *)offlinePrivateKey
{
    return @"";
}

//为某些Service需要拼凑额外字段到URL处
- (NSDictionary *)extraParmas {
    return @{@"key": @"374910422"};
    //    return nil;
}

//为某些Service需要拼凑额外的HTTPToken，如accessToken
- (NSDictionary *)extraHttpHeadParmasWithMethodName:(NSString *)method {
    return @{@"sessionID": [[NSUUID UUID]UUIDString]};
}

//- (NSString *)urlGeneratingRuleByMethodName:(NSString *)methodName {
//    return [NSString stringWithFormat:@"%@/%@/%@", self.apiBaseUrl, self.apiVersion, methodName];
//}


@end
