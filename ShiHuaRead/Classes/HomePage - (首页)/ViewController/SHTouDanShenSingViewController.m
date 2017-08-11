//
//  SHTouDanShenSingViewController.m
//  qianqu
//
//  Created by 海波的电脑 on 2017/8/9.
//  Copyright © 2017年 海波的电脑. All rights reserved.
//

#import "SHTouDanShenSingViewController.h"
#import "SHShenqingCellOne.h"
#import "SHShenQingCellTwo.h"
#import "SHShenQingCellthree.h"
#import "SHZhiFuViewController.h"
@interface SHTouDanShenSingViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate, UIActionSheetDelegate,UINavigationControllerDelegate,UITextViewDelegate>
@property(nonatomic, strong)UIImagePickerController *imagePicker;

@property(nonatomic,strong)UITableView * toudanTable;
@property(nonatomic,strong)UIButton * selectedBtn;
@property(nonatomic,assign)BOOL ischengnuo;


@property(nonatomic,strong)NSString * baojiaStr;
@property(nonatomic,strong)NSString * jingyanStr;
@property(nonatomic,strong)NSString * shuomingStr;
@property(nonatomic,strong)NSString * shoujihaoStr;
@end

@implementation SHTouDanShenSingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.ischengnuo = NO;
    self.navigationItem.title = @"投单申请";
    [self setUpToudansshenqingTable];
    [self setUpTiJiaoBtn];
}
-(void)setUpTiJiaoBtn{
    UIButton * tijaoBnt = [UIButton buttonWithType:UIButtonTypeCustom];
    [tijaoBnt setTitle:@"提交" forState:UIControlStateNormal];
    [tijaoBnt setBackgroundImage:[UIImage imageNamed:@"icon-tijiaokuang-480-81.png"] forState:UIControlStateNormal];
    [tijaoBnt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tijaoBnt addTarget:self action:@selector(tiajoClick:) forControlEvents:UIControlEventTouchUpInside];
    tijaoBnt.frame = CGRectMake((kScreenWidth - 241)/2, kScreenHeight - 60, 241, 41);
    [self.view addSubview:tijaoBnt];
}
//添加底部foot控件
-(UIView *)setFootView{
    UIView * footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
    UILabel * jineLable = [[UILabel alloc]initWithFrame:CGRectMake(30, 5, 200, 12)];
    jineLable.text = @"投弹履约金：￥500元";
    jineLable.font = [UIFont systemFontOfSize:12];
    jineLable.textColor = [UIColor darkGrayColor];
    [footView addSubview:jineLable];
    UIButton * chengnuoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [chengnuoBtn setImage:[UIImage imageNamed:@"icon-38.png"] forState:UIControlStateNormal];
    [chengnuoBtn setImage:[UIImage imageNamed:@"icon-38-38.png"] forState:UIControlStateSelected];
    [chengnuoBtn setTitle:@" 承诺满足发单需求" forState:UIControlStateNormal];
    [chengnuoBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    chengnuoBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    chengnuoBtn.titleLabel.textColor = [UIColor darkGrayColor];
    chengnuoBtn.frame = CGRectMake(0, 30, 170, 18);
    [chengnuoBtn addTarget:self action:@selector(chengnuoClick:) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:chengnuoBtn];
    return footView;
}
//点击提交按钮
-(void)tiajoClick:(UIButton *)btn{
    SHZhiFuViewController * zhifuVC = [[SHZhiFuViewController alloc]init];
    
    
    
    [self.navigationController pushViewController:zhifuVC animated:YES];
}
-(void)setUpToudansshenqingTable{
    UITableView * toudanshenqingTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)];
    toudanshenqingTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    toudanshenqingTable.dataSource = self;
    toudanshenqingTable.delegate = self;
    toudanshenqingTable.tableFooterView = [self setFootView];
    self.toudanTable = toudanshenqingTable;
    [self.view addSubview:toudanshenqingTable];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            return 35;
            break;
        case 1:
            return 100;
            break;
        case 2:
            return 100;
            break;
        case 3:
            return 35;
            break;
        case 4:
            return 140;
            break;
        default:
            return 0;
            break;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 || indexPath.row == 3) {
        SHShenqingCellOne * oneCell = [[SHShenqingCellOne alloc]init];
        oneCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [oneCell.textFieldView addTarget:self action:@selector(changeClick:) forControlEvents:UIControlEventEditingChanged];
        switch (indexPath.row) {
            case 0:
                oneCell.titleView.text = @"我的报价";
                oneCell.textFieldView.placeholder = @"请输入您的报价";
                oneCell.textFieldView.tag = 300;
                break;
            case 3:
                oneCell.titleView.text = @"联系电话";
                oneCell.textFieldView.placeholder = @"请输入您的联系电话号码";
                oneCell.textFieldView.tag = 400;
                break;
            default:
                break;
        }
        return oneCell;
    }else if (indexPath.row == 1 || indexPath.row == 2){
        SHShenQingCellTwo * twoCell = [[SHShenQingCellTwo alloc]init];
        twoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        switch (indexPath.row) {
            case 1:
                twoCell.titleView.text = @"我的经验";
                twoCell.textView.tag = 100;
                break;
            case 2:
                twoCell.titleView.text = @"我的说明";
                twoCell.textView.tag = 200;
                break;
            default:
                break;
        }
        twoCell.textView.delegate = self;
        twoCell.textLabel.text = @"文字内容200以内";
        return twoCell;
    }else{
        SHShenQingCellthree * threeCell = [[SHShenQingCellthree alloc]init];
        threeCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [threeCell.imageBtnOne addTarget:self action:@selector(imageoneClick:) forControlEvents:UIControlEventTouchUpInside];
        [threeCell.imageBtnTwo addTarget:self action:@selector(imageoneClick:) forControlEvents:UIControlEventTouchUpInside];
        [threeCell.imageBtnThree addTarget:self action:@selector(imageoneClick:) forControlEvents:UIControlEventTouchUpInside];
        return threeCell;
    }
}
//tefiled点击输入
-(void)changeClick:(UITextField *)textfield{
    if (textfield.tag == 300) {
        self.baojiaStr = textfield.text;
    }else{
        self.shoujihaoStr = textfield.text;
    }
}
#pragma UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
}
-(void)textViewDidEndEditing:(UITextView *)textView{
   
}
//点击选择图片
-(void)imageoneClick:(UIButton *)btn{
    [self pickImage:btn];
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
//点击承诺按钮
-(void)chengnuoClick:(UIButton *)btn{
    self.ischengnuo = !btn.selected;
    btn.selected = !btn.selected;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
