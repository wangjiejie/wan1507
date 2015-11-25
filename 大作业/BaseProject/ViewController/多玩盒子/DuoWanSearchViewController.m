//
//  DuoWanSearchViewController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanSearchViewController.h"
#import "DuoWanSearchDetailViewController.h"

@interface DuoWanSearchViewController ()<UIWebViewDelegate>

@property (nonatomic,strong)UIWebView *webView;

@end

@implementation DuoWanSearchViewController
-(instancetype)init
{
    if (self = [super init]) {
            self.title = @"战力查询";
    }
    return self;
}

-(UIWebView *)webView
{
    if(!_webView)
    {
        _webView = [UIWebView new];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _webView.delegate = self;
    }
    return _webView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *path = @"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView";
     [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]];
    [Factory addShareItemToVC:self url:path];
}


#pragma  mark -- UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *path = @"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView";
    if(![request.URL.absoluteString isEqualToString:path])
    {
        DuoWanSearchDetailViewController *detailVC = [[DuoWanSearchDetailViewController alloc]initWithRequest:request];
        [self.navigationController pushViewController:detailVC animated:YES];
        return NO;
    }
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
