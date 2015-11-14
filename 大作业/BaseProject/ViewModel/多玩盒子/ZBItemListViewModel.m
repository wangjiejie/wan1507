//
//  ZBItemListViewModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBItemListViewModel.h"

@implementation ZBItemListViewModel
-(id)initWithTag:(NSString *)tag
{
    if(self = [super init])
    {
        self.tag = tag;
    }
    return self;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getZBItemListWithTag:_tag completionHandle:^(id model, NSError *error) {
        self.dataArr = model;
        completionHandle(error);
    } ];
}

-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(DuoWanZBItemListModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].text;
    
}

-(NSInteger)IDForRow:(NSInteger)row
{
    return [self modelForRow:row].ID;
}
@end
