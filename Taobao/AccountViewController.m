//
//  AccountViewController.m
//  Taobao
//
//  Created by longfei on 14-7-31.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import "AccountViewController.h"
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
    UIImageView *profile = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 256)/2, (self.view.frame.size.height - 211)/2, 256, 211)];
    profile.image = [UIImage imageNamed:@"profile.jpg"];
    
    [self.view addSubview:profile];
}

//点击左边配置图标
-(void)config:(id)sender{
    ConfigViewController *configViewController = [[ConfigViewController alloc] init];
    [self.navigationController pushViewController:configViewController animated:YES];
    UIBarButtonItem *backButton=[[UIBarButtonItem alloc] initWithTitle:@"回去" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationItem setBackBarButtonItem:backButton];
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
