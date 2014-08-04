//
//  ItemCell.h
//  TestTableView
//
//  Created by junzhan on 14-6-29.
//  Copyright (c) 2014年 junzhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemModel.h"
@interface ItemCell : UITableViewCell
@property (nonatomic, strong) UIImageView *itemImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *hotLabel;

- (void)updateCellWithModel:(NSMutableDictionary *)itemDictionary;
@end
