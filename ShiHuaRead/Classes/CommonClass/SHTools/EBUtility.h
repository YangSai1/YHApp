//
//  EBUtility.h
//  test_productInfo
//
//  Created by zyh on 15/4/15.
//  Copyright (c) 2015年 zyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, kRelationship) {
    kRelationshipMarry = 1,
    kRelationshipParent,
    kRelationshipChild,
    kRelationshipOther
};

@interface EBUtility : NSObject

/**
 *  取目录相关
 */
+ (NSString *)libraryDirectory;
+ (NSString *)documentDirectory;

/**
 *  文件相关操作
 */
+ (BOOL)isFileOrDirectoryExist:(NSString *)path isFile:(BOOL)isFile;
+ (void)removeAllFilesInFolder:(NSString *)folderPath;
+ (void)deleteFileAtPath:(NSString *)filePath;
+ (long long)fileSize:(NSString *)filePath;
+ (NSString *)formattedFileSize:(unsigned long long)size;

+ (UIColor *)UIColorFromHexColor:(NSString *)hexColor;
+ (void)callWithString:(NSString *)phoneString;
+ (void)callWithURL:(NSURL *)url;
+ (NSString *)dealAndMd5HexDigest:(NSString *)input;
+ (NSString *)md5HexDigest:(NSString*)input;
+ (NSMutableAttributedString *)priceAttrStrWithCutline:(NSString *)priceStr;
+ (NSMutableAttributedString *)changePartStringStyleWithString:(NSString *)string WithColor:(UIColor *)color WithSize:(int)size WithRange:(NSRange)range;

/**
 *  价格样式富文本
 */
+ (NSMutableAttributedString *)setPriceAttrStr:(NSString *)presentPrice
                                 originalPrice:(NSString *)originalPrice
                                 intervalSpace:(NSString *)intervalSpace
                               presentFontSize:(float)presenFontSize
                              originalFontSize:(float)originalFontSize;


/**
 *  效验手机号有效性
 */
+ (BOOL)validateMobile:(NSString *)mobile;

/**
 *  效验身份证号有效性
 */
+ (BOOL)validateIdentityCard: (NSString *)identityCard;

/**
 *  效验姓名有效性
 */
+ (BOOL)validateUserName: (NSString *)userName;

/**
 *  效验邮箱有效性
 */
+ (BOOL)validateEmail:(NSString *)email;

/**
 *  效验密码有效性
 */
+ (BOOL)validatePassword:(NSString *)pwd;

/** 验证是否6或8位纯数字密码*/
+ (BOOL)validateNumberPwd:(NSString *)pwd;

/** 验证是否6纯数字密码*/
+ (BOOL)validateNumberSexPwd:(NSString *)pwd;
/**
 *  将手机号13855323925变为138****35
 */
+ (NSString *)processMobileNo:(NSString *)mobileNo;

/** 计算字串的宽高*/
+ (CGSize)textSize:(NSString *)text
          withFont:(UIFont *)font
       withMaxSize:(CGSize)maxSize;

/** 富文本宽高计算*/
+ (CGSize)heightForAttrStr:(NSMutableAttributedString *)attrStr withLblWidth:(CGFloat)lblWidth;
+ (CGSize)heightForAttrStr:(NSMutableAttributedString *)attrStr withLblWidth:(CGFloat)lblWidth withFontSize:(CGFloat)fontSize;

/** 缩放图片*/
+ (UIImage *)scaleImage:(UIImage *)img toSize:(CGSize)size;
+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)newSize andOffSet:(CGPoint)offSet;

/** 加下划线*/
+ (NSMutableAttributedString *)setUnderlineLWithLabelString:(NSString *)LblString;

/** 为生日添加00:00:00后缀（协议要求）*/
+ (NSString *)birthdayWithTimeStr:(NSString *)birthdayStr;

/** 将从服务器拿到的生日去除后面的00:00:00后缀*/
+ (NSString *)birthdayWithoutTimeStr:(NSString *)birthdayStr;


/** 判断string是否为空*/
+ (BOOL)isNullString:(NSString *)sourceStr;

/** 
 *  将无效空string转为@""
 *  Realm数据库不能存空值, RLMObject赋值专用
 */
+ (NSString *)toRLMValidStr:(NSString *)srcStr;
/**
 *  将有中文字符的字符串URL转化
 *
 *  @param urlStr 需要转化的URL string
 *
 *  @return 完成转换的URL string
 */
+ (NSString *)urlWithChineseTransferredMeaning:(NSString *)urlStr;

/**
 *  时间戳转时间格式（格式：yyyy-MM-dd）
 *
 *  @param str 时间戳
 *
 *  @return 时间
 */
+ (NSString *)getDateFromTimestampString:(NSString *)str;

/**
 *  根据生日获取年龄
 *
 *  @param birthday 生日
 *
 *  @return 年龄
 */
+ (int)getUserAgeWithBirthday:(NSString *)birthday;

/** 获得用户年龄（周岁）*/
+ (NSInteger)getUserAge:(NSString *)birthday;

/**
 *  根据label内容，字体大小自使用label宽度
 */
+ (void)setLabelTitle:(NSString *)title FontSize:(CGFloat)font label:(UILabel *)label;

/**
 *  根据label内容，字体大小,行数 自使用label高度
 */
+(void)setLabelHeightTitle:(NSString *)title FontSize:(CGFloat)font lines:(NSInteger)lines label:(UILabel *)label;

/** 获取设备IP地址*/
+ (NSString *)getIPAddress;

/** URL encode decode*/
+ (NSString*)encodeString:(NSString*)unencodedString;
+ (NSString *)decodeString:(NSString*)encodedString;

/** 判断生日值是否是服务器默认值*/
+ (BOOL)isDefaultBirthday:(NSString *)birthdayStr;

/** 判断string是否是空或空格字串*/
+ (BOOL)isBlankString:(NSString *)string;

/** 根据实际分辨率动态计算宽高*/
+ (CGFloat)sizeAfterScale:(CGFloat)size;

/** 判断srcStr是否包含subStr*/
+ (BOOL)isSrcStr:(NSString *)srcStr containSubStr:(NSString *)subStr;

/** 将证件类型由数字转换成中文名*/
+ (NSString *)getIdentityNameWithType:(NSInteger)type;

/* 处理相机获得的图片，进行压缩转换缓存处理得到路径 */
+ (NSString *)getPhotoPathWithInfo:(NSDictionary *)info;

+ (NSString *)uuidString;

/** 根据颜色值生成一张纯色图片*/
+ (UIImage *)PureColorImageFromColor:(UIColor *)color withSize:(CGSize)imgSize;


/** 判断string是否包含Emoji表情
 
 ：Emoji表情最终会被编码成Unicode，因此，通过Emoji表情的Unicode编码的范围，判断用户是否输入了Emoji表情
 
 */

+ (BOOL)stringContainsEmoji:(NSString *)string;

@end
