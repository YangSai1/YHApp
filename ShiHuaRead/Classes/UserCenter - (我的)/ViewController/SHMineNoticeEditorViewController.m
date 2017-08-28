//
//  SHMineNoticeEditorViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMineNoticeEditorViewController.h"
#import "SHEditListView.h"
#import "CommonMenuView.h"
#import "SHEditView.h"
#import "SHShenQingCellTwo.h"
#import "SHShenQingCellthree.h"
#import "SHBudgetMoneyView.h"
#import "SHThrowMoneryView.h"
#import "AddressPickerView.h"
#import "SHBlueHeadeViewTextView.h"
#import "SHBlueHeaderImageCheckView.h"

#import "SHGongGaoXuanController.h"
#import "SHAdvertisementAddApiManager.h"
#import "SHAdvertisementAddAskData.h"
#import "SHAdvertisementAddReceiveData.h"

#import "THDatePickerView.h"

#import <AFNetworking/AFNetworking.h>

@interface SHMineNoticeEditorViewController () <UITextViewDelegate,UIImagePickerControllerDelegate, UIActionSheetDelegate,UINavigationControllerDelegate,CTAPIManagerParamSource, CTAPIManagerCallBackDelegate,AddressPickerViewDelegate,THDatePickerViewDelegate>

@property(nonatomic, strong) UIScrollView *scrollview;

@property(nonatomic, strong) UIView *contView;

@property(nonatomic, strong) NSArray *dataArr;

@property(nonatomic, strong) SHShenQingCellTwo *xueqiuDetailV;

@property(nonatomic, strong)UIImagePickerController *imagePicker;

@property(nonatomic,strong)UIButton * selectedBtn;

@property (strong, nonatomic) THDatePickerView *dateView;


@property(nonatomic, strong) SHEditListView *adressListV;

@property(nonatomic, strong) SHEditListView *zhixingV;

@property(nonatomic, strong) SHEditListView *gonggaoV;

@property (nonatomic ,strong) AddressPickerView * pickerView;

@property(nonatomic, strong) SHBlueHeaderImageCheckView *imagePickerView;


@property(nonatomic, strong) SHAdvertisementAddApiManager *advertisementAddApiManager;

@property(nonatomic, strong) SHAdvertisementAddAskData *advertisementAskData;

@property(nonatomic, strong) SHAdvertisementAddReceiveData *advertisementAddReceiveData;

@property(nonatomic, strong) NSArray *gonggaoArr;

@property(nonatomic, strong) NSArray *shengaoArr;

@property(nonatomic, strong) NSArray *shencaiArr;

@property(nonatomic, strong) NSArray *xueliArr;

@property(nonatomic, strong) UITextField *currentTextF;

@property(nonatomic, strong) NSArray *images;

@property(nonatomic, strong) SHShenQingCellthree *imageChangeV;

@property(nonatomic, assign) NSInteger updateI;

@property(nonatomic, assign) NSInteger datePicker;

@end


@implementation SHMineNoticeEditorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"公告发布";
    self.view.backgroundColor = [UIColor whiteColor];
    _advertisementAskData = [[SHAdvertisementAddAskData alloc] init];
    [self initData];
    [self initView];
    
    // Do any additional setup after loading the view.
}

- (void)initData
{
    _updateI = 0;
    _datePicker = 1;
    NSMutableArray *shengaoArr = [[NSMutableArray alloc] init];
    NSInteger shengao = 150;
    
    for (int index = 0; index < 30; index ++) {
        shengao++;
        NSString *shengaoStr = [NSString stringWithFormat:@"%lu",shengao];
        [shengaoArr addObject:shengaoStr];
    }
    
    _shengaoArr = [shengaoArr copy];
    
    
    _shencaiArr = @[@"偏瘦",@"正常",@"完美",@"微胖"];
    _xueliArr = @[@"小学",@"初中",@"高中",@"中专",@"专科",@"本科",@"其他"];
    _gonggaoArr = @[@"非影视类",@"院线电影",@"电视剧",@"其他"];
}

