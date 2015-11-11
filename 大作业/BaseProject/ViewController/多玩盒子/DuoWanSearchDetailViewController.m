//
//  DuoWanSearchDetailViewController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanSearchDetailViewController.h"

@interface DuoWanSearchDetailViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@end

@implementation DuoWanSearchDetailViewController

-(instancetype)initWithRequest:(NSURLRequest *)request
{
    if(self = [super init])
    {
        self.request = request;
        //推出来，不显示下方栏
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

-(UIWebView *)webView
{
    if(!_webView)
    {
        _webView = [UIWebView new];
        _webView.delegate = self;
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _webView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    self.title = @"召唤师详情";
     [self.webView loadRequest:_request];
}

#pragma  mark -- UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showProgress];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    [self hideProgress];
    
}

@end
