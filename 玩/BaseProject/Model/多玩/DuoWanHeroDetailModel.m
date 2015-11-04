//
//  DuoWanHeroDetailModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanHeroDetailModel.h"

@implementation DuoWanHeroDetailModel


+ (NSDictionary *)objectClassInArray{
    return @{@"like" : [DuoWanHeroDetailLikeModel class], @"hate" : [DuoWanHeroDetailHateModel class]};
}
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id", @"desc": @"description"};
}
@end


@implementation DuoWanHeroDetail_QModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id", @"desc": @"description"};
}
@end



@implementation DuoWanHeroDetailLikeModel

@end


@implementation DuoWanHeroDetailHateModel

@end


