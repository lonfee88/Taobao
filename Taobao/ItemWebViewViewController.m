//
//  ItemWebViewViewController.m
//  Taobao
//
//  Created by longfei on 14-8-10.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import "ItemWebViewViewController.h"

@interface ItemWebViewViewController () <UIWebViewDelegate>

@end

@implementation ItemWebViewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init{
    self = [super init];
    if(self){
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
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    UIBarButtonItem *reload = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reload)];
    [self.navigationItem setLeftBarButtonItem:back];
    [self.navigationItem setRightBarButtonItem:reload];
}

- (void)back{
    if(self.webView.canGoBack){
        [self.webView goBack];
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)reload{
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

@end
