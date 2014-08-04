//
//  ItemDetailViewController.m
//  Taobao
//
//  Created by longfei on 14-8-3.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "AddToCartViewController.h"

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
    //设置背景色
    [self.view setBackgroundColor:[UIColor whiteColor]];
    //设置标题
    self.navigationItem.title = @"宝贝详情";
    UIView *vi = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 320, self.navigationController.navigationBar.frame.size.height)];
    [self.view addSubview:vi];
    //添加ScroolView
    self.scroolView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height, 320, 320)];
    //设置contentSize才能滚动
    self.scroolView.contentSize = CGSizeMake(320*3, 320);
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
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((320-100)/2.0, 320, 100, 40)];
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    self.pageControl.numberOfPages = 3;
    [self.view addSubview:self.pageControl];
    
    //设置delegate，至关重要
    self.scroolView.delegate = self;
    [self.pageControl addTarget:self action:@selector(pageSelected) forControlEvents:UIControlEventValueChanged];
    [self showDetail];
}

//显示标题、价格和人气
-(void)showDetail{
    //添加label
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.scroolView.frame.size.height+20, self.view.frame.size.width, 60)];
    [titleLabel setText:self.model.title];
    titleLabel.numberOfLines = 0;
    titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
    titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:titleLabel];
    //添加价格
    UILabel *priceLabel =[[UILabel alloc] initWithFrame:CGRectMake(0, titleLabel.frame.origin.y + 45, 100, 30)];
    [priceLabel setText:[NSString stringWithFormat:@"价格:%@", self.model.price]];
    priceLabel.textColor = [UIColor redColor];
    priceLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:priceLabel];
    //添加人气
    UILabel *hotLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, priceLabel.frame.origin.y + 20, 100, 30)];
    hotLabel.textColor = [UIColor darkGrayColor];
    hotLabel.font = [UIFont systemFontOfSize:14];
    [hotLabel setText:[NSString stringWithFormat:@"人气 %@", self.model.hotText]];
    [self.view addSubview:hotLabel];
    //添加加入购物车按钮
    UIButton *addToCart = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-110 , priceLabel.frame.origin.y, 100, 40)];
    [addToCart setTitle:@"加入购物车" forState:UIControlStateNormal];
    addToCart.titleLabel.font = [UIFont systemFontOfSize:16];
    addToCart.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:addToCart];
    [addToCart addTarget:self action:@selector(addToCart:) forControlEvents:UIControlEventTouchUpInside];
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

//滚动图片，调整对应的分页圆点
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger pageIndex = scrollView.contentOffset.x/scrollView.frame.size.width;
    self.pageControl.currentPage = pageIndex;
}

//点击分页圆点，跳转到对应的图片
- (void) pageSelected{
    NSInteger currentPage = self.pageControl.currentPage;
    NSLog(@"currentPage:%d", currentPage);
    [self.scroolView setContentOffset:CGPointMake(320*currentPage, 0) animated:YES];
}

- (void)addToCart:(id)sender{
    AddToCartViewController *addToCartViewController = [[AddToCartViewController alloc] init];
    [self.navigationController pushViewController:addToCartViewController animated:YES];
}

@end
