//
//  BestGroupDetailViewController.h
//  BaseProject
//
//  Created by 王杰 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BestGroupDetailViewController : UIViewController
- (id)initWithTitle:(NSString *)title desc:(NSString *)desc icons:(NSArray *)icons decs:(NSArray *)descs;
@property(nonatomic,strong) NSString *title0; //区别系统关键词
@property(nonatomic,strong) NSString *desc;
@property(nonatomic,strong) NSArray *icons;
@property(nonatomic,strong) NSArray *descs;
@end
