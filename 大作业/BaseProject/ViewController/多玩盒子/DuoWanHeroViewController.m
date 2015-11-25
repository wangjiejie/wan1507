//
//  DuoWanHeroViewController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanHeroViewController.h"
#import "HeroListViewController.h"
#import "HeroViewModel.h"

@interface DuoWanHeroViewController ()
@property (nonatomic,strong)HeroViewModel *heroVM;
@end

@implementation DuoWanHeroViewController

- (HeroViewModel *)heroVM {
    if(_heroVM == nil) {
        _heroVM = [[HeroViewModel alloc] initWithType:HeroTypeFree];
    }
    return _heroVM;
}

+(UINavigationController *)standardHeroNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DuoWanHeroViewController *vc = [[DuoWanHeroViewController alloc]initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        vc.menuItemWidth = kWindowW/2;
        vc.menuHeight = 50;
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}

/** 提供每个VC对应的key值数组 */
+(NSArray *)vcKeys
{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"heroType"];
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
    return @[@"免费英雄",@"全部英雄"];
}

/** 提供每个题目对应的控制器类型 */

+(NSArray *)viewControllerClasses
{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[HeroListViewController class]];
    }
    return [arr copy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"英雄";
    [Factory addMenuItemToVC:self];
    [self.heroVM getDataFromNetCompleteHandle:^(NSError *error) {
        DDLogVerbose(@"");
    }];
}





@end
