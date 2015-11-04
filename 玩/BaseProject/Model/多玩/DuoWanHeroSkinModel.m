//
//  DuoWanHeroSkinModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanHeroSkinModel.h"

@implementation DuoWanHeroSkinModel


+ (NSDictionary *)objectClassInArray{
    return @{@"DuoWanHeroSkinesArrayModel" : [Duowanheroskinesarraymodel class]};
}
@end

@implementation Duowanheroskinesarraymodel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id"};
}
@end


