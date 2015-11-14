//
//  DuoWanTabBarController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanTabBarController.h"
#import "DuoWanHeroViewController.h"
#import "DuoWanBaiKeViewController.h"
#import "DuoWanSearchViewController.h"



@interface DuoWanTabBarController ()

@end

@implementation DuoWanTabBarController

+(DuoWanTabBarController *)standardInstance
{
    static DuoWanTabBarController *tabBarVC = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabBarVC = [DuoWanTabBarController new];
        
    });
    return tabBarVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //取消工具栏的透明状态
    self.tabBar.translucent = NO;
    //self.tabBar.hidden = YES;
    
    /**
     *  初始化3个子视图，放到tabbar中
     */
    DuoWanHeroViewController *heroVC = [DuoWanHeroViewController new];
    UINavigationController *heroNavi = [[UINavigationController alloc]initWithRootViewController:heroVC];
    
    DuoWanBaiKeViewController *baikeVC = [DuoWanBaiKeViewController new];
    UINavigationController *baikeNavi = [[UINavigationController alloc]initWithRootViewController:baikeVC];
    
    DuoWanSearchViewController *searchVC = [DuoWanSearchViewController new];
    UINavigationController *searchNavi = [[UINavigationController alloc]initWithRootViewController:searchVC];
    
    self.viewControllers = @[heroNavi,baikeNavi,searchNavi];

}

@end
