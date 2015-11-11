//
//  DuoWanHeroViewController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanHeroViewController.h"

@interface DuoWanHeroViewController ()

@end

@implementation DuoWanHeroViewController

-(instancetype)init
{
    if (self = [super init]) {
        self.title = @"英雄";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    
}



@end
