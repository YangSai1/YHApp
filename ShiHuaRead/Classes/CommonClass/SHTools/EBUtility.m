//
//  EBUtility.m
//  test_productInfo
//
//  Created by zyh on 15/4/15.
//  Copyright (c) 2015年 zyh. All rights reserved.
//

#import "EBUtility.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>
#import <sys/xattr.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
@implementation EBUtility

+ (NSString *)libraryDirectory
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *libraryDircrory = [path objectAtIndex:0];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL fileExists = [fileManager fileExistsAtPath:libraryDircrory];
    if (!fileExists)
    {
        [fileManager createDirectoryAtPath:libraryDircrory withIntermediateDirectories:YES attributes:nil error:nil];
//        [self addSkipBackupAttributeToItemAtPath:libraryDircrory];
    }
    
    //test
//    libraryDircrory = @"/Users/zyh/Desktop/IM/testDB";
    /////
    
    return libraryDircrory;
}

+ (NSString *)documentDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

+ (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *)path
{
    //ATLogInfo(@"path is:----%@",path);
    NSComparisonResult order = [[UIDevice currentDevice].systemVersion compare:@"5.1" options:NSNumericSearch];
    //version>=5.1
    if (order == NSOrderedDescending||order == NSOrderedSame)
    {
        //assert([[NSFileManager defaultManager] fileExistsAtPath:path]);
        if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
            return NO;
        }
        NSError *error = nil;
        NSURL *URL = [NSURL fileURLWithPath:path];
        BOOL success = [URL setResourceValue:[NSNumber numberWithBool:YES]
                                      forKey:NSURLIsExcludedFromBackupKey
                                       error:&error];
        if (!success)
        {
            NSLog(@"Error excluding %@ from backup %@",[URL lastPathComponent],error);
        }
        return success;
    }
    else
    {
        const char* filePath = [path fileSystemRepresentation];
        
        const char* attrName = "com.apple.MobileBackup";
        u_int8_t attrValue = 1;
        
        int result = setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
        
        NSLog(@"setxattr result = %d",result);
        
        return result == 0;
    }
    return NO;
}

+ (BOOL)createDir:(NSString *)dir
{
    BOOL bResult = YES;
    if (![self isFileOrDirectoryExist:dir isFile:NO]){
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSError *error = nil;
        bResult = [fileManager createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:&error];
        if (!bResult) {
            NSString *errMsg = [NSString stringWithFormat:@"create Dir : %@ faild, error : %@", dir, [error description]];
            NSAssert(bResult, errMsg);
        }
    }
    return bResult;
}

+ (BOOL)isFileOrDirectoryExist:(NSString *)path isFile:(BOOL)isFile
{
    BOOL exist = NO;
    BOOL isDir = NO;
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    if(![defaultManager fileExistsAtPath:path isDirectory:&isDir])
    {
        NSLog(@"this file or directory %@ is not exist!",path);
    }
    else
    {
        if(!isDir)
        {
            if(!isFile){
                exist=NO;
                NSLog(@"this directory %@ is not exist",path);
            }
            else
                exist=YES;
        }
        else {
            if(!isFile)
                exist=YES;
            else {
                exist=NO;
                NSLog(@"this file %@ is not exist",path);
            }
        }
    }
    return exist;
}

+ (void)removeAllFilesInFolder:(NSString *)folderPath
{
    if(folderPath)
    {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSError *error = nil;
        NSArray *files = [fileManager contentsOfDirectoryAtPath:folderPath error:&error];
        for(int i=0; i<[files count]; i++)
        {
            NSString *filename = [files objectAtIndex:i];
            NSString *filePath = [folderPath stringByAppendingPathComponent:filename];
            
            [self deleteFileAtPath:filePath];
        }
    }
}

+ (void)deleteFileAtPath:(NSString *)filePath
{
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    NSError *error = nil;
    if([defaultManager removeItemAtPath:filePath error:&error])
    {
        NSLog(@"success delete file: %@", filePath);
    }
    else
    {
        NSLog(@"error delete file: %@, %@", filePath, [error description]);
    }
}

