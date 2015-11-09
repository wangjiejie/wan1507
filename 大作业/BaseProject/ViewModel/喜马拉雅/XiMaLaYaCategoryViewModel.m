//
//  XiMaLaYaCategoryViewModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaLaYaCategoryViewModel.h"

@implementation XiMaLaYaCategoryViewModel
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _pageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    if(_pageId >= _maxPageId)
    {
        NSError *error = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多数据"}];
        completionHandle(error);
        return;
    }
    _pageId += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [XiMaLaYaNetManager getRankListWithPageId:_pageId completionHandle:^(XiMaLaYaRankingListModel *model, NSError *error) {
        if(!error)
        {
            if(_pageId == 1)
            {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:model.list];
            _maxPageId = model.maxPageId;
        }
        completionHandle(error);
    }];

}

-(XiMaLaYaRankListListModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}

-(NSInteger)rowNumber
{
    return self.dataArr.count;
}

-(NSInteger)albumIdForRow:(NSInteger)row
{
    return [self modelForRow:row].albumId;
}

-(NSURL *)iconURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].albumCoverUrl290];
}

-(NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].title;
}

-(NSString *)descForRow:(NSInteger)row
{
    return [self modelForRow:row].intro;
}

-(NSString *)numberForRow:(NSInteger)row
{
    return [NSString stringWithFormat:@"%ld集",[self modelForRow:row].tracks];
}

@end
