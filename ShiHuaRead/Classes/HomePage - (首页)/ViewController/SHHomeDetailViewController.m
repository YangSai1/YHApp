//
//  SHHomeDetailViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/9.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHHomeDetailViewController.h"
#import "SHHomeDetailTopView.h"
#import "SHSkillView.h"
#import "SHHomeXiangqingCell.h"

#import "SHTouDanExplainedViewController.h"

@interface SHHomeDetailViewController ()

@property(nonatomic, strong) UIScrollView *scrollview;

@property(nonatomic, strong) UIView *contView;

@property(nonatomic, strong) SHHomeDetailTopView *topView;

@property(nonatomic, strong) SHSkillView *skillView;


@end

@implementation SHHomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"公告详情";
    
    [self initView];
    
    [self creatBottomBarView];

}


- (void)initView
{
    _scrollview = [[UIScrollView alloc] init];
    
    _contView = [[UIView alloc] init];
    
    [_scrollview addSubview:_contView];
    
    [self.view addSubview:_scrollview];
    
    __weak typeof(self) weakSelf = self;
    
    
    [_scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.view);
        make.left.right.equalTo(weakSelf.view);
        make.bottom.equalTo(weakSelf.view).offset(zScaleH(-56));

    }];
    
    [_contView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(weakSelf.scrollview);
        make.width.equalTo(weakSelf.scrollview);
        
    }];
    
    _topView = [[SHHomeDetailTopView alloc] init];
    
    _topView.model = _model;
    
    _skillView = [[SHSkillView alloc] init];
    _skillView.titleArray = @[@"哈哈哈哈",@"哈哈哈啥",@"好好",@"啥也是个",@"婚纱",@"沙克斯"];
    
    UILabel *miaoShuTitle = [UILabel labelWithFont:font_15 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    miaoShuTitle.text = @"需求描述";
    
    UIView *miaoShuBgView = [[UIView alloc] init];
    miaoShuBgView.backgroundColor = [UIColor whiteColor];
    miaoShuBgView.layer.cornerRadius = 5.0f;
    UILabel *miaoshuDetailLb = [UILabel labelWithFont:font_11 textColor:Color_a4a5a4 numberOfLines:0 textAlignment:NSTextAlignmentLeft];
    
    miaoshuDetailLb.text = @"  般都是负责影片前期的市场调查，看类似的影片的电影市场是否有前景（比如说票房情况、受欢迎程度、续集的可能性等），通过调查来决定是否值得出品该影片。如果答案是肯定的，那他们就找到所属的电影集团投资制片人及相关人员，开始选导演、剧本、演员、赞助商等。般都是负责影片前期的市场调查，看类似的影片的电影市场是否有前景（比如说票房情况、受欢迎程度、续集的可能性等），通过调查来决定是否值得出品该影片。如果答案是肯定的，那他们就找到所属的电影集团投资制片人及相关人员，开始选导演、剧本、演员、赞助商等。般都是负责影片前期的市场调查，看类似的影片的电影市场是否有前景（比如说票房情况、受欢迎程度、续集的可能性等），通过调查来决定是否值得出品该影片。如果答案是肯定的，那他们就找到所属的电影集团投资制片人及相关人员，开始选导演、剧本、演员、赞助商等。";
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5;// 字体的行间距
    paragraphStyle.firstLineHeadIndent = 20.0f;//首行缩进
    
    NSDictionary *attributes = @{
                                 NSParagraphStyleAttributeName:paragraphStyle,
                                 };
    miaoshuDetailLb.attributedText = [[NSAttributedString alloc] initWithString:miaoshuDetailLb.text attributes:attributes];

    [_contView addSubview:_topView];
    [_contView addSubview:_skillView];
    [_contView addSubview:miaoShuTitle];
    [_contView addSubview:miaoShuBgView];
    [_contView addSubview:miaoshuDetailLb];
    
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contView);
        make.left.equalTo(weakSelf.contView);
        make.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(zScaleH(300)));
    }];
    
    [_skillView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.topView.mas_bottom).offset(zScaleH(10));
        make.left.equalTo(weakSelf.contView).offset(zScaleW(5));
        make.right.equalTo(weakSelf.contView).offset(zScaleW(-5));
        make.height.equalTo(@(zScaleH(30)));
    }];
    
    [miaoShuTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.skillView.mas_bottom);
        make.left.equalTo(weakSelf.contView).offset(zScaleW(15));
        make.right.equalTo(weakSelf.contView).offset(zScaleW(-15));
        make.height.equalTo(@(zScaleH(35)));
    }];
    
    [miaoShuBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(miaoShuTitle.mas_bottom);
        make.left.equalTo(weakSelf.contView).offset(zScaleW(5));
        make.right.equalTo(weakSelf.contView).offset(zScaleW(-5));
        make.bottom.equalTo(weakSelf.contView).offset(zScaleH(-10));
    }];
    
    [miaoshuDetailLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(miaoShuBgView).offset(zScaleH(10));
        make.left.equalTo(miaoShuBgView).offset(zScaleW(15));
        make.right.equalTo(miaoShuBgView).offset(zScaleW(-15));
        make.bottom.equalTo(miaoShuBgView).offset(zScaleH(-10));
    }];

}

