//
//  SHWebView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHWebView.h"

@interface SHWebView () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation SHWebView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    _webView = [[UIWebView alloc] initWithFrame:self.bounds];
    _webView.scalesPageToFit = YES;
    [_webView setBackgroundColor:[UIColor whiteColor]];
    _webView.delegate = self;
    
    [self addSubview:_webView];

}

- (void)setRequestUrl:(NSString *)requestUrl
{
    _requestUrl = requestUrl;
    NSURL *url = [NSURL URLWithString:_requestUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];

}

- (void)dealloc
{
    [_webView stopLoading];
    _webView.delegate = nil;
    
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

-(BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)reuqest navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"requestUrl : %@ navigationType = %d", reuqest.URL.absoluteString, (int)navigationType);
    if (navigationType == UIWebViewNavigationTypeBackForward) {
        [[NSURLCache sharedURLCache] removeAllCachedResponses];
    }
    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if(error.code == NSURLErrorCancelled)  {
        return;
    }
}

@end
