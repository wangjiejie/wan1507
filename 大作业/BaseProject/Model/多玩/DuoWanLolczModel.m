//
//  DuoWanLolczModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanLolczModel.h"

@implementation DuoWanLolczModel

+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    //    驼峰转下划线（loveYou -> love_you）
    return [propertyName mj_underlineFromCamel];
}

@end



