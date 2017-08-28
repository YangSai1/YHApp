//
//  SHMinePointsTableViewCell.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMinePointsTableViewCell.h"

@interface SHMinePointsTableViewCell ()

@property(nonatomic, strong) UIImageView *leftImageV;

@property(nonatomic, strong) UILabel *titleLb;

@property(nonatomic, strong) UILabel *subTitleLb;

@property(nonatomic, strong) UILabel *rightLb;

@property(nonatomic, strong) UIView *lineView;

@end

@implementation SHMinePointsTableViewCell

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
    _leftImageV = [[UIImageView alloc] init];
    _leftImageV.image = [UIImage imageNamed:@"icon-huidawenti-26"];
    
    _titleLb  = [UILabel labelWithFont:font_13 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _subTitleLb  = [UILabel labelWithFont:font_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];

    _rightLb  = [UILabel labelWithFont:font_13 textColor:[UIColor redColor] numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = Color_E5E5E5;
    
    [self addSubview:_leftImageV];
    [self addSubview:_titleLb];
    [self addSubview:_subTitleLb];
    [self addSubview:_rightLb];
    [self addSubview:_lineView];

}

- (void)updateConstraints
{
    __weak typeof(self) weakSelf = self;

    [_leftImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.lineView);
        make.top.equalTo(weakSelf).offset(zScaleH(10));
        make.width.height.equalTo(@(zScaleH(12)));
    }];
    
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftImageV.mas_right).offset(zScaleW(5));
        make.centerY.equalTo(weakSelf.leftImageV);
    }];
    
    [_subTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.titleLb);
        make.top.equalTo(weakSelf.titleLb.mas_bottom).offset(zScaleH(1));
    }];
    
    [_rightLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).offset(zScaleW(-20));
        make.centerY.equalTo(weakSelf);
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(zScaleW(13));
        make.right.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf);
        make.height.equalTo(@(1));
    }];
    
    [super updateConstraints];
    
}

- (void)text
{
    _titleLb.text = @"测试测试测试";
    _subTitleLb.text = @"2017-07-09 13:20:03";
    _rightLb.text = @"+20";
    
    [self updateConstraintsIfNeeded];
}

@end
