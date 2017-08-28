//
//  SHTouDanExplainedViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHTouDanExplainedViewController.h"
#import "SHTouDanShenSingViewController.h"

@interface SHTouDanExplainedViewController ()

@end

@implementation SHTouDanExplainedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"投单说明";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
}

- (void)initView
{
    __weak typeof(self) weakSelf = self;

    UILabel *titleLb = [UILabel labelWithFont:font_14 textColor:Color_157efb numberOfLines:1 textAlignment:NSTextAlignmentCenter];
    titleLb.text = @"投单说明";
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = Color_E5E5E5;
    
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
    
    UIButton * agreementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [agreementBtn setTitle:@"同意" forState:UIControlStateNormal];
    [agreementBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    agreementBtn.titleLabel.font = font_13;
    [agreementBtn setBackgroundImage:[UIImage imageNamed:@"icon-229-666.png"] forState:UIControlStateNormal];
    [agreementBtn addActionBlock:^(UIButton *sender) {
        SHTouDanShenSingViewController *touDanShenSingVc = [[SHTouDanShenSingViewController alloc] init];
        [self.navigationController pushViewController:touDanShenSingVc animated:YES];
    }];
    
    UIButton * disagreementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [disagreementBtn setTitle:@"不同意" forState:UIControlStateNormal];
    [disagreementBtn setBackgroundImage:[UIImage imageNamed:@"icon-229-667.png"] forState:UIControlStateNormal];
    [disagreementBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    disagreementBtn.titleLabel.font = font_13;
    [disagreementBtn addActionBlock:^(UIButton *sender) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [self.view addSubview:titleLb];
    [self.view addSubview:lineView];
    [self.view addSubview:miaoshuDetailLb];
    [self.view addSubview:agreementBtn];
    [self.view addSubview:disagreementBtn];

    [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(zScaleH(40));
        make.left.right.equalTo(weakSelf.view);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLb.mas_bottom).offset(zScaleH(20));
        make.left.equalTo(weakSelf.view).offset(zScaleW(30));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-30));
        make.height.equalTo(@(zScaleH(1)));
    }];
    
    [miaoshuDetailLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView);
        make.right.equalTo(lineView);
        make.top.equalTo(lineView.mas_bottom).offset(zScaleH(20));
    }];

    [agreementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view).offset(zScaleH(-50));
        make.centerX.equalTo(weakSelf.view).offset(-zScaleW(50 + 5));
        make.height.equalTo(@(zScaleH(30)));
        make.width.equalTo(@(zScaleW(100)));
    }];
    
    [disagreementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view).offset(zScaleH(-50));
        make.centerX.equalTo(weakSelf.view).offset(zScaleW(50 + 5));
        make.height.equalTo(agreementBtn);
        make.width.equalTo(agreementBtn);
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
