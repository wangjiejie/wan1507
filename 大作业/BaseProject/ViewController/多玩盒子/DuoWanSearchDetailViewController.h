//
//  DuoWanSearchDetailViewController.h
//  BaseProject
//
//  Created by 王杰 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DuoWanSearchDetailViewController : UIViewController

-(instancetype)initWithRequest:(NSURLRequest *)request;
@property (nonatomic,strong)NSURLRequest *request;
@end
