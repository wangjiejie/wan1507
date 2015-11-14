//
//  ZBCategoryViewModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBCategoryViewModel.h"

@implementation ZBCategoryViewModel
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getZBCategoryCompletionHandle:^(id model, NSError *error) {
        self.dataArr = model;
        completionHandle(error);
    } ];
}

-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(DuoWanZBCategoryModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].text;
    
}

/** 某行的tag */
- (NSString *)tagForRow:(NSInteger)row
{
    return [self modelForRow:row].tag;
}
@end
