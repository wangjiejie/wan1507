//
//  TuWanViewController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewController.h"

@interface TuWanViewController ()

@end

@implementation TuWanViewController
+(UINavigationController *)standardTuWanNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        TuWanViewController *vc = [TuWanViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenSeaColor];
    self.title = @"兔玩";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
