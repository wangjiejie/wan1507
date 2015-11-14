//
//  DuoWanVideoesNormalModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanVideoesNormalModel.h"



@implementation DuoWanVideoesNormalModel

+ (NSDictionary *)objectClassInArray{
    return @{@"DuoWanVideoesNormalesArrayModel" : [DuoWanVideoesNormalesarrayModel class]};
}
@end


@implementation DuoWanVideoesNormalesarrayModel
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    //排除掉不需要转化的两个属性， 这是因为服务器人员命名不规范导致的，鄙视下(#‵′)凸
    //理论上服务器人员应该把下方属性写为total_page, channel_id
    if ([propertyName isEqualToString:@"totalPage"] || [propertyName isEqualToString:@"channelId"]) {
        return propertyName;
    }
    //    驼峰转下划线（loveYou -> love_you）
    return [propertyName mj_underlineFromCamel];
}
@end