- (void)initView
{

    _scrollview = [[UIScrollView alloc] init];
    
    _contView = [[UIView alloc] init];
    
    [_scrollview addSubview:_contView];
    
    [self.view addSubview:_scrollview];
    
    __weak typeof(self) weakSelf = self;
    
    
    [_scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.view).offset(zScaleH(10));
        make.left.right.bottom.equalTo(weakSelf.view);
        
    }];
    
    [_contView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(weakSelf.scrollview);
        make.width.equalTo(weakSelf.scrollview);
        
    }];
    
    CGFloat topMarge = 10;
    CGFloat hight = zScaleH(44);
    
    SHEditListView *fenleiV = [[SHEditListView alloc] init];
    fenleiV.isShowListView = NO;
    
    //    __weak typeof(self) weakSelf = self;

    [fenleiV registBlock:^(SHEditListView *view, NSString *title) {
        NSLog(@"%@",title);
        
        SHGongGaoXuanController *vc = [[SHGongGaoXuanController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
        
        [vc registBlock:^(NSString *title) {
            weakSelf.advertisementAskData.noticeClass = title;
            weakSelf.advertisementAskData.title = title;

            view.detailLb.text = title;
        }];
    }];
    
    [fenleiV setTitle:@"公告分类" detailTitle:@"请选择公告分类"];
    
    
    
    SHEditListView *leixinV = [[SHEditListView alloc] init];
    [leixinV setTitle:@"公告类型" detailTitle:@"请选择公告类型"];
    
    [leixinV registBlock:^(SHEditListView *view, NSString *title) {
        NSLog(@"%@",title);
        weakSelf.advertisementAskData.noticeType = title;
        view.detailLb.text = title;
    }];

    leixinV.dataArr = _gonggaoArr;
    
    

    SHEditView *xukezhengV = [[SHEditView alloc] init];
    [xukezhengV setTitle:@"拍摄许可证" detailTitle:nil];
    [xukezhengV registBlock:^(NSString *title) {
        weakSelf.currentTextF = xukezhengV.detailText;
        weakSelf.advertisementAskData.shootLicence = title;

        NSLog(@"%@",title);
        
    }];
    
    SHEditView *xuqiuV = [[SHEditView alloc] init];
//    [xuqiuV setTitle:@"需求标题" detailTitle:@"需求的服务或产品名称"];
    [xuqiuV setTitle:@"需求标题" detailTitle:nil showXing:NO placehoder:@"需求的服务或产品名称"];
    [xuqiuV registBlock:^(NSString *title) {
        
        NSLog(@"%@",title);
        weakSelf.currentTextF = xuqiuV.detailText;

        weakSelf.advertisementAskData.title = title;
        
    }];

    SHEditListView *diquV = [[SHEditListView alloc] init];
    [diquV setTitle:@"需求地区" detailTitle:@"省市区"];
    diquV.isShowListView = NO;
    _adressListV = diquV;
    [diquV registBlock:^(SHEditListView *view, NSString *title) {
        NSLog(@"%@",title);
        [weakSelf.currentTextF resignFirstResponder];
        [weakSelf showDiss:YES];
        
        
        
    }];
//    diquV.dataArr = dataArray;

    SHEditView *dizhiV = [[SHEditView alloc] init];
//    [dizhiV setTitle:@"需求地址" detailTitle:@"详细地址" showXing:YES];
    [dizhiV setTitle:@"需求地址" detailTitle:nil showXing:YES placehoder:@"详细地址"];

    [dizhiV registBlock:^(NSString *title) {
        NSLog(@"%@",title);
        weakSelf.currentTextF = dizhiV.detailText;

        weakSelf.advertisementAskData.detailAddress = title;
    }];

    SHEditView *numV = [[SHEditView alloc] init];
    [numV setTitle:@"需求数量" detailTitle:@""];
    [numV registBlock:^(NSString *title) {
        
        NSLog(@"%@",title);
        weakSelf.currentTextF = numV.detailText;

        weakSelf.advertisementAskData.needCount = title;

        
    }];
    
    SHEditListView *timeV = [[SHEditListView alloc] init];
    _gonggaoV = timeV;
    timeV.isShowListView = NO;
    [timeV setTitle:@"公告时间" detailTitle:@"请填写具体时间"];
//    [timeV setTitle:@"公告时间" detailTitle:nil showXing:YES placehoder:@""];

    [timeV registBlock:^(SHEditListView *view, NSString *title) {
        NSLog(@"%@",title);
        _datePicker = 1;
        [self showDatePicker];

    }];

    
//    [timeV setTitle:@"公告时间" detailTitle:@"请填写具体时间" showXing:YES];
//    [timeV registBlock:^(NSString *title) {
//        
//        NSLog(@"%@",title);
//        weakSelf.currentTextF = timeV.detailText;
//
//        weakSelf.advertisementAskData.noticeTime = title;
//
//        
//    }];
    
    SHEditListView *zhixingTime = [[SHEditListView alloc] init];
    _zhixingV = zhixingTime;
    zhixingTime.isShowListView = NO;
    [zhixingTime setTitle:@"执行时间" detailTitle:@"请填写具体时间"];
//    [dizhiV setTitle:@"需求地址" detailTitle:nil showXing:YES placehoder:@"详细地址"];

    [zhixingTime registBlock:^(SHEditListView *view, NSString *title) {
        NSLog(@"%@",title);
        _datePicker = 2;
        [self showDatePicker];
    }];

//    [zhixingTime setTitle:@"执行时间" detailTitle:@"请填写具体时间" showXing:YES];
//    [zhixingTime registBlock:^(NSString *title) {
//        weakSelf.currentTextF = zhixingTime.detailText;
//
//        NSLog(@"%@",title);
//        weakSelf.advertisementAskData.exeTime = title;
//
//        
//    }];
    
    SHBudgetMoneyView *textq = [[SHBudgetMoneyView alloc] init];
    [textq registBlock:^(NSString *firstT, NSString *secoundT) {
        weakSelf.advertisementAskData.budgetStart = firstT;
        weakSelf.advertisementAskData.budgetEnd = secoundT;
    }];

    SHThrowMoneryView *text2 = [[SHThrowMoneryView alloc] init];
    [text2 registBlock:^(BOOL isHave) {
        weakSelf.advertisementAskData.castCondition = [NSString stringWithFormat:@"%@",@(isHave)];

    }];

    SHEditListView *shengaoV = [[SHEditListView alloc] init];
    [shengaoV setTitle:@"身高" detailTitle:@""];
    [shengaoV registBlock:^(SHEditListView *view, NSString *title) {
        NSLog(@"%@",title);
        weakSelf.advertisementAskData.height = title;

    }];
    shengaoV.dataArr = _shengaoArr;

    SHEditListView *shencaiV = [[SHEditListView alloc] init];
    [shencaiV setTitle:@"身材" detailTitle:@""];
    [shencaiV registBlock:^(SHEditListView *view, NSString *title) {
        NSLog(@"%@",title);
        weakSelf.advertisementAskData.stature = title;

    }];
    shencaiV.dataArr = _shencaiArr;
    
    SHEditListView *xueliV = [[SHEditListView alloc] init];
    [xueliV setTitle:@"学历" detailTitle:@""];
    [xueliV registBlock:^(SHEditListView *view, NSString *title) {
        NSLog(@"%@",title);
        weakSelf.advertisementAskData.education = title;

    }];
    xueliV.dataArr = _xueliArr;
    
    SHBlueHeadeViewTextView *xueqiuDetailV = [[SHBlueHeadeViewTextView alloc] init];
    [xueqiuDetailV.titleView setTitle:@"需求描述" placeholder:nil];
    xueqiuDetailV.textView.placeholder = @"200字以内";
    xueqiuDetailV.textView.font = font_13;
    xueqiuDetailV.textView.textDidChangedBlock = ^(NSString *text) {
        NSLog(@"%@",text);
    };

    SHBlueHeaderImageCheckView *imageChangeV = [[SHBlueHeaderImageCheckView alloc] initWithContainerVC:self];
    _imagePickerView = imageChangeV;
//
//    SHShenQingCellthree *imageChangeV = [[SHShenQingCellthree alloc] init];
//    _imageChangeV = imageChangeV;
//    imageChangeV.titleView.text = @"图片上传";
//    [imageChangeV.imageBtnOne addActionBlock:^(UIButton *sender) {
//        [self pickImage:sender];
//    }];
//    [imageChangeV.imageBtnTwo addActionBlock:^(UIButton *sender) {
//        [self pickImage:sender];
//
//    }];
//    [imageChangeV.imageBtnThree addActionBlock:^(UIButton *sender) {
//        [self pickImage:sender];
//
//    }];
    
    UIButton *submitBtn = [UIButton buttonWithTitle:@"提交"];
    [submitBtn addActionBlock:^(UIButton *sender) {
        
        
        NSMutableArray *imageArr = [NSMutableArray arrayWithCapacity:0];
        UIImage *image = [_imageChangeV.imageBtnOne imageForState:UIControlStateNormal];
        UIImage *image1 = [_imageChangeV.imageBtnTwo imageForState:UIControlStateNormal];
        UIImage *image2 = [_imageChangeV.imageBtnThree imageForState:UIControlStateNormal];
        if (image) {
            [imageArr addObject:image];
        }
        if (image1) {
            [imageArr addObject:image1];
        }
        
        if (image2) {
            [imageArr addObject:image2];
        }
        _images = [imageArr copy];
        
        [self.advertisementAddApiManager loadData];
    }];
    
    THDatePickerView *dateView = [[THDatePickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 300)];
    dateView.delegate = self;
    dateView.title = @"请选择时间";
    self.dateView = dateView;

    
    [_contView addSubview:fenleiV];

    [_contView addSubview:leixinV];

    [_contView addSubview:xukezhengV];

    [_contView addSubview:xuqiuV];
    
    [_contView addSubview:diquV];
    
    [_contView addSubview:dizhiV];

    [_contView addSubview:numV];
    
    [_contView addSubview:timeV];
    
    [_contView addSubview:zhixingTime];
    
    [_contView addSubview:textq];
    
    [_contView addSubview:text2];
    
    [_contView addSubview:shengaoV];

    [_contView addSubview:shencaiV];

    [_contView addSubview:xueliV];

    [_contView addSubview:xueqiuDetailV];
    
    [_contView addSubview:imageChangeV];
    
    [_contView addSubview:submitBtn];
    
    [self.view addSubview:self.pickerView];
    [self.view addSubview:dateView];

    
    [fenleiV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contView);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
    }];
    
    [leixinV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fenleiV.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
    }];

    
    [xukezhengV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leixinV.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
    }];

    [xuqiuV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(xukezhengV.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
//        make.bottom.equalTo(weakSelf.contView).offset(-10);
    }];

    [diquV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(xuqiuV.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
    }];

    [dizhiV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(diquV.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
    }];

    [numV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(dizhiV.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
    }];
    
    [timeV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(numV.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
    }];

    [zhixingTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(timeV.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
    }];

    [textq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(zhixingTime.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
    }];


    [text2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textq.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
    }];
    
    [shengaoV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(text2.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
    }];
    
    [shencaiV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(shengaoV.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
    }];
    
    [xueliV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(shencaiV.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
//        make.bottom.equalTo(weakSelf.contView).offset(-10);

    }];

    [xueqiuDetailV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(xueliV.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(zScaleH(100)));
//        make.bottom.equalTo(weakSelf.contView).offset(-10);
        
    }];
    
    [imageChangeV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(xueqiuDetailV.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(zScaleH(130)));
        
    }];

    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageChangeV.mas_bottom).offset(topMarge);
        make.left.equalTo(weakSelf.contView).offset(50.0f);
        make.right.equalTo(weakSelf.contView).offset(-50.0f);
        make.bottom.equalTo(weakSelf.contView).offset(-10);
    }];



    
}

