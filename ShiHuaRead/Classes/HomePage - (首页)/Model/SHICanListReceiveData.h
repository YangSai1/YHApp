//
//  SHICanListReceiveData.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/14.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHICanListImages : NSObject

@property(nonatomic, copy) NSString *createTime;

@property(nonatomic, copy) NSString *delFlag;

@property(nonatomic, copy) NSString *fileType;

@property(nonatomic, copy) NSString *fkPurposeId;

@property(nonatomic, copy) NSString *ID;

@property(nonatomic, copy) NSString *location;

@property(nonatomic, copy) NSString *purpose;


@end


@interface SHICanListData : NSObject

@property (nonatomic , copy) NSString              * ID;
@property (nonatomic , copy) NSString              * intro;
@property (nonatomic , copy) NSString              * realName;
@property (nonatomic , assign) NSInteger              delFlag;
@property (nonatomic , copy) NSString              * fkUserId;
@property (nonatomic , copy) NSString              * province;
@property (nonatomic , copy) NSString              * area;
@property (nonatomic , copy) NSString              * weight;
@property (nonatomic , copy) NSString              * fkSkillId;
@property (nonatomic , copy) NSString              * detailAddress;
@property (nonatomic , assign) NSInteger              createTime;
@property (nonatomic , copy) NSString              * city;
@property (nonatomic , copy) NSString              * height;
@property (nonatomic , copy) NSString              * stature;
@property (nonatomic , copy) NSString              * education;
@property (nonatomic , copy) NSString              * stageName;
@property (nonatomic , strong) NSArray<SHICanListImages *>              * pics;


@end


@interface SHICanListReceiveData : NSObject

@property (nonatomic , assign) NSInteger              limit;
@property (nonatomic , assign) NSInteger              dataCount;
@property (nonatomic , assign) NSInteger              offset;
@property (nonatomic , assign) NSInteger              totalCount;
@property (nonatomic , strong) NSArray<SHICanListData *>              * iData;

@property (nonatomic , assign) NSInteger              page;


@end
