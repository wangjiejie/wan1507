//
//  DuoWanHeroViewController.h
//  BaseProject
//
//  Created by 王杰 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DuoWanHeroViewController : WMPageController
//内容页 的首页应该是单例的，每次进程都只能初始化一次
+(UINavigationController *)standardHeroNavi;
@end
