//
//  SumAbilityViewModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SumAbilityViewModel.h"

@implementation SumAbilityViewModel

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getSumAbilityCompletionHandle:^(id model, NSError *error) {
        self.dataArr = model;
        completionHandle(error);
    } ];
}

-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(DuoWanSumAbilityModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].name;
    
}

/** 某行的tag */
- (NSString *)IDForRow:(NSInteger)row
{
    return [self modelForRow:row].ID;
}


/** 某行的天赋 */
- (NSString *)strongForRow:(NSInteger)row
{
    return [self modelForRow:row].strong;

}

/** 某行的冷却时间 */
- (NSString *)cooldownForRow:(NSInteger)row
{
    return [self modelForRow:row].cooldown;

}


/** 某行的等级 */
- (NSString *)levelForRow:(NSInteger)row
{
    return [self modelForRow:row].level;

}

/** 某行的提示 */
- (NSString *)tipsForRow:(NSInteger)row
{
    return [self modelForRow:row].tips;

}

/** 某行的描述 */
- (NSString *)desForRow:(NSInteger)row
{
    return [self modelForRow:row].des;

}

@end
