//
//  HomeViewController.m
//  Taobao
//
//  Created by longfei on 14-7-31.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController () <UIWebViewDelegate>

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    NSURL *url = [NSURL URLWithString:@"http://m.taobao.com"];
    NSURLRequest *request= [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    webView.delegate = self;
    [self.view addSubview:webView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WebView
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"请求错误"
                                                 message:@"请检查网络连接"
                                                delegate:nil
                                       cancelButtonTitle:@"OK" otherButtonTitles:nil];
    NSLog(@"webview load error:%@", error);
    [av show];
}

//载入成功，修改title
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *title=[webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.title = title;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
