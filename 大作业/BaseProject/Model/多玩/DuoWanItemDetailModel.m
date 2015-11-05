//
//  DuoWanItemDetailModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanItemDetailModel.h"

@implementation DuoWanItemDetailModel

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"desc": @"description", @"ID": @"id"};
}

@end

@implementation DuoWanItemDetailExtattrsModel

//属性首字母小写->变大写
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName firstCharUpper];
}

@end