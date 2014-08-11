//
//  DiscoverViewController.m
//  Taobao
//
//  Created by longfei on 14-7-31.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import "JSONKit.h"
#import "AFNetworking.h"
#import "DiscoverViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DiscoverViewController ()
@property (nonatomic, strong) NSMutableData *data;
@property (nonatomic, strong) NSArray *items;
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
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSString *url = @"http://h5.waptest.taobao.com/json/wv/items.json";
    
    //使用AFNetworking发post请求
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //解析数据
        self.items = [(NSDictionary *)responseObject objectForKey:@"items"];
        //将数据显示在table中
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"请求错误"
                                                     message:[NSString stringWithFormat:@"%@",error]
                                                    delegate:nil
                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [av show];
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

//#pragma mark - Connection data delegete
////收到请求
//- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
//    self.data = [[NSMutableData alloc] init];
//}
//
////收到数据【可能有多次】
//- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
//    [self.data appendData:data];
//}
//
////完成加载
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
//    //    NSString *response = [[NSString alloc] initWithData:self.data encoding:NSUTF8StringEncoding];
//    NSDictionary *responseDic = [self.data objectFromJSONData];
//    self.items = [responseDic objectForKey:@"items"];
//    [self.tableView reloadData];
//    NSLog(@"receive response:\n%@", responseDic);
//}


#pragma mark - table
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
    NSDictionary *item = [self.items objectAtIndex:indexPath.row];
    NSString *name = [item objectForKey:@"name"];
    NSString *price = [item objectForKey:@"price"];
    NSString *url = [item objectForKey:@"img"];
    
    cell.textLabel.text = name;
    cell.detailTextLabel.text = price;
    [cell.imageView setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    return cell;
}

@end
