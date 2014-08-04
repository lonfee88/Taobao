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
    self.title = @"加入购物车";
    UILabel *cartLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, self.view.frame.size.height/2, 200, 20)];
    cartLabel.text = @"加入购物车成功!";
    [self.view addSubview:cartLabel];
    
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
