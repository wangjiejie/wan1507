//
//  TuWanVideoModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanVideoModel.h"

@implementation TuWanVideoModel


+ (NSDictionary *)objectClassInArray{
    return @{@"content" : [TuWanVideoContentModel class], @"relevant" : [TuWanVideoRelevantModel class]};
}
@end
@implementation TuWanVideoContentModel

@end


@implementation TuWanVideoRelevantModel

@end


