//
//  ItemDetailViewController.m
//  Taobao
//
//  Created by longfei on 14-8-3.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import "ItemDetailViewController.h"

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController

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
    //添加ScroolView
    self.scroolView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, 320, 320)];
    self.scroolView.backgroundColor = [UIColor blueColor];
    //设置contentSize才能滚动
    self.scroolView.contentSize = CGSizeMake(320*3, 0);
    [self.view addSubview:self.scroolView];
    
    //加图
    UIImageView *hezi0 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    hezi0.image = [UIImage imageNamed:@"hezi0.jpg"];
    [self.scroolView addSubview:hezi0];
    UIImageView *hezi1 = [[UIImageView alloc] initWithFrame:CGRectMake(320, 0, 320, 320)];
    hezi1.image = [UIImage imageNamed:@"hezi1.jpg"];
    [self.scroolView addSubview:hezi1];
    UIImageView *hezi2 = [[UIImageView alloc]  initWithFrame:CGRectMake(320*2, 0, 320, 320)];
    hezi2.image = [UIImage imageNamed:@"hezi2.jpg"];
    [self.scroolView addSubview:hezi2];
    //可以滚动
    self.scroolView.pagingEnabled = YES;
    self.scroolView.showsHorizontalScrollIndicator = NO;
    
    //加分页
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((320-100)/2.0, 350, 100, 40)];
    self.pageControl.backgroundColor = [UIColor orangeColor];
    self.pageControl.numberOfPages = 3;
    [self.view addSubview:self.pageControl];
    
    //设置delegate，至关重要
    self.scroolView.delegate = self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) pageSelected{
    NSInteger currentPage = self.pageControl.currentPage;
    NSLog(@"currentPage:%d", currentPage);
    [self.scroolView setContentOffset:CGPointMake(320*currentPage, 0) animated:YES];
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

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger pageIndex = scrollView.contentOffset.x/scrollView.frame.size.width;
    self.pageControl.currentPage = pageIndex;
}

@end
