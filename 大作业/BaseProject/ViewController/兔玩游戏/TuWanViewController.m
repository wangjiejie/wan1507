//
//  TuWanViewController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewController.h"
#import "TuWanViewModel.h"
#import "TuWanListViewController.h"

@interface TuWanViewController ()
@property (nonatomic,strong)TuWanViewModel *tuWanVM;
@end

@implementation TuWanViewController
-(TuWanViewModel *)tuWanVM
{
    if(!_tuWanVM)
    {
        _tuWanVM = [[TuWanViewModel alloc]initWithType:TuWanTypeCos];
    }
    return _tuWanVM;
}
+(UINavigationController *)standardTuWanNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        TuWanViewController *vc = [[TuWanViewController alloc]initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}
/** 提供每个VC对应的key值数组 */
+(NSArray *)vcKeys
{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"infoType"];
    }
    return [arr copy];
    
}

/** 提供每个VC对应的value值数组 */
+(NSArray *)vcValues
{
    NSMutableArray *arr = [NSMutableArray new];
    for(int i = 0;i < [self itemNames].count;i ++)
    {
        //数值上，vc的infoType的枚举值，恰好和i值相同
        [arr addObject:@(i)];
    }
    return [arr copy];
}

/**  提供题目数组 */
+(NSArray *)itemNames
{
    return @[@"头条",@"独家",@"暗黑3",@"魔兽",@"风暴",@"炉石",@"星际2",@"守望",@"图片",@"视频",@"攻略",@"幻化",@"趣闻",@"COS",@"美女"];
}

/** 提供每个题目对应的控制器类型 */

+(NSArray *)viewControllerClasses
{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[TuWanListViewController class]];
    }
    return [arr copy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenSeaColor];
    self.title = @"兔玩";
    
    [Factory addMenuItemToVC:self];
    [self.tuWanVM refreshDataCompletionHandle:^(NSError *error) {
        DDLogVerbose(@"");
    }];
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
