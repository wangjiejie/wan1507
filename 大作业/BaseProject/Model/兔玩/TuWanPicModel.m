//
//  TuWanPicModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanPicModel.h"

@implementation TuWanPicModel


+ (NSDictionary *)objectClassInArray{
    return @{@"showitem" : [TuWanPicShowitemModel class], @"relevant" : [TuWanPicRelevantModel class], @"content" : [TuWanPicContentModel class]};
}
@end
@implementation TuWanPicInfochildModel

@end


@implementation TuWanPicShowitemModel

@end


@implementation TuWanPicShowitemInfoModel

@end


@implementation TuWanPicRelevantModel

@end


@implementation TuWanPicContentModel

@end


@implementation TuWanPicContentInfoModel

@end


