//
//  DuoWanRunesModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanRunesModel.h"

@implementation DuoWanRunesModel

//首字母大写
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName firstCharUpper];
}

+ (NSDictionary *)objectClassInArray{
    return @{@"Purple" : [DuoWanRunesPurpleModel class], @"Yellow" : [DuoWanRunesPurpleModel class], @"Blue" : [DuoWanRunesPurpleModel class], @"Red" : [DuoWanRunesPurpleModel class]};
}
@end
@implementation DuoWanRunesPurpleModel

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"img": @"Img", @"name": @"Name", @"recom": @"Recom", @"units": @"Units", @"type": @"Type", @"standby": @"Standby", @"alias": @"Alias", @"prop": @"Prop"};
}

@end

