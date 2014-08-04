//
//  ItemCell.m
//  TestTableView
//
//  Created by junzhan on 14-6-29.
//  Copyright (c) 2014年 junzhan. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //添加图片
        self.itemImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 90, 90)];
        [self.contentView addSubview:self.itemImageView];
        //添加label
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.itemImageView.frame.origin.x+self.itemImageView.frame.size.width+10, self.itemImageView.frame.origin.y, 180, 60)];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [self.contentView addSubview:self.titleLabel];
        //添加价格
        self.priceLabel =[[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y+self.titleLabel.frame.size.height, 100, 30)];
        self.priceLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:self.priceLabel];
        
        //添加人气
        self.hotLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.frame.origin.x, self.priceLabel.frame.origin.y+self.priceLabel.frame.size.height, 100, 30)];
        self.hotLabel.textColor = [UIColor darkGrayColor];
        self.hotLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.hotLabel];
        //添加右箭头
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        //在点击cell时去掉点击背景颜色
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)updateCellWithModel:(NSMutableDictionary *)itemDictionary{
    self.itemImageView.image = [UIImage imageNamed:[itemDictionary objectForKey:@"imageName"]];
    self.hotLabel.text = [NSString stringWithFormat:@"人气 %@",  [itemDictionary objectForKey:@"hotText"]];
    self.titleLabel.text = [itemDictionary objectForKey:@"title"];
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %@", [itemDictionary objectForKey:@"price"]];
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
