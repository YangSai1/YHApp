//
//  SHUpdateImageTool.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/14.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHUpdateImageTool.h"

@implementation SHUpdateImageTool

+ (void)CommentPicWithDic:(NSDictionary *)dic//上传图片时可能有的附加条件如userid;
               withImages:(NSDictionary *)imageDic//存图片的字典
                  success:(void (^)(NSDictionary *))success
                    faile:(void (^)(NSError *))faile
{
//    [SVProgressHUD showWithStatus:@"内容上传中..."];
//    NSData *imageData  = UIImagePNGRepresentation(_selectedPhotos[0]);
//    NSDictionary *Dict = @{@"fileType":@"image",@"filePurpose":@"groupPhoto",@"fkPurposeId":Str};
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager POST:UrL_UploadImage
//       parameters:Dict
//constructingBodyWithBlock:
//     ^(id<AFMultipartFormData>_Nonnull formData) {
//         [formData appendPartWithFileData:imageData name:@"uploadFile" fileName:@"groupPhoto.png" mimeType:@"image/png"];
//     } progress:nil
//          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//              [SVProgressHUD dismiss];
//              [weakSelf.navigationController popViewControllerAnimated:YES];
//              NSLog(@"图片上传成功啦");
//          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//              NSLog(@"图片上传失败啦");
//          }];
//}
//}
//
//{
//    {
//        [SVProgressHUD showWithStatus:@"内容上传中..."];
//        NSData *imageData  = UIImagePNGRepresentation(_selectedPhotos[0]);
//        NSDictionary *Dict = @{@"fileType":@"image",@"filePurpose":@"groupPhoto",@"fkPurposeId":Str};
//        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//        [manager POST:UrL_UploadImage
//           parameters:Dict
//constructingBodyWithBlock:
//         ^(id<AFMultipartFormData>_Nonnull formData) {
//             [formData appendPartWithFileData:imageData name:@"uploadFile" fileName:@"groupPhoto.png" mimeType:@"image/png"];
//         } progress:nil
//              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                  [SVProgressHUD dismiss];
//                  [weakSelf.navigationController popViewControllerAnimated:YES];
//                  NSLog(@"图片上传成功啦");
//              } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                  NSLog(@"图片上传失败啦");
//              }];
//    }
}

@end
