//
//  SHHomeDetailTopView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHHomeDetailTopView.h"

@interface SHHomeDetailTopView ()

@property(nonatomic, strong) UIImageView *leftImageView;

@property(nonatomic, strong) UIImageView *toudanNumV;

@property(nonatomic, strong) UILabel *toudanNumLb;

@property(nonatomic, strong) UILabel *yingshiTypeLb;

@property(nonatomic, strong) UILabel *yingshiCodeLb;

@property(nonatomic, strong) UILabel *yingshiDiQuLn;

@property(nonatomic, strong) UILabel *yingshiDiZhiLb;

@property(nonatomic, strong) UILabel *yingshiYuSuan;

@property(nonatomic, strong) UILabel *titleLb;

@property(nonatomic, strong) UIImageView *gonggaoLeftV;

@property(nonatomic, strong) UILabel *gonggaoLb;

@property(nonatomic, strong) UIImageView *gongxuanLeftV;

@property(nonatomic, strong) UILabel *gongxuanLb;

@property(nonatomic, strong) UIImageView *hezuoleftV;

@property(nonatomic, strong) UILabel *hezuoLb;

@property(nonatomic, strong) UIImageView *righrImageV;

@property(nonatomic, strong) UILabel *rightLb;

@property(nonatomic, strong) UIView *bgView;

@end