+ (long long)fileSize:(NSString *)filePath
{
    NSError *attributesError = nil;
    NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:&attributesError];
    NSNumber *fileSizeNumber = [fileAttributes objectForKey:NSFileSize];
    long long fileSize = [fileSizeNumber longLongValue];
    return fileSize;
}

+ (NSString *)formattedFileSize:(unsigned long long)size
{
    NSString *formattedStr = nil;
    if (size == 0)
        formattedStr = NSLocalizedString(@"Empty", nil);
    else if (size > 0 && size < 1024)
        formattedStr = [NSString stringWithFormat:NSLocalizedString(@"%qu bytes", nil), size];
    else if (size >= 1024 && size < pow(1024, 2))
        formattedStr = [NSString stringWithFormat:NSLocalizedString(@"%.1f KB", nil), (size / 1024.)];
    else if (size >= pow(1024, 2) && size < pow(1024, 3))
        formattedStr = [NSString stringWithFormat:NSLocalizedString(@"%.2f MB", nil), (size / pow(1024, 2))];
    else if (size >= pow(1024, 3))
        formattedStr = [NSString stringWithFormat:NSLocalizedString(@"%.3f GB", nil), (size / pow(1024, 3))];
    
    return formattedStr;
}

+ (UIColor *)UIColorFromHexColor:(NSString *)hexColor
{
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
 
    NSInteger startLocation = 0;
    if ([hexColor hasPrefix:@"#"]) {
        startLocation += 1;
    }
    
    range.location = startLocation;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    
    range.location += range.length;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location += range.length;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:1.0f];
}

+ (void)callWithString:(NSString *)phoneString
{
    [self callWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", phoneString]]];
}

+ (void)callWithURL:(NSURL *)url
{
    static UIWebView *webView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        webView = [UIWebView new];
    });
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
}

+ (NSString *)md5HexDigest:(NSString *)input
{
    NSMutableString *ret = [NSMutableString stringWithCapacity:0];
    if (input) {
        const char* str = [input UTF8String];
        unsigned char result[CC_MD5_DIGEST_LENGTH];
        CC_MD5(str, (unsigned int)strlen(str), result);
        for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
            [ret appendFormat:@"%02x",result[i]];
        }
    }
    return ret;
}

+ (NSMutableAttributedString *)priceAttrStrWithCutline:(NSString *)priceStr
{
    NSMutableAttributedString *cutPriceString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"¥ %@", priceStr]];
    [cutPriceString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, cutPriceString.length)];
    [cutPriceString addAttribute:NSStrikethroughColorAttributeName value:[UIColor clearColor] range:NSMakeRange(0, 2)];
    return cutPriceString;
}

+ (NSMutableAttributedString *)changePartStringStyleWithString:(NSString *)string WithColor:(UIColor *)color WithSize:(int)size WithRange:(NSRange)range
{
    NSMutableAttributedString *theNewString = [[NSMutableAttributedString alloc] initWithString:string];
//    [theNewString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, cutPriceString.length)];
    UIFont *font = [UIFont systemFontOfSize:size];
    [theNewString addAttribute:NSFontAttributeName value:font range:range];
    [theNewString addAttribute:NSForegroundColorAttributeName value:color range:range];
    return theNewString;
}