- (AddressPickerView *)pickerView{
    if (!_pickerView) {
        _pickerView = [[AddressPickerView alloc]initWithFrame:CGRectMake(0, kScreenHeight , kScreenWidth, 215)];
        _pickerView.delegate = self;
        // 关闭默认支持打开上次的结果
        //        _pickerView.isAutoOpenLast = NO;
    }
    return _pickerView;
}


- (void)showDiss:(BOOL)show
{
    if (show) {
        [self.pickerView show];
    }else{
        [self.pickerView hide];
    }
}

#pragma mark - AddressPickerViewDelegate
- (void)cancelBtnClick{
    NSLog(@"点击了取消按钮");
    [self showDiss:NO];
}
- (void)sureBtnClickReturnProvince:(NSString *)province City:(NSString *)city Area:(NSString *)area{
    
    NSString *text;
    text = [NSString stringWithFormat:@"%@  %@  %@",province,city,area];
    NSLog(@"%@",text);
    _adressListV.detailLb.text = text;
    _advertisementAskData.province = province;
    _advertisementAskData.city = city;
    _advertisementAskData.area = area;
    [self showDiss:NO];
}


- (void)showDatePicker
{
    [UIView animateWithDuration:0.3 animations:^{
        self.dateView.frame = CGRectMake(0, self.view.frame.size.height - 300, self.view.frame.size.width, 300);
        [self.dateView show];
    }];

}

