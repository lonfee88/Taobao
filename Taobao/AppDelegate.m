//
//  AppDelegate.m
//  Taobao
//
//  Created by longfei on 14-7-31.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "WeiViewController.h"
#import "DiscoverViewController.h"
#import "CartViewController.h"
#import "AccountViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
   
    //首页
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    UINavigationController *homeNavController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    [homeNavController.tabBarItem setTitle:@"首页"];
    //设置图片
    [homeNavController.tabBarItem setImage:[UIImage imageNamed:@"home"]];
    //设置选中图片
    [homeNavController.tabBarItem setSelectedImage:[[UIImage imageNamed:@"home_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //设置选中文本颜色
    [homeNavController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateHighlighted];
    
    //微淘
    WeiViewController *weiViewController = [[WeiViewController alloc] init];
     UINavigationController *weiNavController = [[UINavigationController alloc] initWithRootViewController:weiViewController];
    [weiNavController.tabBarItem setTitle:@"微淘"];
    //设置图片
    [weiNavController.tabBarItem setImage:[UIImage imageNamed:@"wei"]];
    //设置选中图片
    [weiNavController.tabBarItem setSelectedImage:[[UIImage imageNamed:@"wei_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //设置选中文本颜色
    [weiNavController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateHighlighted];
    
    //发现
    DiscoverViewController *discoverViewController = [[DiscoverViewController alloc] init];
    UINavigationController *discoverNavController = [[UINavigationController alloc] initWithRootViewController:discoverViewController];
    [discoverNavController.tabBarItem setTitle:@"微淘"];
    //设置图片
    [discoverNavController.tabBarItem setImage:[UIImage imageNamed:@"discover"]];
    //设置选中图片
    [discoverNavController.tabBarItem setSelectedImage:[[UIImage imageNamed:@"discover_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //设置选中文本颜色
    [discoverNavController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateHighlighted];
    
    //购物车
    CartViewController *cartViewController = [[CartViewController alloc] init];
    UINavigationController *cartNavController = [[UINavigationController alloc] initWithRootViewController:cartViewController];
    //设置图片
    [cartNavController.tabBarItem setTitle:@"购物车"];
    [cartNavController.tabBarItem setImage:[UIImage imageNamed:@"cart"]];
    //设置选中图片
    [cartNavController.tabBarItem setSelectedImage:[[UIImage imageNamed:@"cart_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //设置选中文本颜色
    [cartNavController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateHighlighted];
    
    //我的淘宝
    AccountViewController *accountViewController = [[AccountViewController alloc] init];
    UINavigationController *accountNavController = [[UINavigationController alloc] initWithRootViewController:accountViewController];
    [accountNavController.tabBarItem setTitle:@"我的淘宝"];
    //设置图片
    [accountNavController.tabBarItem setImage:[UIImage imageNamed:@"account"]];
    //设置选中图片
    [accountNavController.tabBarItem setSelectedImage:[[UIImage imageNamed:@"account_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //设置选中文本颜色
    [accountNavController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateHighlighted];
    
    //初始化tabbar
    NSArray *tabBarArray = @[homeNavController,weiNavController, discoverNavController, cartNavController, accountNavController];
    //添加UITabBarController
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:tabBarArray];
    
    //设置rootViewController
    [self.window setRootViewController:tabBarController];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
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

@end
