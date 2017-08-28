//
//  SHICanDetailViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/25.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHICanDetailViewController.h"

#import "SHICanTopView.h"
#import "SHBottomView.h"

@interface SHICanDetailViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIView * blueView;

@property(nonatomic,strong)UIButton * selectedBtn;

@property(nonatomic,strong)UIScrollView * xinxiScrollView;

@property(nonatomic, strong) SHICanTopView *topView;

@property(nonatomic, strong) UIScrollView *scrollview;

@property(nonatomic, strong) UIView *contView;

@property(nonatomic, strong) UIView *barBgView;

@property(nonatomic, strong) UIScrollView *bottomScrollview;

@property(nonatomic, strong) UIView *bottomView;

@end

@implementation SHICanDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"我能详情";
    [self initView];
    [self initData];
}

- (void)initView
{
    __weak typeof(self) weakSelf = self;
    
    [self.view addSubview:self.topView];

    [self initBottomBtn];
    
    [self initBottomScrollView];

    [self setUpBootmView];

    [self.view addSubview:_barBgView];
    [self.view addSubview:_bottomScrollview];
    [self.view addSubview:_bottomView];

    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(130)));
    }];

    [_barBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.topView.mas_bottom).offset(zScaleH(8));
        make.height.equalTo(@(zScaleH(40)));
        
    }];

    [_bottomScrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.barBgView.mas_bottom).offset(zScaleH(8));
        make.bottom.equalTo(weakSelf.bottomView.mas_top).offset(zScaleH(-10));
        
    }];
    
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view);
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(50)));
    }];

}

- (void)initData
{
    if (_model.pics.count != 0) {
        SHICanListImages *imageM = _model.pics[0];
        NSString *path = [NSString stringWithFormat:@"%@%@",BASE_URL,imageM.location];
        [_topView.iconImageView setHeaderWithURL:[NSURL URLWithString:path]];
    }else{
        _topView.iconImageView.image = [UIImage imageNamed:@"icon-60@2x"];
    }
    
    _topView.nameLb.text = _model.realName;
    _topView.skillLb.text = @"12334";
    
    NSString *fadanNumStr = [NSString stringWithFormat:@"发单:%u   成交:%u   投单:%u   中单:%u",arc4random() % 100,arc4random() % 100,arc4random() % 100,arc4random() % 100];
    _topView.fadanNumLb.text = fadanNumStr;
    _topView.fadanGoodLb.text = [NSString stringWithFormat:@"发单好评:%d",arc4random() % 100];
    _topView.fadanBadLb.text = [NSString stringWithFormat:@"发单差评:%d",arc4random() % 100];
    _topView.toudanGoodLb.text = [NSString stringWithFormat:@"投单好评:%d",arc4random() % 100];
    
    _topView.toudanBadLb.text = [NSString stringWithFormat:@"投单差评:%d",arc4random() % 100];
    _topView.detailLb.text = _model.intro;

}

-(void)setUpBootmView
{
    UIView * bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - 50, kScreenWidth, 50)];
    bottomView.backgroundColor = [UIColor whiteColor];
    _bottomView = bottomView;
    [self.view addSubview:_bottomView];
    bottomView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    bottomView.layer.borderWidth = 0.3;
    UIButton * liaoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [liaoButton setTitle:@"聊一聊" forState:UIControlStateNormal];
    [liaoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    liaoButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [liaoButton setBackgroundImage:[UIImage imageNamed:@"icon-229-667.png"] forState:UIControlStateNormal];
    liaoButton.frame = CGRectMake(16, 9, 115, 33);
    [liaoButton addTarget:self action:@selector(liaoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:liaoButton];
    //点赞按钮
    UIColor * seletColor = [UIColor colorWithRed:46/255.0 green:146/255.0 blue:255/255.0 alpha:1.0];
    UIButton * dianZanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [dianZanBtn setImage:[UIImage imageNamed:@"icon-58.png"] forState:UIControlStateNormal];
    [dianZanBtn setTitle:@"点赞: 1000" forState:UIControlStateNormal];
    dianZanBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [dianZanBtn setTitleColor:seletColor forState:UIControlStateNormal];
    [dianZanBtn addTarget:self action:@selector(dianzanClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:dianZanBtn];
    [dianZanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bottomView);
        make.right.equalTo(bottomView).offset(-23);
    }];
    
}

//点击聊一聊
- (void)liaoBtnClick:(UIButton *)btn
{
    
}

//点击点赞
- (void)dianzanClick:(UIButton *)btn
{
    
}

