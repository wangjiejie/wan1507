//
//  Factory.h
//  BaseProject
//
//  Created by 王杰 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UMSocial.h"
@interface Factory : NSObject

/** 向某个控制器上，添加菜单按钮 */
+(void)addMenuItemToVC:(UIViewController *)vc;

/** 向某个控制器上，添加返回按钮 */
+(void)addBackItemToVC:(UIViewController *)vc;


/** 向某个控制器上，添加分享按钮 */
+(void)addShareItemToVC:(UIViewController *)vc url:(NSString *)url;
@end
