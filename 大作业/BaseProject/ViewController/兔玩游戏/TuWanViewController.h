//
//  TuWanViewController.h
//  BaseProject
//
//  Created by 王杰 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanViewController : UIViewController
//内容页 的首页应该是单例的，每次进程都只能初始化一次
+(UINavigationController *)standardTuWanNavi;
@end
