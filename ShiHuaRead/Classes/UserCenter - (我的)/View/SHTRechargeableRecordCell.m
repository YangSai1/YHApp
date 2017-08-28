//
//  SHTRechargeableRecordCell.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHTRechargeableRecordCell.h"

@interface SHTRechargeableRecordCell ()

@property(nonatomic, strong) UILabel *rechargeableTimeLb;

@property(nonatomic, strong) UILabel *rechargeableCodingLb;

@property(nonatomic, strong) UILabel *rechargeableNumLb;

@property(nonatomic, strong) UILabel *rechargeableStateLb;

@property(nonatomic, strong) UIView *bgView;

@end

@implementation SHTRechargeableRecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    
    self.backgroundColor = gray_f3f3f3;
    _bgView = [[UIView alloc] init];
    _bgView.layer.cornerRadius = 4.0f;
    _bgView.layer.masksToBounds = YES;
    _bgView.backgroundColor = [UIColor whiteColor];
    
    _rechargeableTimeLb = [UILabel labelWithFont:fontCommon_13 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];

    
    _rechargeableCodingLb = [UILabel labelWithFont:fontCommon_13 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _rechargeableNumLb = [UILabel labelWithFont:fontCommon_13 textColor:[UIColor redColor] numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _rechargeableStateLb = [UILabel labelWithFont:fontCommon_13 textColor:Color_157efb numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    
    [self addSubview:_bgView];
    [_bgView addSubview:_rechargeableTimeLb];
    [_bgView addSubview:_rechargeableCodingLb];
    [_bgView addSubview:_rechargeableNumLb];
    [_bgView addSubview:_rechargeableStateLb];
}

- (void)updateConstraints
{
    __weak typeof(self) weakSelf = self;
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(zScaleW(13));
        make.right.equalTo(weakSelf).offset(zScaleW(-13));
        make.top.equalTo(weakSelf).offset(zScaleH(10));
        make.bottom.equalTo(weakSelf);
    }];
    
    [_rechargeableTimeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(weakSelf.bgView).offset(zScaleH(8));
        make.left.equalTo(weakSelf.bgView).offset(zScaleW(8));
        
    }];
    
    [_rechargeableCodingLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.rechargeableTimeLb.mas_bottom).offset(zScaleH(8));
        make.left.equalTo(weakSelf.rechargeableTimeLb);
    }];
    
    [_rechargeableNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.bgView).offset(zScaleH(8));
        make.right.equalTo(weakSelf.bgView).offset(zScaleW(-8));
    }];
    
    [_rechargeableStateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.rechargeableNumLb.mas_bottom).offset(zScaleH(8));
        make.right.equalTo(weakSelf.bgView).offset(zScaleW(-8));
    }];
    [super updateConstraints];
}

- (void)setModel:(id)model
{
    _rechargeableTimeLb.text = @"充值时间:2017/02/03";
    _rechargeableCodingLb.text = @"充值代码:372868263823";
    _rechargeableNumLb.text = @"¥1000.00";
    _rechargeableStateLb.text = @"状态:成功";
    [self updateConstraintsIfNeeded];
    
}

@end