+ (NSMutableAttributedString *)setPriceAttrStr:(NSString *)presentPrice
                                 originalPrice:(NSString *)originalPrice
                                 intervalSpace:(NSString *)intervalSpace
                              presentFontSize:(float)presenFontSize
                              originalFontSize:(float)originalFontSize
{
    NSString *presentPriceStr = [NSString stringWithFormat:@"¥%@", presentPrice];
    NSString *originalPriceStr = @"";
    if (originalPrice && originalPrice.length > 0) {
        originalPriceStr = [NSString stringWithFormat:@"¥%@", originalPrice];
    }
    NSString *priceStr = [NSString stringWithFormat:@"%@%@%@", presentPriceStr, intervalSpace, originalPriceStr];
    NSMutableAttributedString *priceAttrStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    
    //给现价调整样式
    UIColor *presentPriceColor = [EBUtility UIColorFromHexColor:@"e50a06"];
    NSRange presentPriceRange = NSMakeRange(0, presentPriceStr.length);
    [priceAttrStr removeAttribute:NSFontAttributeName range:presentPriceRange];
    [priceAttrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:presenFontSize] range:presentPriceRange];
    [priceAttrStr addAttribute:NSForegroundColorAttributeName value:presentPriceColor range:presentPriceRange];
    
    //给原价调整样式
    if (originalPriceStr.length > 0) {
        UIColor *originalPriceColor = [EBUtility UIColorFromHexColor:@"949494"];
        NSRange originalPriceRange = NSMakeRange(presentPriceStr.length + intervalSpace.length, originalPriceStr.length);
        [priceAttrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:originalFontSize] range:originalPriceRange];
        [priceAttrStr addAttribute:NSForegroundColorAttributeName value:originalPriceColor range:originalPriceRange];
        [priceAttrStr addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, priceStr.length)];
        [priceAttrStr addAttribute:NSStrikethroughColorAttributeName value:[UIColor clearColor] range:NSMakeRange(0, presentPriceStr.length + intervalSpace.length + 1)]; //+1是“¥”的长度
        [priceAttrStr endEditing];
        
    }
    
    return priceAttrStr;
}

+ (BOOL)customServiceWithQQ:(NSString *)qqNum
{
    BOOL bCanCallQQ = NO;
    NSString *urlStr = [NSString stringWithFormat:@"mqq://im/chat?chat_type=wpa&uin=%@&version=1&src_type=web", qqNum];
    NSURL *url = [NSURL URLWithString:urlStr];
    if([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url];
        bCanCallQQ = YES;
    }
    return bCanCallQQ;
}

