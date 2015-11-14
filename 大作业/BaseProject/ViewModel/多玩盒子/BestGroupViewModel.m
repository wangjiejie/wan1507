//
//  BestGroupViewModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupViewModel.h"

@implementation BestGroupViewModel
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getHeroBestGroupCompletionHandle:^(id model, NSError *error) {
        self.dataArr = model;
        
        completionHandle(error);
    }];
}

-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(DuoWanHeroBestGroupModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].title;
    
}

-(NSArray *)iconURLArrForRow:(NSInteger)row
{
    return @[kIconPathWithEnName([self modelForRow:row].hero1),
             kIconPathWithEnName([self modelForRow:row].hero2),
             kIconPathWithEnName([self modelForRow:row].hero3),
             kIconPathWithEnName([self modelForRow:row].hero4),
             kIconPathWithEnName([self modelForRow:row].hero5)];}


-(NSString *)descForRow:(NSInteger)row
{
    return [self modelForRow:row].des;
}

/** 英雄描述数组 */
- (NSArray *)descsForRow:(NSInteger)row{
    return @[[self modelForRow:row].des1,
             [self modelForRow:row].des2,
             [self modelForRow:row].des3,
             [self modelForRow:row].des4,
             [self modelForRow:row].des5];
}
@end
