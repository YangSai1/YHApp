//
//  SHMineICanEiderViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMineICanEiderViewController.h"

#import "SHEditListView.h"
#import "CommonMenuView.h"
#import "SHEditView.h"
#import "SHShenQingCellTwo.h"
#import "SHShenQingCellthree.h"
#import "SHGongGaoXuanController.h"

#import "SHICanAddApiManager.h"

#import "SHICanAddAskData.h"
#import "SHICanAddReceiveData.h"


#import "SHQuerySkillListApiManager.h"
#import "SHQuerySkillListReceiveData.h"

#import "SHPopListView.h"
#import "LEEAlert.h"

#import "AddressPickerView.h"

#import <AFNetworking/AFNetworking.h>

@interface SHMineICanEiderViewController () <UITextViewDelegate,UIImagePickerControllerDelegate, UIActionSheetDelegate,UINavigationControllerDelegate,CTAPIManagerParamSource, CTAPIManagerCallBackDelegate,AddressPickerViewDelegate>

@property(nonatomic, strong) UIScrollView *scrollview;

@property(nonatomic, strong) UIView *contView;

@property(nonatomic, strong) NSArray *dataArr;

@property(nonatomic, strong) SHShenQingCellTwo *xueqiuDetailV;

@property(nonatomic, strong)UIImagePickerController *imagePicker;

@property(nonatomic,strong)UIButton * selectedBtn;

@property(nonatomic, strong) SHICanAddApiManager *iCanAddApiManager;

@property(nonatomic, strong) SHICanAddAskData *iCanAddAskData;


@property(nonatomic, strong) SHQuerySkillListApiManager *querySkillListApiManager;

@property(nonatomic, strong) SHICanAddReceiveData *iCanAddReceiveData;

@property(nonatomic, strong) SHEditListView *fenleiV;

@property (nonatomic ,strong) AddressPickerView * pickerView;

@property(nonatomic, strong) NSArray *shengaoArr;

@property(nonatomic, strong) NSArray *shencaiArr;

@property(nonatomic, strong) NSArray *xueliArr;

@property(nonatomic, strong) UITextField *currentF;

@property(nonatomic, strong) SHEditListView *adressF;

@property(nonatomic, strong) SHShenQingCellthree *imageChangeV;

@property(nonatomic, strong) NSArray *images;
@property(nonatomic, assign) NSInteger updateI;

@end

@implementation SHMineICanEiderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我能申请";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initData];
    [self initView];
    // Do any additional setup after loading the view.
}

- (void)initData
{
    
    _iCanAddAskData = [[SHICanAddAskData alloc] init];
    _updateI = 0;
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
}

- (void)initView
{
    

    _scrollview = [[UIScrollView alloc] init];
    
    _contView = [[UIView alloc] init];
    
    [_scrollview addSubview:_contView];
    
    [self.view addSubview:_scrollview];
    
    __weak typeof(self) weakSelf = self;
    
    
    [_scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@(zScaleH(10.0f)));
        make.left.right.bottom.equalTo(weakSelf.view);
        
    }];
    
    [_contView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(weakSelf.scrollview);
        make.width.equalTo(weakSelf.scrollview);
        
    }];
    
    CGFloat topMarge = 10;
    CGFloat hight = 44;
    
    SHEditListView *fenleiV = [[SHEditListView alloc] init];
    _fenleiV = fenleiV;
    
    //    __weak typeof(self) weakSelf = self;
    
    fenleiV.isShowListView = NO;
    [fenleiV registBlock:^(SHEditListView *view, NSString *title) {
        NSLog(@"%@",title);
        
        [self.querySkillListApiManager loadData];

        
    }];
    
    [fenleiV setTitle:@"认证分类" detailTitle:@""];
    
    
    
    SHEditView *leixinV = [[SHEditView alloc] init];
