//
//  ItemWebViewController.m
//  Taobao
//
//  Created by longfei on 14-8-12.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import "ItemWebViewController.h"

@interface ItemWebViewController () <UIWebViewDelegate>

@end

@implementation ItemWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) init{
    self = [super init];
    if (self) {
        self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        self.webView.delegate = self;
        [self.view addSubview:self.webView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(clickGoBack)];
    UIBarButtonItem *reload = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(clickReload)];
    
    [self.navigationItem setLeftBarButtonItem:back];
    [self.navigationItem setRightBarButtonItem:reload];
}

//返回
- (void)clickGoBack{
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

//重新载入
- (void)clickReload {
    [self.webView reload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark - webview
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *title=[webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.title = title;
}

@end