-(void)creatBottomBarView
{
    UIView * buttonView = [[UIView alloc]init];
    buttonView.backgroundColor = [UIColor whiteColor];
    
    UIButton * soucahngBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [soucahngBtn setTitle:@"收藏" forState:UIControlStateNormal];
    [soucahngBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    soucahngBtn.titleLabel.font = font_13;
    [soucahngBtn setBackgroundImage:[UIImage imageNamed:@"icon-229-666.png"] forState:UIControlStateNormal];
    soucahngBtn.frame = CGRectMake(zScaleW(13), zScaleH(11), zScaleW(100), zScaleH(34));
    [soucahngBtn addTarget:self action:@selector(shouCangClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:soucahngBtn];
    
    UIButton * toudanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [toudanBtn setTitle:@"立即投单" forState:UIControlStateNormal];
    [toudanBtn setBackgroundImage:[UIImage imageNamed:@"icon-229-667.png"] forState:UIControlStateNormal];
    [toudanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    toudanBtn.titleLabel.font = font_13;
    toudanBtn.frame = CGRectMake(soucahngBtn.right + zScaleW(10), soucahngBtn.top, soucahngBtn.width, soucahngBtn.height);
    [toudanBtn addTarget:self action:@selector(touDanClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:toudanBtn];
    
    UIButton * jubaoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [jubaoBtn setTitle:@"举报" forState:UIControlStateNormal];
    jubaoBtn.titleLabel.font = font_13;
    [jubaoBtn setTitleColor:[UIColor colorWithRed:164/255.0 green:171/255.0 blue:175/255.0 alpha:1] forState:UIControlStateNormal];
    [jubaoBtn setBackgroundImage:[UIImage imageNamed:@"icon-100-60g.png"] forState:UIControlStateNormal];
    jubaoBtn.frame = CGRectMake(kScreenWidth - zScaleW(75), zScaleH(11), zScaleW(51), zScaleH(31));
    [jubaoBtn addTarget:self action:@selector(jubaoClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:jubaoBtn];
    [self.view addSubview:buttonView];

    __weak typeof(self) weakSelf = self;
    
    [buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(56)));
    }];
    
}

//点击收藏
-(void)shouCangClick:(UIButton *)btn
{
    
}
//点击投单
-(void)touDanClick:(UIButton *)btn
{
    SHTouDanExplainedViewController * toudanVC = [[SHTouDanExplainedViewController alloc]init];
    
    [self.navigationController pushViewController:toudanVC animated:YES];
}
//点击举报
-(void)jubaoClick:(UIButton *)btn
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
