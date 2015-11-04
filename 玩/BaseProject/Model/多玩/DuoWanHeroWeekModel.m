//
//  DuoWanHeroWeekDataModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanHeroWeekModel.h"

@implementation DuoWanHeroWeekModel

@end
@implementation DuoWanHeroWeekDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"charts" : [DuoWanHeroWeekDataChartsModel class]};
}
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}
@end


@implementation DuoWanHeroWeekDataChartsModel

+ (NSDictionary *)objectClassInArray{
    return @{@"ratio_data" : [DuoWanHeroWeekDataChartsRatio_DataModel class]};
}
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}
@end


@implementation DuoWanHeroWeekDataChartsRatio_DataModel

@end


