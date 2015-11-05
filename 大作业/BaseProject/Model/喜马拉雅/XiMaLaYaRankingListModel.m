//
//  XiMaLaYaRankingListModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaLaYaRankingListModel.h"

@implementation XiMaLaYaRankingListModel


+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [XiMaLaYaRankListListModel class]};
}
@end
@implementation XiMaLaYaRankListListModel

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id"};
}

@end