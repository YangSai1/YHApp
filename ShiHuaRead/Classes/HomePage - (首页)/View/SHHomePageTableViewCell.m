//
//  SHHomePageTableViewCell.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHHomePageTableViewCell.h"

@interface SHHomePageTableViewCell ()

@property(nonatomic, strong) UIImageView *leftImageView;

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

@property(nonatomic, strong) UIView *lineView;

@property(nonatomic, strong) UILabel *toudanNumLb;

@property(nonatomic, strong) UIButton *yusuanBtn;

@property(nonatomic, strong) UILabel *btnTitleLb;

@property(nonatomic, strong) UILabel *btnSubTitleLb;

@end

@implementation SHHomePageTableViewCell

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
//    __weak typeof(self) weakSelf = self;
    
    self.backgroundColor = gray_f3f3f3;
    _bgView = [[UIView alloc] init];
    _bgView.backgroundColor = [UIColor whiteColor];
    
    _leftImageView = [[UIImageView alloc] init];
    _leftImageView.image = [UIImage imageNamed:@"icon-tupian-183-221"];
    
    _titleLb = [UILabel labelWithFont:fontCommon_15 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _gonggaoLeftV = [[UIImageView alloc] init];
    _gonggaoLeftV.image = [UIImage imageNamed:@"icon-gonggaoqi-36"];
    
    _gonggaoLb = [UILabel labelWithFont:font_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    
    _gongxuanLeftV = [[UIImageView alloc] init];
    _gongxuanLeftV.image = [UIImage imageNamed:@"icon-shangchuangshijinag-32"];
    
    _gongxuanLb = [UILabel labelWithFont:font_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    
    _hezuoleftV = [[UIImageView alloc] init];
    _hezuoleftV.image = [UIImage imageNamed:@"hezuoqi-32icon-"];
    _hezuoLb = [UILabel labelWithFont:font_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = Color_E5E5E5;
    
    _righrImageV = [[UIImageView alloc] init];
    _righrImageV.image = [UIImage imageNamed:@"icon-shuliang-31"];
    _rightLb = [UILabel labelWithFont:font_13 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _toudanNumLb = [UILabel labelWithFont:font_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _yusuanBtn = [[UIButton alloc] init];
    _yusuanBtn.layer.cornerRadius = 4;
    _yusuanBtn.layer.masksToBounds = YES;
    _yusuanBtn.backgroundColor = RGB(57, 155, 255);
    [_yusuanBtn addActionBlock:^(UIButton *sender) {
        
    }];
    
    _btnTitleLb = [UILabel labelWithFont:font_9 textColor:[UIColor whiteColor] numberOfLines:1 textAlignment:NSTextAlignmentCenter];
    _btnTitleLb.text = @"预算";
    
    _btnSubTitleLb = [UILabel labelWithFont:font_9 textColor:[UIColor whiteColor] numberOfLines:1 textAlignment:NSTextAlignmentCenter];

    [self addSubview:_bgView];
    [_bgView addSubview:_leftImageView];
    [_bgView addSubview:_titleLb];
    [_bgView addSubview:_gonggaoLeftV];
    [_bgView addSubview:_gonggaoLb];
    [_bgView addSubview:_gongxuanLeftV];
    [_bgView addSubview:_gongxuanLb];
    [_bgView addSubview:_hezuoleftV];
    [_bgView addSubview:_hezuoLb];
    [_bgView addSubview:_lineView];
    [_bgView addSubview:_righrImageV];
    [_bgView addSubview:_rightLb];
    [_bgView addSubview:_toudanNumLb];
    [_bgView addSubview:_yusuanBtn];
    
    [_yusuanBtn addSubview:_btnTitleLb];
    [_yusuanBtn addSubview:_btnSubTitleLb];

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
        make.top.left.equalTo(weakSelf.bgView).offset(zScaleH(8));
        make.width.equalTo(@(zScaleW(92)));
        make.bottom.equalTo(weakSelf).offset(zScaleH(-10));
    }];
    
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.leftImageView).offset(zScaleH(8));
        make.left.equalTo(weakSelf.leftImageView.mas_right).offset(zScaleW(26));
    }];
    
    [_gonggaoLeftV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftImageView.mas_right).offset(zScaleW(13));
        make.top.equalTo(weakSelf.titleLb.mas_bottom).offset(zScaleH(8));
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
        make.right.equalTo(weakSelf.lineView.mas_left);

        make.centerY.equalTo(weakSelf.hezuoleftV);
    }];
    
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.bgView).offset(zScaleW(-70));
        make.top.equalTo(weakSelf.bgView).offset(zScaleH(20));
        make.bottom.equalTo(weakSelf.bgView).offset(zScaleH(-20));
        make.width.equalTo(@(1));
    }];
    
    [_rightLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.bgView).offset(-10);
        make.centerY.equalTo(weakSelf.titleLb).offset(zScaleH(5));
    }];
    
    [_righrImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.rightLb.mas_left).offset(-10);
        make.centerY.equalTo(weakSelf.rightLb);
        make.width.height.equalTo(@(zScaleH(13)));
        
    }];
    
    [_yusuanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.bgView).offset(zScaleW(-7));
        make.bottom.equalTo(weakSelf.bgView).offset(zScaleH(-40));
        make.height.equalTo(@(zScaleH(30)));
        make.width.equalTo(@(zScaleW(55)));
        
    }];
    
    [_btnTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.yusuanBtn);
        make.left.right.equalTo(weakSelf.yusuanBtn);
    }];
    
    [_btnSubTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.btnTitleLb.mas_bottom);
        make.left.right.equalTo(weakSelf.yusuanBtn);
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
    NSString *yunsuanTitle = [NSString stringWithFormat:@"¥%@-%@",model.budgetStart,model.budgetEnd];
    _btnSubTitleLb.text = yunsuanTitle;
    
    [self updateConstraintsIfNeeded];
}

- (void)text
{
    _leftImageView.image = [UIImage imageNamed:@"icon-60@2x"];
    
    _titleLb.text = @"测试标题";
    _gonggaoLb.text = [NSString stringWithFormat:@"公告期:至 %@",@"2015-09-03"];
    _gongxuanLb.text = [NSString stringWithFormat:@"公选期:1天"];
    _hezuoLb.text = @"合作期:2017.09.03-2017.09.05";

    _rightLb.text = [NSString stringWithFormat:@"%d人",arc4random() % 300];


}
@end
