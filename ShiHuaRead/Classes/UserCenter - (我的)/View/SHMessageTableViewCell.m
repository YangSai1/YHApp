//
//  SHMessageTableViewCell.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMessageTableViewCell.h"

@interface SHMessageTableViewCell ()

@property(nonatomic, strong) UIImageView *leftImage;

@property(nonatomic, strong) UILabel *titleLb;

@property(nonatomic, strong) UILabel *subTitleLb;

@property(nonatomic, strong) UILabel *timeLb;

@property(nonatomic, strong) UIView *redTipView;

@property(nonatomic, strong) UIView *lineView;

@end

@implementation SHMessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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
    _leftImage = [[UIImageView alloc] init];
    _leftImage.image = [UIImage imageNamed:@""];
    _leftImage.layer.cornerRadius = zScaleH(15);
    _leftImage.layer.masksToBounds = YES;
    
    _titleLb = [UILabel labelWithFont:font_15 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _subTitleLb = [UILabel labelWithFont:font_13 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _timeLb = [UILabel labelWithFont:font_13 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = Color_E5E5E5;
    
    _redTipView = [[UIView alloc] init];
    _redTipView.backgroundColor = [UIColor redColor];
    _redTipView.layer.cornerRadius = 3;
    _redTipView.layer.masksToBounds = YES;
    
    [self addSubview:_leftImage];
    [self addSubview:_redTipView];
    [self addSubview:_titleLb];
    [self addSubview:_subTitleLb];
    [self addSubview:_timeLb];
    [self addSubview:_lineView];
}

- (void)updateConstraints
{
    __weak typeof(self) weakSelf = self;

    [_leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.left.equalTo(weakSelf).offset(zScaleW(13));
        make.width.height.equalTo(@(zScaleH(40)));
    }];
    
    [_redTipView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftImage.mas_right).offset(-10);
        make.top.equalTo(weakSelf.leftImage.mas_top).offset(5);
        make.width.height.equalTo(@(6));
    }];
    
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftImage.mas_right).offset(zScaleW(18));
        make.top.equalTo(weakSelf.leftImage).offset(zScaleH(2));
        
    }];
    
    [_subTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.titleLb);
        make.top.equalTo(weakSelf.titleLb.mas_bottom).offset(zScaleH(2));
    }];
    
    [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.right.equalTo(weakSelf).offset(zScaleW(-13));
    }];

    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.height.equalTo(@(1.0));
        make.bottom.equalTo(weakSelf);
    }];
    [super updateConstraints];
}

- (void)setText
{
    _titleLb.text = @"测试标题";
    
    _subTitleLb.text = @"测试子标题";
    
    _timeLb.text = @"2017-06-09";
    
    _leftImage.image = [UIImage imageNamed:@"icon-touxiang-110"];
    
    [self updateConstraintsIfNeeded];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
