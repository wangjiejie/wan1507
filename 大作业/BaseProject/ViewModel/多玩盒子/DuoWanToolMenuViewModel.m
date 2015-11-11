//
//  DuoWanToolMenuViewModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanToolMenuViewModel.h"

@implementation DuoWanToolMenuViewModel
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getToolMenuCompletionHandle:^(id model, NSError *error) {
        self.dataArr = model;
        completionHandle(error);
    }];
}

-(DuoWanToolMenuModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
/**  某行的图片URL */
-(NSURL *)iconURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].icon];
}

/** 某行的题目 */
-(NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].name;
}




/**  某行的tag值 */
-(NSString *)tagForRow:(NSInteger)row
{
    return [self modelForRow:row].tag;
}


- (NSURL *)webURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].url];
}

- (ToolMenuItemType)itemTypeForRow:(NSInteger)row{
    NSString *type = [self modelForRow:row].type;
    if ([type isEqualToString:@"native"]) {
        return ToolMenuItemTypeNative;
    }
    if ([type isEqualToString:@"web"]) {
        return ToolMenuItemTypeWeb;
    }
    return 0;
}

@end
