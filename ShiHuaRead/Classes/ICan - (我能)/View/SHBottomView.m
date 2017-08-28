//
//  SHBottomView.m
//  ShiHuaRead
//
//  Created by 海波的电脑 on 2017/8/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHBottomView.h"
#import "SHImagePreView.h"

#import "SHICanListReceiveData.h"

@interface SHBottomView ()

@property(nonatomic, strong) SHImagePreView *imagePreView;

@end

@implementation SHBottomView
- (instancetype)init
{
    if (self = [super init]) {
        
        SHImagePreView *imagePreView = [[SHImagePreView alloc] init];
        self.imagePreView = imagePreView;
        [self addSubview:imagePreView];
        
        UIView * xinxiView = [[UIView alloc] init];
        xinxiView.backgroundColor = [UIColor whiteColor];
        
        UILabel * xinxi1 = [[UILabel alloc] init];
        [xinxiView addSubview:xinxi1];
        self.xinxiOne = xinxi1;
        
        UILabel * xinxi2 = [[UILabel alloc] init];
        [xinxiView addSubview:xinxi2];
        self.xinxiTwo = xinxi2;
        
        UILabel * xinxi3 = [[UILabel alloc] init];
        [xinxiView addSubview:xinxi3];
        self.xinxiThree = xinxi3;
        
        UILabel * xinxi4 = [[UILabel alloc] init];
        [xinxiView addSubview:xinxi4];
        self.xinxiFoure = xinxi4;
        
        UILabel * xinxi5 = [[UILabel alloc] init];
        [xinxiView addSubview:xinxi5];
        self.xinxiFive = xinxi5;
        
        UILabel * xinxi6 = [[UILabel alloc] init];
        [xinxiView addSubview:xinxi6];
        self.xinxiliu = xinxi6;
        
        UILabel * xinxi7 = [[UILabel alloc] init];
        [xinxiView addSubview:xinxi7];
        self.xinxiSeven = xinxi7;
        
        UILabel * xinxi8 = [[UILabel alloc] init];
        [xinxiView addSubview:xinxi8];
        self.xinxiEight = xinxi8;
        
        self.XinXiView = xinxiView;
        [self addSubview:xinxiView];
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imagePreView.frame = CGRectMake(zScaleW(5), zScaleH(10), kScreenWidth - zScaleW(10), zScaleH(80));
    
    if (_imagePreView.hidden) {
        self.XinXiView.frame = CGRectMake(zScaleW(5), zScaleH(10), kScreenWidth - zScaleW(10), 252);
 
    }else{
        
        self.XinXiView.frame = CGRectMake(zScaleH(5), zScaleH(100), kScreenWidth - zScaleW(10), 252);

    }
    for (int i = 0; i < 8; i ++) {
        UILabel * childLable = self.XinXiView.subviews[i];
        childLable.font = [UIFont systemFontOfSize:12];
        childLable.textColor = [UIColor darkGrayColor];
        childLable.frame = CGRectMake(10, 15 + 27 * i, kScreenWidth - 30, 12);
    }
}

- (void)setModel:(SHICanListData *)model
{
    _model = model;
    
    NSMutableArray *imageDatas = [NSMutableArray array];
    
    for (int index = 0; index < model.pics.count; index ++) {
        
        SHICanListImages *imageM = model.pics[index];
        
        NSString *path = [NSString stringWithFormat:@"%@%@",BASE_URL,imageM.location];
        [imageDatas addObject:path];
    }
    
    if (imageDatas.count == 0) {
        _imagePreView.hidden = YES;
    }
    
    _imagePreView.dateImages = [imageDatas copy];
    
    _xinxiOne.text = [NSString stringWithFormat:@"真实姓名: %@",model.realName];
    _xinxiTwo.text = [NSString stringWithFormat:@"艺名: %@",@"小花"];
    _xinxiThree.text = [NSString stringWithFormat:@"所在地区: %@ %@ %@",model.province,model.city,model.area];
    _xinxiFoure.text = [NSString stringWithFormat:@"所在地区: %@",model.detailAddress];
    _xinxiFive.text = [NSString stringWithFormat:@"身高: %@",model.height];
    _xinxiliu.text = [NSString stringWithFormat:@"身材: %@",model.stature];
    _xinxiSeven.text = [NSString stringWithFormat:@"学历: %@",model.education];
    
    _xinxiEight.text = [NSString stringWithFormat:@"技能描述: %@",model.intro];
    
    [self layoutIfNeeded];
}

@end
