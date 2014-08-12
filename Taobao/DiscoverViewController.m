//
//  DiscoverViewController.m
//  Taobao
//
//  Created by longfei on 14-7-31.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import "JSONKit.h"
#import "TSMessage.h"
#import "AFNetworking.h"
#import "SVPullToRefresh.h"
#import "ItemWebViewController.h"
#import "DiscoverViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DiscoverViewController ()
@end

@implementation DiscoverViewController

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
    self.title = @"发现";
    self.items = [[NSMutableArray alloc] init];
    
    [self.items removeAllObjects];
    [self requestForData];

    //PullToRefresh
    __weak DiscoverViewController *weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf.items removeAllObjects];
        [weakSelf requestForData];
        [weakSelf.tableView.pullToRefreshView stopAnimating];
    }];
    
    //InfiniteScroll
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        NSLog(@"addInfiniteScrollingWithActionHandler");
        [weakSelf requestForData];
        [weakSelf.tableView.infiniteScrollingView stopAnimating];
    }];

}

//发请求，重新载入数据
- (void)requestForData{
    NSString *url = @"http://h5.waptest.taobao.com/json/wv/items.json";
    //使用AFNetworking发post请求
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //解析数据
        NSLog(@"before %d", self.items.count);
        [self.items addObjectsFromArray:[NSMutableArray arrayWithArray:[(NSDictionary *)responseObject objectForKey:@"items"]]];
        NSLog(@"after %d", self.items.count);
        
        //成功通知
        [TSMessage showNotificationInViewController:self
                                              title:@"成功"
                                           subtitle:nil
                                              image:nil
                                               type:TSMessageNotificationTypeSuccess
                                           duration:1
                                           callback:nil
                                        buttonTitle:@""
                                     buttonCallback:nil
                                         atPosition:TSMessageNotificationPositionTop canBeDismissedByUser:YES];
        
        
        //将数据显示在table中,一定要在这里调用一次
        [self.tableView reloadData];
        NSLog(@"request");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //失败通知
        [TSMessage showNotificationInViewController:self
                                              title:@"错误"
                                           subtitle:nil
                                              image:nil
                                               type:TSMessageNotificationTypeError
                                           duration:1
                                           callback:nil
                                        buttonTitle:@""
                                     buttonCallback:nil
                                         atPosition:TSMessageNotificationPositionTop canBeDismissedByUser:YES];
    }];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    if(indexPath.row < self.items.count){
        NSDictionary *item = [self.items objectAtIndex:indexPath.row];
        NSString *name = [item objectForKey:@"name"];
        NSString *price = [item objectForKey:@"price"];
        NSString *url = [item objectForKey:@"img"];
    
        cell.textLabel.text = name;
        cell.detailTextLabel.text = price;
        [cell.imageView setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    }
    else{
        NSLog(@"不满足要求的情况%@", self.items);
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ItemWebViewController *web = [[ItemWebViewController alloc] init];
    NSDictionary *item = [self.items objectAtIndexedSubscript:indexPath.row];
    NSString *url = [item objectForKeyedSubscript:@"url"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [web.webView loadRequest:request];
    
    [self.navigationController pushViewController:web animated:YES];
}

@end