/**
 保存按钮代理方法
 
 @param timer 选择的数据
 */
- (void)datePickerViewSaveBtnClickDelegate:(NSString *)timer {
    NSLog(@"%@",timer);
//    self.timerLbl.text = timer;
    
    if (_datePicker == 1) {
        // 公告时间
        
        NSString *time = [NSString stringWithFormat:@"%@:00",timer];
        _gonggaoV.detailLb.text = time;
        self.advertisementAskData.noticeTime = time;
    }else if (_datePicker == 2){
        // 执行时间
        NSString *time = [NSString stringWithFormat:@"%@:00",timer];

        _zhixingV.detailLb.text = time;
        self.advertisementAskData.exeTime = time;
    }
    
//    self.btn.hidden = YES;
    [UIView animateWithDuration:0.3 animations:^{
        self.dateView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 300);
    }];
}

/**
 取消按钮代理方法
 */
- (void)datePickerViewCancelBtnClickDelegate {
    NSLog(@"取消点击");
//    self.btn.hidden = YES;
    [UIView animateWithDuration:0.3 animations:^{
        self.dateView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 300);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateImage:(NSArray *)images
{
    
    UIImage *image = _images[_updateI];
    NSString *ID = _advertisementAddReceiveData.ID;
    
    //    NSString *userId = [SHUserManager shareManager].userModel.ID;
    NSString *url = [NSString stringWithFormat:@"%@%@",@"http://114.215.241.137:18088/ysAPP",@"/file/uploadFile"];
    
//    NSString *imageName = [NSString stringWithFormat:@"groupPhoto%f",time];
    
    //        NSData *imageData  = UIImagePNGRepresentation(image);
    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
    
    NSDictionary *Dict = @{@"fileType":@"image",@"filePurpose":@"notice",@"fkPurposeId":ID};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:url
       parameters:Dict
constructingBodyWithBlock:
     ^(id<AFMultipartFormData>_Nonnull formData) {
         [formData appendPartWithFileData:imageData name:@"uploadFile" fileName:@"groupPhoto.png" mimeType:@"image/png"];
     } progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              
              NSDictionary *dict = responseObject;
              
              NSLog(@"%@",dict);
              
              _updateI ++;
              
              NSLog(@"%lu - %lu",_updateI,images.count)
              NSLog(@"图片上传成功啦");
              
              if (_updateI == images.count) {
                  
                  [SVProgressHUD dismiss];
                  
                  [self.navigationController popViewControllerAnimated:YES];
                  return ;
              }
              
              [self updateImage:_images];
              
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              [SVProgressHUD dismiss];
              NSLog(@"图片上传失败啦");
          }];
}


- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView == _xueqiuDetailV.textView) {
        NSLog(@"%@",textView.text);
        self.advertisementAskData.intro = textView.text;
    }
}

//调用摄像头
-(void)pickImage:(UIButton *)selectedView{
    if (!(selectedView == nil)) {
        self.selectedBtn = selectedView;
    }
    NSString *title = @"选择图片获取方式"/*NSLocalizedString(@"method", nil)*/;
    NSString *cancel = @"取消"/*NSLocalizedString(@"cancel", nil)*/;
    NSString *m1 = @"相册"/*NSLocalizedString(@"album", nil)*/;
    NSString *m2 = @"拍照"/*NSLocalizedString(@"camera", nil)*/;
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:title delegate:self cancelButtonTitle:cancel destructiveButtonTitle:nil otherButtonTitles:m1, m2, nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleAutomatic;
    [actionSheet showInView:self.view];
}
#pragma mark - action sheet delegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:{
            [self pickImageWithSorceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
            break;
        }
        case 1:{
            [self pickImageWithSorceType:UIImagePickerControllerSourceTypeCamera];
            break;
        }
        default:
            break;
    }
}
#pragma mark - image picker view delegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    // 上传头像
    [self.selectedBtn setImage:image forState:UIControlStateNormal];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - getter overrite