//    [leixinV setTitle:@"真实姓名" detailTitle:@"请输入真实姓名"];
    [leixinV setTitle:@"真实姓名" detailTitle:nil showXing:NO placehoder:@"请输入真实姓名"];

    [leixinV registBlock:^(NSString *title) {
        NSLog(@"%@",title);
        weakSelf.currentF = leixinV.detailText;
        weakSelf.iCanAddAskData.realName = title;

    }];
    
    SHEditView *yimingV = [[SHEditView alloc] init];
    [yimingV setTitle:@"艺名" detailTitle:@""];
    
    [yimingV registBlock:^(NSString *title) {
        NSLog(@"%@",title);
        weakSelf.currentF = yimingV.detailText;

        weakSelf.iCanAddAskData.stageName = title;

    }];

    
    SHEditListView *diquV = [[SHEditListView alloc] init];
    diquV.isShowListView = NO;
    [diquV setTitle:@"所在地区" detailTitle:@"省市区"];
    _adressF = diquV;
    [diquV registBlock:^(SHEditListView *view, NSString *title) {
        NSLog(@"%@",title);
        
        [weakSelf showDiss:YES];
    }];
    
    SHEditView *dizhiV = [[SHEditView alloc] init];
    [dizhiV setTitle:@"详细地址" detailTitle:nil showXing:YES placehoder:@"详细地址"];
    [dizhiV registBlock:^(NSString *title) {
        NSLog(@"%@",title);
        weakSelf.currentF = dizhiV.detailText;

        weakSelf.iCanAddAskData.detailAddress = title;
    }];
    
    
    SHEditListView *shengaoV = [[SHEditListView alloc] init];
    [shengaoV setTitle:@"身高" detailTitle:@""];
    [shengaoV registBlock:^(SHEditListView *view, NSString *title) {
        NSLog(@"%@",title);
        weakSelf.iCanAddAskData.height = title;
    }];
    shengaoV.dataArr = _shengaoArr;
    
    SHEditListView *shencaiV = [[SHEditListView alloc] init];
    [shencaiV setTitle:@"身材" detailTitle:@""];
    [shencaiV registBlock:^(SHEditListView *view, NSString *title) {
        NSLog(@"%@",title);
        weakSelf.iCanAddAskData.stature = title;

    }];
    shencaiV.dataArr = _shencaiArr;
    
    SHEditListView *xueliV = [[SHEditListView alloc] init];
    [xueliV setTitle:@"学历" detailTitle:@""];
    [xueliV registBlock:^(SHEditListView *view, NSString *title) {
        NSLog(@"%@",title);
        weakSelf.iCanAddAskData.education = title;

    }];
    xueliV.dataArr = _xueliArr;
    
    SHShenQingCellTwo *xueqiuDetailV = [[SHShenQingCellTwo alloc] init];
    _xueqiuDetailV = xueqiuDetailV;
    _xueqiuDetailV.textView.delegate = self;
    xueqiuDetailV.backgroundColor = [UIColor whiteColor];
    xueqiuDetailV.titleView.text = @"需求描述";
    
    SHShenQingCellthree *imageChangeV = [[SHShenQingCellthree alloc] init];
    imageChangeV.titleView.text = @"图片上传";
    _imageChangeV = imageChangeV;
    
    [imageChangeV.imageBtnOne addActionBlock:^(UIButton *sender) {
        [self pickImage:sender];
    }];
    [imageChangeV.imageBtnTwo addActionBlock:^(UIButton *sender) {
        [self pickImage:sender];
        
    }];
    [imageChangeV.imageBtnThree addActionBlock:^(UIButton *sender) {
        [self pickImage:sender];
        
    }];
    
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
        
        [self.iCanAddApiManager loadData];

    }];

    
    [_contView addSubview:fenleiV];
    
    [_contView addSubview:leixinV];
    
    [_contView addSubview:yimingV];

    [_contView addSubview:diquV];
    
    [_contView addSubview:dizhiV];
    
    [_contView addSubview:shengaoV];
    
    [_contView addSubview:shencaiV];
    
    [_contView addSubview:xueliV];
    
    [_contView addSubview:xueqiuDetailV];
    
    [_contView addSubview:imageChangeV];
    
    [_contView addSubview:submitBtn];
    [self.view addSubview:self.pickerView];

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

    [yimingV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leixinV.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
    }];

    
    
    [dizhiV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(yimingV.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
    }];
    
    [diquV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(dizhiV.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(hight));
    }];
    
    
    [shengaoV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(diquV.mas_bottom).offset(topMarge);
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
        make.height.equalTo(@(100));
        //        make.bottom.equalTo(weakSelf.contView).offset(-10);
        
    }];
    
    [imageChangeV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(xueqiuDetailV.mas_bottom).offset(topMarge);
        make.left.right.equalTo(weakSelf.contView);
        make.height.equalTo(@(123));
//        make.bottom.equalTo(weakSelf.contView).offset(-10);
        
    }];
    
    
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageChangeV.mas_bottom).offset(topMarge);
        make.left.equalTo(weakSelf.contView).offset(50.0f);
        make.right.equalTo(weakSelf.contView).offset(-50.0f);
        make.bottom.equalTo(weakSelf.contView).offset(-10);
    }];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView == _xueqiuDetailV.textView) {
        NSLog(@"%@",textView.text);
        
        self.iCanAddAskData.intro = textView.text;
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


- (void)updateImage:(NSArray *)images withIcanId:(NSString *)iCanId
{
    UIImage *image = _images[_updateI];
    NSString *ID = _iCanAddReceiveData.ID;
    
    NSTimeInterval time = [[NSDate new] timeIntervalSince1970];
    //    NSString *userId = [SHUserManager shareManager].userModel.ID;
    NSString *url = [NSString stringWithFormat:@"%@%@",@"http://114.215.241.137:18088/ysAPP",@"/file/uploadFile"];
    
    NSString *imageName = [NSString stringWithFormat:@"groupPhoto%f",time];
    
//        NSData *imageData  = UIImagePNGRepresentation(image);
    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);

    NSDictionary *Dict = @{@"fileType":@"image",@"filePurpose":@"userSkill",@"fkPurposeId":ID};
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
              
              [self updateImage:_images withIcanId:nil];

          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              [SVProgressHUD dismiss];
              NSLog(@"图片上传失败啦");
          }];

        
    
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
    _adressF.detailLb.text = text;
    _iCanAddAskData.province = province;
    _iCanAddAskData.city = city;
    _iCanAddAskData.area = area;
    [self showDiss:NO];
}

