//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "LeftViewController.h"
#import "TuWanViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    self.window.rootViewController = self.sideMenu;
    [self configGlobalUIStyle];
    return YES;
}

/** 配置全局UI的样式 */
-(void)configGlobalUIStyle
{
    /** 导航栏不透明 */
    [[UINavigationBar appearance]setTranslucent:NO];
    
    /** 设置导航栏背景图 */
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg_64"] forBarMetrics:UIBarMetricsDefault];
    
    /** 设置导航栏题目的样式 */
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont flatFontOfSize:kNaviTitleFontSize],NSForegroundColorAttributeName:kNaviTitleColor}];
    
}
-(RESideMenu *)sideMenu
{
    if(!_sideMenu)
    {
        _sideMenu = [[RESideMenu alloc]initWithContentViewController:[TuWanViewController standardTuWanNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        //为sideMenu设置背景图
        _sideMenu.backgroundImage = [UIImage imageNamed:@"10979716_0800"];
        //可以让出现菜单时不显示状态栏
        _sideMenu.menuPrefersStatusBarHidden = YES;
    }
    return _sideMenu;
}

-(UIWindow *)window
{
    if(!_window)
    {
        _window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
        [_window makeKeyAndVisible];
    }
    return _window;
}


@end
