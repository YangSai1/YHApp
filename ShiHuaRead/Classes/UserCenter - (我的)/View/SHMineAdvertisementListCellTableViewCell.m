//
//  SHMineAdvertisementListCellTableViewCell.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/13.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMineAdvertisementListCellTableViewCell.h"

@interface SHMineAdvertisementListCellTableViewCell ()

@property(nonatomic, copy) PingLunClickBlock block;

@property(nonatomic, strong) UIImageView *leftImageView;

@property(nonatomic, strong) UILabel *titleLb;

@property(nonatomic, strong) UIImageView *timeLeftV;

@property(nonatomic, strong) UILabel *timeLb;

@property(nonatomic, strong) UIImageView *adressLeftV;

@property(nonatomic, strong) UILabel *adressLb;

@property(nonatomic, strong) UIImageView *peopleleftV;

@property(nonatomic, strong) UILabel *peopleLb;

@property(nonatomic, strong) UIImageView *righrImageV;

@property(nonatomic, strong) UILabel *rightLb;

@property(nonatomic, strong) UIView *bgView;

@property(nonatomic, strong) UILabel *toudanNumLb;

@property(nonatomic, strong) UIButton *pinlunBtn;

@end

@implementation SHMineAdvertisementListCellTableViewCell

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
    __weak typeof(self) weakSelf = self;

    self.backgroundColor = gray_f3f3f3;
    _bgView = [[UIView alloc] init];
    _bgView.backgroundColor = [UIColor whiteColor];
    
    _leftImageView = [[UIImageView alloc] init];
    _leftImageView.image = [UIImage imageNamed:@"icon-tupian-183-221"];
    
    _titleLb = [UILabel labelWithFont:fontCommon_15 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];

    _timeLeftV = [[UIImageView alloc] init];
    _timeLeftV.image = [UIImage imageNamed:@"icon-gonggaoqi-36"];
    
    _timeLb = [UILabel labelWithFont:fontCommon_13 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];

    
    _adressLeftV = [[UIImageView alloc] init];
    _adressLeftV.image = [UIImage imageNamed:@"icon-gonggaoqi-36"];

    _adressLb = [UILabel labelWithFont:fontCommon_13 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];

    
    _peopleleftV = [[UIImageView alloc] init];
    _peopleleftV.image = [UIImage imageNamed:@"icon-zhongdanfang-31"];
    _peopleLb = [UILabel labelWithFont:fontCommon_13 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];

    _righrImageV = [[UIImageView alloc] init];
    _righrImageV.image = [UIImage imageNamed:@"icon-shuliang-31"];
    _rightLb = [UILabel labelWithFont:fontCommon_13 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];

    _toudanNumLb = [UILabel labelWithFont:fontCommon_13 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _pinlunBtn = [[UIButton alloc] init];
    [_pinlunBtn setTitle:@"评价" forState:UIControlStateNormal];
    [_pinlunBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _pinlunBtn.layer.cornerRadius = 4;
    _pinlunBtn.titleLabel.font = font_14;
    _pinlunBtn.layer.masksToBounds = YES;
    _pinlunBtn.backgroundColor = Color(@"157efb");
    [_pinlunBtn addActionBlock:^(UIButton *sender) {
        if (weakSelf.block) {
            weakSelf.block(weakSelf.model);
        }
    }];
    [self addSubview:_bgView];
    [_bgView addSubview:_leftImageView];
    [_bgView addSubview:_titleLb];
    [_bgView addSubview:_timeLeftV];
    [_bgView addSubview:_timeLb];
    [_bgView addSubview:_adressLeftV];
    [_bgView addSubview:_adressLb];
    [_bgView addSubview:_peopleleftV];
    [_bgView addSubview:_peopleLb];
    [_bgView addSubview:_righrImageV];
    [_bgView addSubview:_rightLb];
    [_bgView addSubview:_toudanNumLb];
    [_bgView addSubview:_pinlunBtn];
}

- (void)updateConstraints
{
    __weak typeof(self) weakSelf = self;
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(5);
        make.right.equalTo(weakSelf).offset(-5);
        make.top.equalTo(weakSelf).offset(10);
        make.bottom.equalTo(weakSelf);

    }];
    
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(weakSelf.bgView).offset(zScaleH(8));
        make.width.equalTo(@(zScaleW(92)));
        make.bottom.equalTo(weakSelf).offset(zScaleH(-10));

    }];
    
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.leftImageView).offset(zScaleH(8));
        make.left.equalTo(weakSelf.leftImageView.mas_right).offset(zScaleW(26));
    }];
    
    [_timeLeftV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftImageView.mas_right).offset(zScaleW(26));
        make.top.equalTo(weakSelf.titleLb.mas_bottom).offset(zScaleH(8));
        make.width.height.equalTo(@(zScaleH(13)));
    }];
    
    [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.timeLeftV.mas_right).offset(zScaleW(12));
        make.centerY.equalTo(weakSelf.timeLeftV);
    }];
    
    [_adressLeftV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.timeLeftV);
        make.top.equalTo(weakSelf.timeLeftV.mas_bottom).offset(zScaleH(14));
        make.width.height.equalTo(@(zScaleH(13)));
    }];
    
    [_adressLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.adressLeftV.mas_right).offset(zScaleW(12));
        make.centerY.equalTo(weakSelf.adressLeftV);
    }];
    
    [_peopleleftV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.adressLeftV);
        make.top.equalTo(weakSelf.adressLeftV.mas_bottom).offset(zScaleH(14));
        make.width.height.equalTo(@(zScaleH(13)));
    }];
    
    [_peopleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.peopleleftV.mas_right).offset(zScaleW(12));
        make.centerY.equalTo(weakSelf.peopleleftV);
    }];
    
    [_rightLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.bgView).offset(-10);
        make.centerY.equalTo(weakSelf.titleLb);

    }];
    
    [_righrImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.rightLb.mas_left).offset(-10);
        make.centerY.equalTo(weakSelf.rightLb);
        make.width.height.equalTo(@(zScaleH(13)));

    }];
    
    [_toudanNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.peopleLb.mas_bottom).offset(zScaleH(2));
        make.left.equalTo(weakSelf.peopleLb);

    }];
    
    [_pinlunBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.bgView).offset(zScaleW(-8));
        make.bottom.equalTo(weakSelf.bgView).offset(zScaleH(zScaleH(-20)));
        make.height.equalTo(@(zScaleH(20)));
        make.width.equalTo(@(zScaleW(50)));

    }];
    [super updateConstraints];
}

