//
//  ItemModel.h
//  TestTableView
//
//  Created by junzhan on 14-7-22.
//  Copyright (c) 2014年 junzhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, strong) NSString *hotText;
@end