#pragma mark - CTAPIManagerParamSource
- (NSDictionary *)paramsForApi:(CTAPIBaseManager *)manager
{
    

    NSDictionary *params = @{@"phone":@"18937723501",@"validCode":@"1111"};
    
    if (manager == self.iCanAddApiManager) {
        
        [SVProgressHUD showWithStatus:@"内容上传中..."];

        //        params = @{
        //                   kTestAPIManagerParamsKeyLatitude:@(31.228000),
        //                   kTestAPIManagerParamsKeyLongitude:@(121.454290)
        //                   };
//        NSString *userId = [SHUserManager shareManager].userModel.ID;
//        params = @{@"userId":userId};
        
        _iCanAddAskData.fkUserId = [SHUserManager shareManager].userModel.ID;
//        _iCanAddAskData.fkSkillId = @"1";
//        _iCanAddAskData.realName = @"呵呵呵呵";
        
        params = [_iCanAddAskData mj_JSONObject];

        
        
    }else if (manager == self.querySkillListApiManager){
        return nil;
    }
    
    return params;
}


#pragma mark - CTAPIManagerCallBackDelegate
- (void)managerCallAPIDidSuccess:(CTAPIBaseManager *)manager
{
    if (manager == self.iCanAddApiManager) {
        NSDictionary *receiveData = [manager fetchDataWithReformer:nil];
        
        NSDictionary *realData = receiveData[@"data"];
        
        NSString *errMessage = receiveData[@"msg"];
        
        if ([receiveData[@"errcode"]integerValue] == 0) {
            
            SHICanAddReceiveData *iCanListReceiveData = [SHICanAddReceiveData mj_objectWithKeyValues:realData];
            
            _iCanAddReceiveData = iCanListReceiveData;
            //            [SHUserManager shareManager].userModel = loginReceiveData;
            
            //        self.resultLable.text = @"success";
            [self updateImage:_images withIcanId:iCanListReceiveData.ID];
            
        }else{
            
            [SVProgressHUD showErrorWithStatus:errMessage];
            
        }
        
        
        NSLog(@"%@", [manager fetchDataWithReformer:nil]);
        //        [self layoutResultLable];
    }else if(manager == self.querySkillListApiManager){
        
        NSDictionary *receiveData = [manager fetchDataWithReformer:nil];
        
        NSDictionary *realData = receiveData[@"data"];
        
        NSString *errMessage = receiveData[@"msg"];
        
        if ([receiveData[@"errcode"]integerValue] == 0) {
            
            SHQuerySkillListReceiveData *querySkillListReceiveData = [SHQuerySkillListReceiveData mj_objectWithKeyValues:realData];
            
//            fenleiV.dataArr = dataArray;
            SHQuerySkillListData *model;
            if (querySkillListReceiveData.iData.count > 0) {
                model = querySkillListReceiveData.iData[0];
            }
            __weak typeof(self) weakSelf = self;

            SHGongGaoXuanController *vc = [[SHGongGaoXuanController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            [vc registBlock:^(NSString *title) {
                
                weakSelf.fenleiV.detailLb.text = title;
                
                weakSelf.iCanAddAskData.fkSkillId = model.ID;

            }];

            
//            SHPopListView *view = [[SHPopListView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), 200) style:UITableViewStylePlain];
//            
//            view.modelArr = querySkillListReceiveData.iData;
            
//            __weak typeof(self) weakSelf = self;
//
//            [view registModelBlock:^(SHQuerySkillListData *model) {
//                
//                [LEEAlert closeWithCompletionBlock:^{
//                    
//                    NSLog(@"选中的%@" ,model.name);
//                    weakSelf.fenleiV.detailLb.text = model.name;
//                    
//                    weakSelf.iCanAddAskData.fkSkillId = model.ID;
//                }];
//                
//            }];
//            
//            [LEEAlert actionsheet].config
//            .LeeTitle(@"请选择")
//            .LeeItemInsets(UIEdgeInsetsMake(0, 0, 20, 0))
//            .LeeAddCustomView(^(LEECustomView *custom) {
//                
//                custom.view = view;
//                
//                custom.isAutoWidth = YES;
//            })
//            .LeeItemInsets(UIEdgeInsetsMake(0, 0, 0, 0))
//            .LeeAddAction(^(LEEAction *action) {
//                
//                action.title = @"取消";
//                
//                action.titleColor = TabbarNorColer;
//                
//                action.backgroundColor = [UIColor whiteColor];
//            })
//            .LeeHeaderInsets(UIEdgeInsetsMake(20, 0, 0, 0))
//            .LeeHeaderColor([UIColor whiteColor])
//            .LeeActionSheetBottomMargin(0.0f) // 设置底部距离屏幕的边距为0
//            .LeeCornerRadius(0.0f) // 设置圆角曲率为0
//            .LeeConfigMaxWidth(^CGFloat(LEEScreenOrientationType type) {
//                
//                // 这是最大宽度为屏幕宽度 (横屏和竖屏)
//                
//                return CGRectGetWidth([[UIScreen mainScreen] bounds]);
//            })
//            .LeeShow();

            
//            [SVProgressHUD showSuccessWithStatus:@"提交成功"];
            
            //            [SHUserManager shareManager].userModel = loginReceiveData;
            
            //        self.resultLable.text = @"success";
            
        }else{
            
            [SVProgressHUD showErrorWithStatus:errMessage];
            
        }

        
    }
}

- (void)managerCallAPIDidFailed:(CTAPIBaseManager *)manager
{
    if (manager == self.iCanAddApiManager) {
        //        self.resultLable.text = @"fail";
        [SVProgressHUD showErrorWithStatus:@"网络错误"];
        
        //        [self layoutResultLable];
    }else if (manager == self.querySkillListApiManager){
        [SVProgressHUD showErrorWithStatus:@"网络错误"];

    }
}

#pragma mark - getters and setters
- (SHICanAddApiManager *)iCanAddApiManager
{
    if (_iCanAddApiManager == nil) {
        _iCanAddApiManager = [[SHICanAddApiManager alloc] init];
        _iCanAddApiManager.delegate = self;
        _iCanAddApiManager.paramSource = self;
    }
    return _iCanAddApiManager;
}

- (SHQuerySkillListApiManager *)querySkillListApiManager
{
    if (_querySkillListApiManager == nil) {
        _querySkillListApiManager = [[SHQuerySkillListApiManager alloc] init];
        _querySkillListApiManager.delegate = self;
        _querySkillListApiManager.paramSource = self;
    }
    return _querySkillListApiManager;
}

@end
