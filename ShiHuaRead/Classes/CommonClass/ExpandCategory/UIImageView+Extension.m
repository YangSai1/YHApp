//
//  UIImageView+Extension.m
//  XCFApp
//
//  Created by callmejoejoe on 16/4/3.
//  Copyright © 2016年 Joey. All rights reserved.
//

#import "UIImageView+Extension.h"
#import <UIImageView+WebCache.h>
#import "UIImage+Extension.h"

@implementation UIImageView (Extension)

- (void)setHeaderWithURL:(NSURL *)url {
    
    UIImage *placeholder = [UIImage imageNamed:@"icon-60@2x"];
    
    [self sd_setImageWithURL:url
            placeholderImage:placeholder
                   completed:^(UIImage *image,
                               NSError *error,
                               SDImageCacheType cacheType,
                               NSURL *imageURL) {
        self.image = image ? image : placeholder;
    }];
    
}

@end