- (void)initBottomScrollView
{
    UIScrollView * xinxiScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 238, kScreenWidth, 340)];
    _bottomScrollview = xinxiScrollView;
    xinxiScrollView.contentSize = CGSizeMake(kScreenWidth * 3, 0);
    xinxiScrollView.pagingEnabled = YES;
    xinxiScrollView.showsVerticalScrollIndicator = NO;
    xinxiScrollView.showsHorizontalScrollIndicator = NO;
    xinxiScrollView.delegate = self;
    for (int i = 0; i < 3; i ++) {
        SHBottomView * xinxiBottomView = [[SHBottomView alloc]init];
        for (UIImageView * zhaopianImage in xinxiBottomView.imagesView.subviews) {
            zhaopianImage.image = [UIImage imageNamed:@"icon-60@2x"];
        }
        
        xinxiBottomView.model = _model;
        xinxiBottomView.frame = CGRectMake(i * kScreenWidth, 0, kScreenWidth, kScreenHeight - zScaleH(125 + 40 + 8 + 8 + 50 + 10));
        [xinxiScrollView addSubview:xinxiBottomView];
        xinxiBottomView.xinxiOne.text = [NSString stringWithFormat:@"详细姓名: 扯犊子%d",i];
    }
}
-(void)initBottomBtn
{
    UIView * BigView = [[UIView alloc]initWithFrame:CGRectMake(0, zScaleH(260 + 40 + 8 + 8), kScreenWidth, zScaleH(40))];
    BigView.backgroundColor = [UIColor whiteColor];
    _barBgView = BigView;
    
    UIView * buttonView = [[UIView alloc]initWithFrame:CGRectMake(zScaleW(5), 0, kScreenWidth - zScaleW(10), zScaleH(40))];
    
    buttonView.backgroundColor = [UIColor whiteColor];
    
    NSArray * titles = @[@"群众演员",@"专业模特",@"武术替身"];
    CGFloat buttonW = (kScreenWidth - zScaleW(10))/3;
    UIView * grayView = [[UIView alloc]initWithFrame:CGRectMake(buttonW, zScaleH(5), 1, zScaleH(30))];
    grayView.backgroundColor = Color_E5E5E5;
    
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake((buttonW) * 2 + 1, zScaleH(5), 1, zScaleH(30))];
    lineView.backgroundColor = Color_E5E5E5;

    [buttonView addSubview:grayView];
    [buttonView addSubview:lineView];

    for (int i = 0; i < titles.count; i ++) {
        
        UIButton * button = [[UIButton alloc]init];
        
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:Color_157efb forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(i * (buttonW + 1), 0, buttonW, 40);
        button.tag = i + 5;
        [button addTarget:self action:@selector(xuanZeClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            [self xuanZeClick:button];
        }
        [buttonView addSubview:button];
    }
    UIView * blueView = [[UIView alloc]initWithFrame:CGRectMake(0, zScaleH(40), buttonW, 1)];
    blueView.backgroundColor = Color_157efb;
    self.blueView = blueView;
    [buttonView addSubview:blueView];
    [BigView addSubview:buttonView];
}
#pragma UIScrollViewDelegate
/**
 人气拖动的时候，滚动动画结束时调用
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    if (point.x >= 0 ) {
        NSInteger index = scrollView.contentOffset.x / scrollView.width;
        [self changeXinXiView:index];
        [self changeSelectedBtn:index + 5];
    }
}

- (void)changeSelectedBtn:(NSInteger)currentAge{
    UIButton * selectedBtn = (UIButton *)[self.view viewWithTag:currentAge];
    selectedBtn.selected = YES;
    self.selectedBtn.selected = NO;
    self.selectedBtn = selectedBtn;
}

//点击按钮
- (void)xuanZeClick:(UIButton *)btn
{
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
    NSInteger number = btn.tag - 5;
    [self changeXinXiView:number];
}

//设置滚动视图和设置展示页的转换
- (void)changeXinXiView:(NSInteger)currentpage
{
    CGFloat buttonW = (kScreenWidth - zScaleW(13))/3;
    //下标的滚动到指定按钮下
    [UIView animateWithDuration:0.3 animations:^{
        self.blueView.frame = CGRectMake(currentpage * (buttonW + 1),zScaleH(40), buttonW, 1);
    }];
    //展示页的转换
    self.xinxiScrollView.contentOffset = CGPointMake(currentpage * kScreenWidth, 0);
}


- (void)setModel:(SHICanListData *)model
{
    _model = model;
}

#pragma mark - setter/getter
- (SHICanTopView *)topView
{
    if (!_topView) {
        _topView = [[SHICanTopView alloc] init];
    }
    return _topView;
}

@end
