//
//  TuWanModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanModel.h"

@implementation TuWanModel

@end



@implementation TuWanDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"indexpic" : [TuWanDataIndexpicModel class], @"list" : [TuWanDataListModel class]};
}

@end


@implementation TuWanDataIndexpicModel

+ (NSDictionary *)objectClassInArray{
    return @{@"showitem" : [TuWanDataIndexpicShowitemModel class]};
}

+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"typeName":@"typename",@"desc":@"description"};
}

@end


@implementation TuWanDataIndexpicInfochildModel

@end


@implementation TuWanDataIndexpicShowitemModel

@end


@implementation TuWanDataIndexpicShowitemInfoModel

@end


@implementation TuWanDataListModel

+ (NSDictionary *)objectClassInArray{
    return @{@"showitem" : [TuWanDataListShowitemModel class]};
}
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"desc":@"description",@"typeName":@"typename"};
}

@end


@implementation TuWanDataListInfochildModel

@end


@implementation TuWanDataListShowitemModel

@end


@implementation TuWanDataListShowitemInfoModel

@end