+ (void)appraiseAppAtAppStore:(NSString *)appID
{
    NSString *appraiseStr = [NSString stringWithFormat:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8", appID];
    if([[[UIDevice currentDevice] systemVersion] doubleValue] < 7.0)
    {
        appraiseStr = [NSString stringWithFormat: @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", appID];
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appraiseStr]];
}

+ (void)downLoadAppAtAppStore:(NSString *)appID
{
    NSString *downLoadStr = [NSString stringWithFormat: @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%@",  appID];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:downLoadStr]];
}

+ (BOOL)isPriceValid:(NSString *)priceStr
{
    BOOL bValid = NO;
    float priceValue = [priceStr floatValue];
    if (priceValue >= 0.01) {
        bValid = YES;
    }
    return bValid;
}

+ (NSString *)appVersionInfo
{
    NSString *versionInfo = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    return versionInfo;
}

+ (NSString *)appBuildVersionInfo{
    NSString *buildVersionInfo = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    return buildVersionInfo;
}

+ (BOOL)validateMobile:(NSString *)mobile
{
    //手机号以1开头的11位数字
    NSString *phoneRegex = @"^1[0-9]{10}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

+ (BOOL)validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

+ (BOOL)validateUserName: (NSString *)userName
{
    
    NSString *regex = @"[a-zA-Z0-9\u4e00-\u9fa5][a-zA-Z0-9\u4e00-\u9fa5]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if(userName.length < 2) return NO;
    if(userName.length > 20) return NO;
    if(![pred evaluateWithObject:userName]) return NO;
    return YES;
}

+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)validatePassword:(NSString *)pwd
{
    NSString *pwdRegex = @"^[\\w\\@\\#\\$\\.\\,\\-]{6,20}$";
    NSPredicate *pwdTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pwdRegex];
    return [pwdTest evaluateWithObject:pwd];
}

+ (BOOL)validateNumberPwd:(NSString *)pwd
{
    if (pwd.length != 6 && pwd.length != 8) {
        return NO;
    }
    NSScanner* scan = [NSScanner scannerWithString:pwd];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

+ (BOOL)validateNumberSexPwd:(NSString *)pwd
{
    if (pwd.length != 6) {
        return NO;
    }
    NSScanner* scan = [NSScanner scannerWithString:pwd];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

+ (NSString *)processMobileNo:(NSString *)mobileNo
{
    if (mobileNo.length > 9) {
        return [mobileNo stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    }
    return mobileNo;
}

+ (CGSize)textSize:(NSString *)text
          withFont:(UIFont *)font
       withMaxSize:(CGSize)maxSize
{
    if (!font) {
        font = fontCommon_15;
    }
    NSDictionary *attrs = @{NSFontAttributeName : font};
    CGSize textSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    return textSize;
}

+ (CGSize)heightForAttrStr:(NSMutableAttributedString *)attrStr withLblWidth:(CGFloat)lblWidth
{
    return [self heightForAttrStr:attrStr withLblWidth:lblWidth withFontSize:14.0f];
}

+ (CGSize)heightForAttrStr:(NSMutableAttributedString *)attrStr withLblWidth:(CGFloat)lblWidth withFontSize:(CGFloat)fontSize
{
    NSRange allRange = NSMakeRange(0, attrStr.length);
    [attrStr addAttribute:NSFontAttributeName
                    value:[UIFont systemFontOfSize:fontSize]
                    range:allRange];
    [attrStr addAttribute:NSForegroundColorAttributeName
                    value:[UIColor blackColor]
                    range:allRange];
    
    CGFloat titleHeight;
    
    NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attrStr boundingRectWithSize:CGSizeMake(lblWidth, CGFLOAT_MAX)
                                        options:options
                                        context:nil];
    titleHeight = ceilf(rect.size.height);
    
    rect.size.height = titleHeight + 2; // 加两个像素,防止emoji被切掉.
    
    return rect.size;
}

#pragma mark - 图片缩放处理

+ (UIImage *)scaleImage:(UIImage *)img toSize:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)newSize andOffSet:(CGPoint)offSet
{
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(offSet.x, offSet.y, newSize.width-offSet.x*2, newSize.height-offSet.y*2)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (NSMutableAttributedString *)setUnderlineLWithLabelString:(NSString *)LblString{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:LblString];
    NSRange strRange = {0, [str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    return  str;
}

+ (NSString *)birthdayWithTimeStr:(NSString *)birthdayStr
{
    return [NSString stringWithFormat:@"%@ 00:00:00", birthdayStr];
}

+ (NSString *)birthdayWithoutTimeStr:(NSString *)birthdayStr
{
    NSArray *tempArr = [birthdayStr componentsSeparatedByString:@" "];
    NSString *newBirthdayStr = birthdayStr;
    if ([tempArr count] > 1) {
        newBirthdayStr = [tempArr objectAtIndex:0];
    }
    return newBirthdayStr;
}

+ (NSString *)relationStrOfValue:(NSNumber *)relationshipValue
{
    NSString *relationshipStr = nil;
    switch ([relationshipValue integerValue]) {
        case kRelationshipParent:
            relationshipStr = @"父母";
            break;
        case kRelationshipMarry:
            relationshipStr = @"夫妻";
            break;
        case kRelationshipChild:
            relationshipStr = @"子女";
            break;
        case kRelationshipOther:
            relationshipStr = @"其他";
            break;
            
        default:
            break;
    }
    return relationshipStr;
}

+ (NSNumber *)relationValueOfStr:(NSString *)relationshipStr
{
    kRelationship relationshipValue = kRelationshipMarry;
    if ([relationshipStr isEqualToString:@"父母"]) {
        relationshipValue = kRelationshipParent;
    
    }else if ([relationshipStr isEqualToString:@"夫妻"]) {
        relationshipValue = kRelationshipMarry;
    
    }else if ([relationshipStr isEqualToString:@"子女"]) {
        relationshipValue = kRelationshipChild;
        
    }else if ([relationshipStr isEqualToString:@"其他"]) {
        relationshipValue = kRelationshipOther;
        
    }
    return [NSNumber numberWithInteger:relationshipValue];
}

+ (BOOL)isNullString:(NSString *)sourceStr
{
    BOOL bResult = YES;
    if (![sourceStr isEqual:[NSNull null]] && sourceStr.length > 0) {
        bResult = NO;
    }
    return bResult;
}

+ (NSString *)toRLMValidStr:(NSString *)srcStr
{
    if ([self isNullString:srcStr]) {
        srcStr = @"";
    }
    return srcStr;
}

+ (NSString *)urlWithChineseTransferredMeaning:(NSString *)urlStr
{
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return urlStr;
}

+ (NSString *)getDateFromTimestampString:(NSString *)str
{
    if (![str isEqual:[NSNull null]] && str.length > 10) {
        str = [str substringWithRange:NSMakeRange(0,10)];
    }
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:str.intValue];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

+ (int)getUserAgeWithBirthday:(NSString *)birthday
{
    NSString *curYear;
    NSString* date;
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    date = [formatter stringFromDate:[NSDate date]];
    int age = 0;
    if (date) {
        curYear = [date substringToIndex:4];
    }
    NSString *birthdayYear;
    if (birthday.length >= 10){
        NSArray *arr = [birthday componentsSeparatedByCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"/-"]];
        for (int i = 0; i < arr.count; i ++) {
            NSString *str = [arr objectAtIndex:i];
            if (str.length == 4) {
                birthdayYear = str;
            }
        }
    }else{
        age = 0;
        return age;
    }
    age = [curYear intValue] - [birthdayYear intValue];
    return age;
}

+ (NSInteger)getUserAge:(NSString *)birthday{
    NSInteger age = 0;
    if (birthday.length >= 10) {
        NSInteger birYear = [[birthday substringWithRange:NSMakeRange(0, 4)] integerValue];
        NSInteger birMonth = [[birthday substringWithRange:NSMakeRange(5, 2)] integerValue];
        NSInteger birDay = [[birthday substringWithRange:NSMakeRange(8, 2)] integerValue];
        
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSString *date = [formatter stringFromDate:[NSDate date]];
        NSInteger nowYear = [[date substringWithRange:NSMakeRange(0, 4)] integerValue];
        NSInteger nowMonth = [[date substringWithRange:NSMakeRange(5, 2)] integerValue];
        NSInteger nowDay = [[date substringWithRange:NSMakeRange(8, 2)] integerValue];
        
        if (nowYear <= birYear) {
            return 0;
        }
        age = nowYear - birYear ;
        if (nowMonth < birMonth) {
            age -= 1;
        }else if (nowMonth == birMonth){
            if (nowDay < birDay) {
                age -= 1;
            }
        }
    }
    return  age;

}

+ (void)setLabelTitle:(NSString *)title FontSize:(CGFloat)font label:(UILabel *)label
{
    label.text = title;
    label.font = [UIFont fontWithName:@"Heiti SC" size:font];
    CGRect rect = [label.text boundingRectWithSize:CGSizeMake(kScreenWidth, label.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading  attributes:@{NSFontAttributeName:label.font} context:nil];
    label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, rect.size.width, label.frame.size.height);
}

+(void)setLabelHeightTitle:(NSString *)title FontSize:(CGFloat)font lines:(NSInteger)lines label:(UILabel *)label
{
    label.text = title;
    //设置自动行数与字符换行
    label.numberOfLines = lines;
    label.font = [UIFont fontWithName:@"Heiti SC" size:font];
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    //设置一个行高上限
    CGSize size = CGSizeMake([label vWidth],MAXFLOAT);
    CGSize labelsize = [label sizeThatFits:size];
    
    label.frame = CGRectMake([label xPos], [label yPos], [label vWidth], labelsize.height);
}



#pragma mark - 获取设备IP地址

+ (NSString *)getIPAddress
{
    NSString *address = @"127.0.0.1";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                NSString *ipNetName = [NSString stringWithUTF8String:temp_addr->ifa_name];
                if([ipNetName hasPrefix:@"en"]) // Check if interface is en0 which is the wifi connection on the iPhone
                {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                    break;
                
                }else if ([ipNetName isEqualToString:@"pdp_ip0"]) { //手机用移动网络时网卡名字
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                    
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}

#pragma mark - URL encode decode

+ (NSString*)encodeString:(NSString*)unencodedString
{
    // CharactersToBeEscaped = @":/?&=;+!@#$()~',*";
    // CharactersToLeaveUnescaped = @"[].";
    
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)unencodedString,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}

+ (NSString *)decodeString:(NSString*)encodedString
{
    //NSString *decodedString = [encodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *decodedString  = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                                     (__bridge CFStringRef)encodedString,
                                                                                                                     CFSTR(""),
                                                                                                                     CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    return decodedString;
}

#pragma mark - 商城跳转URL拼接

+ (NSString *)mallUrlWithWebsite:(NSString *)website andParam:(NSString *)param andGoUrl:(NSString *)goUrl
{
    NSString *paramEncodeStr = [self encodeString:param];
    NSString *goUrlEncodeStr = [self encodeString:goUrl];
    NSString *urlStr = [NSString stringWithFormat:@"%@?req_str=%@&gotourl=%@", website, paramEncodeStr, goUrlEncodeStr];
    return urlStr;
}

+ (BOOL)isDefaultBirthday:(NSString *)birthdayStr
{
    BOOL bResult = NO;
    if ([birthdayStr hasPrefix:@"1900"]) {
        bResult = YES;
    }
    return bResult;
}

+ (BOOL)isBlankString:(NSString *)string
{
    BOOL bResult = NO;
    if ([self isNullString:string]) {
        bResult = YES;
    
    }else if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        bResult = YES;
        
    }
    return bResult;
}

+ (CGFloat)sizeAfterScale:(CGFloat)size
{
    CGFloat scale = kScreenHeight/kBaseHight;
    if (scale < 1.0f) {
        scale = 1.0f;
    }
    return size * scale;
}

+ (BOOL)isSrcStr:(NSString *)srcStr containSubStr:(NSString *)subStr
{
    BOOL bResult = YES;
    NSRange tempRange = [srcStr rangeOfString:subStr];
    if (tempRange.location == NSNotFound) {
        bResult = NO;
    }
    return bResult;
}

+ (NSString *)getIdentityNameWithType:(NSInteger)type
{
    NSString *IDCardName;
    switch (type) {
        case 1:
            IDCardName = @"身份证";
            break;
        case 31:
            IDCardName = @"护照";
            break;
            
        default:
            break;
    }
    return IDCardName;
}

+ (NSString *)getPhotoPathWithInfo:(NSDictionary *)info;
{
    //先把图片转成NSData
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    CGFloat baseWidth = 640;
    CGFloat baseHeight = 480;
    CGFloat scale = MIN(baseWidth/image.size.width, baseHeight/image.size.height);
    CGSize size = CGSizeMake(image.size.width * scale, image.size.height * scale);
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    image = scaledImage;
    NSData *data;
    if (!UIImagePNGRepresentation(image))
    {
        data = UIImageJPEGRepresentation(image, 1.0);
        
    }else{
        data = UIImagePNGRepresentation(image);
        
    }
    //图片保存的路径
    NSString *photoDir = [EBUtility documentDirectory];
    NSString *fileName = [NSString stringWithFormat:@"%ld.png", (long)[NSDate timeIntervalSinceReferenceDate]];
    NSString *photoPath = [photoDir stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createFileAtPath:photoPath contents:data attributes:nil];
    return photoPath;
}

+ (NSString *)uuidString
{
    CFUUIDRef uuidObj = CFUUIDCreate(nil);//create a new UUID
    //get the string representation of the UUID
    NSString *uuidString = (NSString*)CFBridgingRelease(CFUUIDCreateString(nil, uuidObj));
    CFRelease(uuidObj);
    return uuidString;
}

+ (UIImage *)PureColorImageFromColor:(UIColor *)color withSize:(CGSize)imgSize
{
    CGRect rect = CGRectMake(0, 0, imgSize.width, imgSize.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}


+ (BOOL)stringContainsEmoji:(NSString *)string{
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}


@end
