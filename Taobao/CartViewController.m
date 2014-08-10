//
//  CartViewController.m
//  Taobao
//
//  Created by longfei on 14-7-31.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import "CartViewController.h"
#import "ItemWebViewViewController.h"
#import "ItemCell.h"

@interface CartViewController ()

@end

@implementation CartViewController

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
     self.title = @"购物车";
    //添加tableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //添加数据源
    self.dataArray = [[NSMutableArray alloc] init];
    //载入1条数据
    [self addData:3];
    //定制按钮
    UIBarButtonItem *editBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editButtonClicked:)];
    [self.navigationItem setRightBarButtonItem:editBarButtonItem];
    
    UIBarButtonItem *deleteAllBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"清空" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAllButtonClicked:)];
    [self.navigationItem setLeftBarButtonItem:deleteAllBarButtonItem];

    
}

//进入退出编辑模式
-(void)editButtonClicked:(id)sender{
    if (self.tableView.editing) {
        self.navigationItem.rightBarButtonItem.title = @"编辑";
        self.tableView.editing = NO;
    }
    else{
        self.navigationItem.rightBarButtonItem.title = @"完成";
        self.tableView.editing = YES;
    }
}

//清空
-(void)deleteAllButtonClicked:(id)sender{
    [self.dataArray removeAllObjects];
    [self.tableView reloadData];
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

- (void)addData:(NSInteger)count{
    
    for (NSInteger i = 0; i < count; i++) {
        NSString *imageName = @"hezi11.jpg";
        NSString *title = @"天猫魔盒TMB200F 高清电视网络机顶盒 wifi硬盘播放器 智能盒子1s";
        NSString *hotText = [NSString stringWithFormat:@"9%d", i];
        NSString *price = [NSString stringWithFormat:@"29%d.00", i];
        NSDictionary *itemDictionary = @{@"imageName":imageName, @"title":title, @"hotText":hotText, @"price":price};
        [self.dataArray addObject:itemDictionary];
    }
     [self.tableView reloadData];
}

#pragma mark tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell"];
    if(!cell){
        cell = [[ItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ItemCell"];
        
    }
    NSDictionary *model = [self.dataArray objectAtIndex:indexPath.row];
    [cell updateCellWithModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
//修改默认的"Delete"为"删除"
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

//删除item
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        //从数据源中删除
        [self.dataArray removeObjectAtIndex:indexPath.row];
        //从视图中删除
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        //        [self.tableView reloadData];
    }
}

//点击宝贝，进入宝贝详情
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ItemWebViewViewController *itemWebViewController = [[ItemWebViewViewController alloc] init];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://detail.m.tmall.com/item.htm?id=38938192695"]];
    [itemWebViewController.webView loadRequest:request];
    
    [self.navigationController pushViewController:itemWebViewController animated:YES];
}

@end
