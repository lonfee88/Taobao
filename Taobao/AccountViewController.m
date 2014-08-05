//
//  AccountViewController.m
//  Taobao
//
//  Created by longfei on 14-7-31.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import "AccountViewController.h"
#import "MyFavoriteViewController.h"
#import "ConfigViewController.h"

@interface AccountViewController ()

@end

@implementation AccountViewController

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
    self.title = @"我的淘宝";
    
    //添加左边配置按钮
    UIImage *configImage = [UIImage imageNamed:@"config"];
    UIBarButtonItem *configBarButtonItem = [[UIBarButtonItem alloc] initWithImage:configImage style:UIBarButtonItemStylePlain target:self action:@selector(config:)];
    //设置色调
    [configBarButtonItem setTintColor:[UIColor blackColor]];
    [self.navigationItem setLeftBarButtonItem:configBarButtonItem];
    
    //添加收藏夹按钮
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake((self.view.frame.size.width-200)/2, (self.view.frame.size.height-100)/2, 200, 100)];
    [button setTitle:@"我的收藏夹" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(jumpToFavorite:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

//点击左边配置图标
-(void)config:(id)sender{
    ConfigViewController *configViewController = [[ConfigViewController alloc] init];
    [self.navigationController pushViewController:configViewController animated:YES];
    UIBarButtonItem *backButton=[[UIBarButtonItem alloc] initWithTitle:@"回去" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationItem setBackBarButtonItem:backButton];
}

//点击收藏按钮，跳转到收藏夹
-(void)jumpToFavorite:(id)sender{
    MyFavoriteViewController *myFavorite = [[MyFavoriteViewController alloc] init];
    [self.navigationController pushViewController:myFavorite animated:YES];
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