-(UIImagePickerController *)imagePicker{
    if (!_imagePicker) {
        _imagePicker = [[UIImagePickerController alloc]init];
        _imagePicker.delegate = self;
        _imagePicker.allowsEditing = YES;
    }
    return _imagePicker;
}
#pragma mark -
-(void)pickImageWithSorceType:(UIImagePickerControllerSourceType) sourceType{
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        self.imagePicker.sourceType = sourceType;
        [self presentViewController:self.imagePicker animated:YES completion:nil];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - CTAPIManagerParamSource
- (NSDictionary *)paramsForApi:(CTAPIBaseManager *)manager
{
    NSDictionary *params = @{@"phone":@"18937723501",@"validCode":@"1111"};
    
    if (manager == self.advertisementAddApiManager) {
        
        [SVProgressHUD showWithStatus:@"内容提交中..."];
        //        params = @{
        //                   kTestAPIManagerParamsKeyLatitude:@(31.228000),
        //                   kTestAPIManagerParamsKeyLongitude:@(121.454290)
        //                   };
        
        _advertisementAskData.fkUserId = [SHUserManager shareManager].userModel.ID;
        
        params = [_advertisementAskData mj_JSONObject];
    }
    
    return params;
}

#pragma mark - CTAPIManagerCallBackDelegate
- (void)managerCallAPIDidSuccess:(CTAPIBaseManager *)manager
{
    if (manager == self.advertisementAddApiManager) {
        
        NSDictionary *receiveData = [manager fetchDataWithReformer:nil];
        
        NSDictionary *realData = receiveData[@"data"];
        
        NSString *errMessage = receiveData[@"msg"];
        
        if ([receiveData[@"errcode"]integerValue] == 0) {
            
            SHAdvertisementAddReceiveData *loginReceiveData = [SHAdvertisementAddReceiveData mj_objectWithKeyValues:realData];
            _advertisementAddReceiveData = loginReceiveData;
            
            [self updateImage:_images];
            
        }else{
            
            [SVProgressHUD showErrorWithStatus:errMessage];
            
        }
        
        
        NSLog(@"%@", [manager fetchDataWithReformer:nil]);
        //        [self layoutResultLable];
    }
}

- (void)managerCallAPIDidFailed:(CTAPIBaseManager *)manager
{
    if (manager == self.advertisementAddApiManager) {
        //        self.resultLable.text = @"fail";
        [SVProgressHUD showErrorWithStatus:@"网络错误"];
        
        //        [self layoutResultLable];
    }
}

#pragma mark - getters and setters
- (SHAdvertisementAddApiManager *)advertisementAddApiManager
{
    if (_advertisementAddApiManager == nil) {
        _advertisementAddApiManager = [[SHAdvertisementAddApiManager alloc] init];
        _advertisementAddApiManager.delegate = self;
        _advertisementAddApiManager.paramSource = self;
    }
    return _advertisementAddApiManager;
}


@end
