//
//  SHAdvertisementAskData.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/13.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHAdvertisementAddAskData : NSObject

@property(nonatomic, copy) NSString *fkUserId;

@property(nonatomic, copy) NSString *noticeClass;

@property(nonatomic, copy) NSString *noticeType;

@property(nonatomic, copy) NSString *title;

@property(nonatomic, copy) NSString *shootLicence;

/*
 * 省
 */
@property(nonatomic, copy) NSString *province;

/*
 * 市
 */
@property(nonatomic, copy) NSString *city;

/*
 * 区
 */
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

@end
