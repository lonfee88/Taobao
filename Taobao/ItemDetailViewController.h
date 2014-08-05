//
//  ItemDetailViewController.h
//  Taobao
//
//  Created by longfei on 14-8-3.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemDetailViewController : UIViewController <UIScrollViewDelegate>
@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) UIScrollView *scroolView;
@property (strong, nonatomic) NSDictionary *itemDictionary;
@end