- (void)setModel:(AdvertisementList *)model
{
    _model = model;
    
    if (model.pics.count != 0) {
        SHQuerySkillImages *imageM = model.pics[0];
        NSString *path = [NSString stringWithFormat:@"%@%@",BASE_URL,imageM.location];
        [_leftImageView setHeaderWithURL:[NSURL URLWithString:path]];
    }else{
        _leftImageView.image = [UIImage imageNamed:@"icon-60@2x"];
    }
    
    NSString *timeStr = [EBUtility getDateFromTimestampString:model.noticeTime];
    
    NSString *timeEndStr;

    if (model.exeTime.length > 10) {
        timeEndStr = [model.exeTime substringToIndex:10];
    }
    
    timeStr = [NSString stringWithFormat:@"公告期: %@ - %@",timeStr,timeEndStr];
    
    _titleLb.text = model.title;
    _timeLb.text = timeStr;
    _adressLb.text = model.detailAddress;
    _peopleLb.text = [NSString stringWithFormat:@"投单数：%d人",arc4random() % 300];
    _rightLb.text = [NSString stringWithFormat:@"%d人",arc4random() % 100] ;
    [self updateConstraintsIfNeeded];

}

- (void)setToudanModel:(SHMineTouDanListData *)toudanModel
{
    _toudanNumLb.text = @"投单编号:12345656676";

}

- (void)registBlock:(PingLunClickBlock)block
{
    _block = block;
}
@end
