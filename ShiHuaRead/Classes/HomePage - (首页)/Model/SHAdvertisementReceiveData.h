//
//  SHAdvertisementReceiveData.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/13.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AdvertisementList;


@interface SHQuerySkillImages : NSObject

@property(nonatomic, copy) NSString *createTime;

@property(nonatomic, copy) NSString *delFlag;

@property(nonatomic, copy) NSString *fileType;

@property(nonatomic, copy) NSString *fkPurposeId;

@property(nonatomic, copy) NSString *ID;

@property(nonatomic, copy) NSString *location;

@property(nonatomic, copy) NSString *purpose;

@end


@interface SHAdvertisementReceiveData : NSObject

@property(nonatomic, copy) NSString *page;

@property(nonatomic, copy) NSString *limit;

@property(nonatomic, copy) NSString *offset;

@property(nonatomic, copy) NSString *dataCount;

@property(nonatomic, copy) NSString *totalCount;

@property(nonatomic, strong) NSArray<AdvertisementList *> *iData;

@end

@interface AdvertisementList : NSObject

@property(nonatomic, copy) NSString *ID;

@property(nonatomic, copy) NSString *fkUserId;

@property(nonatomic, copy) NSString *noticeClass;

@property(nonatomic, copy) NSString *noticeType;

@property(nonatomic, copy) NSString *title;

@property(nonatomic, copy) NSString *shootLicence;

@property(nonatomic, copy) NSString *province;

@property(nonatomic, copy) NSString *city;

@property(nonatomic, copy) NSString *area;

@property(nonatomic, copy) NSString *detailAddress;

@property(nonatomic, copy) NSString *needCount;

@property(nonatomic, copy) NSString *noticeTime;

@property(nonatomic, copy) NSString *exeTime;

@property(nonatomic, copy) NSString *budgetStart;

@property(nonatomic, copy) NSString *budgetEnd;

@property(nonatomic, copy) NSString *castCondition;

@property(nonatomic, copy) NSString *castEnsureMoney;

@property(nonatomic, copy) NSString *height;

@property(nonatomic, copy) NSString *weight;

@property(nonatomic, copy) NSString *stature;

@property(nonatomic, copy) NSString *education;

@property(nonatomic, copy) NSString *intro;

@property(nonatomic, copy) NSString *createTime;

@property(nonatomic, copy) NSString *delFlag;

@property (nonatomic , strong) NSArray<SHQuerySkillImages *>              * pics;

@end
