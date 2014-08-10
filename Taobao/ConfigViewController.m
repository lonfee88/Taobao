//
//  ConfigViewController.m
//  Taobao
//
//  Created by longfei on 14-8-5.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import "ConfigViewController.h"

@interface ConfigViewController ()

@end

@implementation ConfigViewController

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
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height) style:UITableViewStyleGrouped];
    tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    tableView.dataSource = self;

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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }
    else if(section == 1){
        return 2;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    if (indexPath.section == 0){
        if(indexPath.row == 0){
            cell.textLabel.text = @"账户";
        }
        else if (indexPath.row == 1){
            cell.textLabel.text = @"消息";
        }
        else if (indexPath.row == 2){
            cell.textLabel.text = @"通用";
        }
    }
    else if(indexPath.section ==1 ) {
        if(indexPath.row == 0){
            cell.textLabel.text = @"服务中心";
        }
        else if (indexPath.row == 1){
            cell.textLabel.text = @"关于手机淘宝";
        }
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

@end
