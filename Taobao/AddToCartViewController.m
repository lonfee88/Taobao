//
//  AddToCartViewController.m
//  Taobao
//
//  Created by longfei on 14-8-4.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import "AddToCartViewController.h"

@interface AddToCartViewController ()

@end

@implementation AddToCartViewController

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
    //设置背景色
    [self.view setBackgroundColor:[UIColor whiteColor]];
    //设置title
    self.title = @"加入购物车";
    //增加label
    UILabel *cartLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-150)/2, self.view.frame.size.height/2, 150, 20)];
    cartLabel.text = @"加入购物车成功!";
    cartLabel.textColor = [UIColor orangeColor];
    [self.view addSubview:cartLabel];
    //增加"去购物车查看"按钮
    UIButton *goToCart = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width-150)/2, cartLabel.frame.origin.y-50, 150, 40)];
    [goToCart setTitle:@"去购物车查看" forState:UIControlStateNormal];
    [goToCart setBackgroundColor:[UIColor orangeColor]];
    [goToCart addTarget:self action:@selector(goToCart:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goToCart];
    
}

- (void) goToCart:(id)sender{
    [self.tabBarController setSelectedIndex:3];
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
