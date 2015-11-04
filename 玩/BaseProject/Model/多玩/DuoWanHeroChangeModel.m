//
//  DuoWanHeroChangeModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanHeroChangeModel.h"

@implementation DuoWanHeroChangeModel


+ (NSDictionary *)objectClassInArray{
    return @{@"changeLog" : [DuoWanHeroChangeChangelogModel class]};
}
@end
@implementation DuoWanHeroChangeChangelogModel

@end
