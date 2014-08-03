//
//  MyFavoriteViewController.h
//  Taobao
//
//  Created by longfei on 14-8-2.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"

@interface MyFavoriteViewController : UIViewController <UIApplicationDelegate,UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong,retain ) ItemDetailViewController *detailViewController;
@end
