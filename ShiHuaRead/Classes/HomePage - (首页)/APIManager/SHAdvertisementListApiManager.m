//
//  SHAdvertisementListApiManager.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/13.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHAdvertisementListApiManager.h"

@interface SHAdvertisementListApiManager ()<CTAPIManagerValidator>

@property(nonatomic, assign) NSInteger totalPropertyCount;


@property(nonatomic, assign) NSInteger nextPageNumber;

@end

@implementation SHAdvertisementListApiManager

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
    return @"/notice/queryNoticeList";
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
    NSMutableDictionary *resultParams = [[NSMutableDictionary alloc] init];
    
    resultParams = [params mutableCopy];
    resultParams[@"pageSize"] = [NSString stringWithFormat:@"%d",15];
    resultParams[@"page"] = [NSString stringWithFormat:@"%lu",self.nextPageNumber];
    params = [resultParams copy];
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

#pragma mark - 分页加载
- (void)loadNextPage
{
    if (self.isLoading) {
        return;
    }
    
    NSInteger totalPage = ceil(self.totalPropertyCount / 15.0f);
    if (totalPage > 1 && self.nextPageNumber <= totalPage)
    {
        [self loadData];
    }

}

- (void)refreshPage
{
    if (self.isLoading) {
        return;
    }
    self.nextPageNumber = 0;
    [self loadData];
}

#pragma mark - 重载拦截器方法获得数据
- (BOOL)beforePerformSuccessWithResponse:(CTURLResponse *)response
{
    self.totalPropertyCount = [response.content[@"data"][@"totalCount"] integerValue];
    self.nextPageNumber ++;
    return YES;
}


- (BOOL)beforePerformFailWithResponse:(CTURLResponse *)response
{
    if (self.nextPageNumber > 0) {
        self.nextPageNumber--;
    }
    return YES;
}

@end
