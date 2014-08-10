//
//  CartViewController.h
//  Taobao
//
//  Created by longfei on 14-7-31.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CartViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@end
