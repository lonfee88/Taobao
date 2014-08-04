//
//  MyFavoriteViewController.m
//  Taobao
//
//  Created by longfei on 14-8-2.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import "MyFavoriteViewController.h"
#import "ItemCell.h"
#import "ItemModel.h"

@interface MyFavoriteViewController ()

@end

@implementation MyFavoriteViewController

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
    //添加tableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //添加数据源
    self.dataArray = [[NSMutableArray alloc] init];
    //载入10条数据
    [self addData:10];
    
    self.title = @"收藏夹";
    //定制按钮
    UIBarButtonItem *editBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editButtonClicked:)];
    [self.navigationItem setRightBarButtonItem:editBarButtonItem];
    
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (void)addData:(NSInteger)num{
    for(int i = 0; i < num; ++i){
        ItemModel *itemModel = [[ItemModel alloc] init];
        itemModel.imageName = @"hezi11.jpg";
        itemModel.title = @"天猫魔盒TMB200F 高清电视网络机顶盒 wifi硬盘播放器 智能盒子1s";
        itemModel.hotText = [NSString stringWithFormat:@"9%d", i];
        itemModel.price = [NSString stringWithFormat:@"29%d.00", i];
        [self.dataArray addObject:itemModel];
    }
}

#pragma mark action

#pragma mark tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell"];
    //    cell = nil;
    //    ItemCell *cell = nil;
    if(!cell){
        cell = [[ItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ItemCell"];
    }
    ItemModel *model = [self.dataArray objectAtIndex:indexPath.row];
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


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
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
    
    self.detailViewController = [[ItemDetailViewController alloc] init];
    //把宝贝的标题、价格和人气传到detail页
    ItemModel *model = [self.dataArray objectAtIndex:[indexPath row]];
    self.detailViewController.model = model;
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}


@end
