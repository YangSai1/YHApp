//
//  SHMyTIntellectualCell.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMyTIntellectualCell.h"

@interface SHMyTIntellectualCell ()

@property(nonatomic, strong) UILabel *titleLb;

@property(nonatomic, strong) UILabel *estimateLb; // 估价

@property(nonatomic, strong) UILabel *timeLb;

@property(nonatomic, strong) UIImageView *timeLeftV;

@property(nonatomic, strong) UIView *bgView;

@property(nonatomic, strong) UIView *lineView;

@end


@implementation SHMyTIntellectualCell

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
    
    _titleLb = [UILabel labelWithFont:fontCommon_14 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    
    _estimateLb = [UILabel labelWithFont:fontCommon_14 textColor:[UIColor redColor] numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = Color_E5E5E5;
    
    _timeLeftV = [[UIImageView alloc] init];
    _timeLeftV.image = [UIImage imageNamed:@"icon-shangchuangshijinag-32"];
    _timeLb = [UILabel labelWithFont:fontCommon_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    
    [self addSubview:_bgView];
    [_bgView addSubview:_titleLb];
    [_bgView addSubview:_estimateLb];
    [_bgView addSubview:_lineView];
    [_bgView addSubview:_timeLeftV];
    [_bgView addSubview:_timeLb];
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
    
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(weakSelf.bgView).offset(zScaleH(10));
        make.left.equalTo(weakSelf.bgView).offset(zScaleW(8));
    }];
    
    [_estimateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.titleLb);
        make.right.equalTo(weakSelf.bgView).offset(zScaleW(-13));
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLb.mas_bottom).offset(zScaleH(10));
        make.left.equalTo(weakSelf.bgView).offset(zScaleW(8));
        make.right.equalTo(weakSelf.bgView);
        make.height.equalTo(@(1));
    }];
    
    [_timeLeftV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lineView.mas_bottom).offset(zScaleH(8));
        make.left.equalTo(weakSelf.lineView);
        make.height.equalTo(@(zScaleH(15)));
        make.width.equalTo(@(zScaleW(15)));

    }];
    
    [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.timeLeftV);
        make.left.equalTo(weakSelf.timeLeftV.mas_right).offset(zScaleW(3));
    }];
    [super updateConstraints];
}

- (void)setModel:(id)model
{
    _titleLb.text = @"知识产权评估text";
    _estimateLb.text = @"估价:2000.00";
    _timeLb.text = @"上传时间:2017/09/03 20:00";
    [self updateConstraintsIfNeeded];
    
}

@end