@implementation SHHomeDetailTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    //    __weak typeof(self) weakSelf = self;
    
    self.backgroundColor = gray_f3f3f3;
    _bgView = [[UIView alloc] init];
    _bgView.backgroundColor = [UIColor whiteColor];
    
    _leftImageView = [[UIImageView alloc] init];
    _leftImageView.image = [UIImage imageNamed:@"icon-tupian-183-221"];
    
    _toudanNumV = [[UIImageView alloc] init];
    _toudanNumV.image = [UIImage imageNamed:@"icon-yitoudan-26"];

    _toudanNumLb = [UILabel labelWithFont:font_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];

    _titleLb = [UILabel labelWithFont:font_15 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _yingshiTypeLb = [UILabel labelWithFont:font_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];

    _yingshiCodeLb = [UILabel labelWithFont:font_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];

    _yingshiDiQuLn = [UILabel labelWithFont:font_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];

    _yingshiDiZhiLb = [UILabel labelWithFont:font_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];

    _yingshiYuSuan = [UILabel labelWithFont:font_12 textColor:Color_157efb numberOfLines:1 textAlignment:NSTextAlignmentLeft];

    _gonggaoLeftV = [[UIImageView alloc] init];
    _gonggaoLeftV.image = [UIImage imageNamed:@"icon-gonggaoqi-36"];
    
    _gonggaoLb = [UILabel labelWithFont:font_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    
    _gongxuanLeftV = [[UIImageView alloc] init];
    _gongxuanLeftV.image = [UIImage imageNamed:@"icon-shangchuangshijinag-32"];
    
    _gongxuanLb = [UILabel labelWithFont:font_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    
    _hezuoleftV = [[UIImageView alloc] init];
    _hezuoleftV.image = [UIImage imageNamed:@"hezuoqi-32icon-"];
    _hezuoLb = [UILabel labelWithFont:font_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    
    _righrImageV = [[UIImageView alloc] init];
    _righrImageV.image = [UIImage imageNamed:@"icon-shuliang-31"];
    
    _rightLb = [UILabel labelWithFont:font_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _toudanNumLb = [UILabel labelWithFont:font_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    [self addSubview:_bgView];
    [_bgView addSubview:_leftImageView];
    [_bgView addSubview:_toudanNumV];
    [_bgView addSubview:_toudanNumLb];
    [_bgView addSubview:_yingshiTypeLb];
    [_bgView addSubview:_yingshiCodeLb];
    [_bgView addSubview:_yingshiDiQuLn];
    [_bgView addSubview:_yingshiDiZhiLb];
    [_bgView addSubview:_yingshiYuSuan];
    [_bgView addSubview:_titleLb];
    [_bgView addSubview:_gonggaoLeftV];
    [_bgView addSubview:_gonggaoLb];
    [_bgView addSubview:_gongxuanLeftV];
    [_bgView addSubview:_gongxuanLb];
    [_bgView addSubview:_hezuoleftV];
    [_bgView addSubview:_hezuoLb];
    [_bgView addSubview:_righrImageV];
    [_bgView addSubview:_rightLb];
    [_bgView addSubview:_toudanNumLb];
    
}

- (void)updateConstraints
{
    __weak typeof(self) weakSelf = self;
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(zScaleW(5));
        make.right.equalTo(weakSelf).offset(zScaleW(-5));
        make.top.equalTo(weakSelf).offset(zScaleH(10));
        make.bottom.equalTo(weakSelf);
    }];
    
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(weakSelf.bgView).offset(zScaleH(10));
        make.width.equalTo(@(zScaleW(92)));
        make.height.equalTo(@(zScaleH(130)));
    }];
    
    [_toudanNumV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftImageView).offset(zScaleW(5));
        make.top.equalTo(weakSelf.leftImageView.mas_bottom).offset(zScaleH(8));
        make.width.height.equalTo(@(zScaleH(10)));

    }];
    
    [_toudanNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.toudanNumV.mas_right).offset(zScaleW(10));
        make.centerY.equalTo(weakSelf.toudanNumV);
    }];
    
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.leftImageView).offset(zScaleH(2));
        make.left.equalTo(weakSelf.leftImageView.mas_right).offset(zScaleW(22));
    }];
    
    [_yingshiTypeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.titleLb);
        make.top.equalTo(weakSelf.titleLb.mas_bottom).offset(zScaleH(8));
    }];
    
    [_yingshiCodeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.titleLb);
        make.top.equalTo(weakSelf.yingshiTypeLb.mas_bottom).offset(zScaleH(8));
    }];

    [_yingshiDiQuLn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.titleLb);
        make.top.equalTo(weakSelf.yingshiCodeLb.mas_bottom).offset(zScaleH(8));
    }];

    [_yingshiDiZhiLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.titleLb);
        make.top.equalTo(weakSelf.yingshiDiQuLn.mas_bottom).offset(zScaleH(8));
    }];

    [_yingshiYuSuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.titleLb);
        make.top.equalTo(weakSelf.yingshiDiZhiLb.mas_bottom).offset(zScaleH(8));
    }];

    [_gonggaoLeftV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.titleLb);
        make.top.equalTo(weakSelf.yingshiYuSuan.mas_bottom).offset(zScaleH(8));
        make.width.height.equalTo(@(zScaleH(12)));
    }];
    
    [_gonggaoLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.gonggaoLeftV.mas_right).offset(zScaleW(6));
        make.centerY.equalTo(weakSelf.gonggaoLeftV);
    }];
    
    [_gongxuanLeftV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.gonggaoLeftV);
        make.top.equalTo(weakSelf.gonggaoLeftV.mas_bottom).offset(zScaleH(14));
        make.width.height.equalTo(@(zScaleH(12)));
    }];
    
    [_gongxuanLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.gongxuanLeftV.mas_right).offset(zScaleW(6));
        make.centerY.equalTo(weakSelf.gongxuanLeftV);
    }];
    
    [_hezuoleftV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.gongxuanLeftV);
        make.top.equalTo(weakSelf.gongxuanLeftV.mas_bottom).offset(zScaleH(14));
        make.width.height.equalTo(@(zScaleH(12)));
    }];
    
    [_hezuoLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.hezuoleftV.mas_right).offset(zScaleW(6));
        make.centerY.equalTo(weakSelf.hezuoleftV);
    }];
    
    [_rightLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.bgView).offset(-10);
        make.bottom.equalTo(weakSelf.titleLb);
    }];
    
    [_righrImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.rightLb.mas_left).offset(-10);
        make.centerY.equalTo(weakSelf.rightLb);
        make.width.height.equalTo(@(zScaleH(12)));
        
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
    
    _titleLb.text = model.title;
    
    NSString *timeStr = [EBUtility getDateFromTimestampString:model.noticeTime];
    
    NSString *timeEndStr;
    
    if (model.exeTime.length > 10) {
        timeEndStr = [model.exeTime substringToIndex:10];
    }
    
    timeStr = [NSString stringWithFormat:@"公告期:至 %@",timeEndStr];
    
    
    _gonggaoLb.text = timeStr;
    //    _HomeCellGongXuan.text = @"";
    _gongxuanLb.text = [NSString stringWithFormat:@"公选期:%d天",arc4random() % 10];
    _hezuoLb.text = @"合作期:2017.09.03 - 2017.09.05";
    _rightLb.text = [NSString stringWithFormat:@"%d人",arc4random() % 300];

    NSString *yunsuanTitle = [NSString stringWithFormat:@"预算:¥%@-%@",@"123",@"124"];
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:yunsuanTitle];
    [text addAttribute:NSForegroundColorAttributeName value:Color_a4a5a4 range:NSMakeRange(0, 2)];
    _toudanNumLb.text = @"已投单:100";
    _yingshiTypeLb.text = @"影视类型:院线影视";
    _yingshiCodeLb.text = @"拍摄许可证:13455656565";
    _yingshiDiQuLn.text = @"地区:上海 浦东区";
    _yingshiDiZhiLb.text = @"地址:上海破洞去天幕上卢";
    
    _yingshiYuSuan.attributedText = text;

}

- (void)text
{
    _leftImageView.image = [UIImage imageNamed:@"icon-60@2x"];
    
    _titleLb.text = @"测试标题";
    _gonggaoLb.text = [NSString stringWithFormat:@"公告期:至 %@",@"2015-09-03"];
    _gongxuanLb.text = [NSString stringWithFormat:@"公选期:1天"];
    _hezuoLb.text = @"合作期:2017.09.03-2017.09.05";
    _rightLb.text = [NSString stringWithFormat:@"%d人",arc4random() % 300];
    _toudanNumLb.text = @"已投单:100";
    _yingshiTypeLb.text = @"影视类型:院线影视";
    _yingshiCodeLb.text = @"拍摄许可证:13455656565";
    _yingshiDiQuLn.text = @"地区:上海 浦东区";
    _yingshiDiZhiLb.text = @"地址:上海破洞去天幕上卢";
    
    NSString *yunsuanTitle = [NSString stringWithFormat:@"预算:¥%@-%@",@"123",@"124"];
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:yunsuanTitle];
    [text addAttribute:NSForegroundColorAttributeName value:Color_a4a5a4 range:NSMakeRange(0, 2)];
    _yingshiYuSuan.attributedText = text;

    [self updateConstraintsIfNeeded];

}
@end
