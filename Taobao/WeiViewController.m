//
//  WeiViewController.m
//  Taobao
//
//  Created by longfei on 14-7-31.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import "WeiViewController.h"

@interface WeiViewController ()

@end

@implementation WeiViewController

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
    self.title = @"微淘";
    
    UILabel *content = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, (self.view.frame.size.height-100)/2, 200, 100)];
        content.text = @"本次作业主要在 发现 页面";
    
    UIButton *goToDiscover = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, content.frame.origin.y + content.frame.size.height, 100, 20)];
    [goToDiscover setTitle:@"去发现" forState:UIControlStateNormal];
    [goToDiscover setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [goToDiscover addTarget:self action:@selector(goToDiscover:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:content];
    [self.view addSubview:goToDiscover];
}

- (void)goToDiscover:(id)sender{
    [self.tabBarController setSelectedIndex:2];
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
