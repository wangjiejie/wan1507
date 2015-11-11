//
//  XiMaLaYaAlbumViewModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaLaYaAlbumViewModel.h"

@implementation XiMaLaYaAlbumViewModel

-(NSInteger)rowNumber
{
    return self.dataArr.count;
}

-(BOOL)isHasMore
{
    return _maxPageId > _pageId;
}

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _pageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    if(self.isHasMore)
    {
        _pageId += 1;
        [self getDataFromNetCompleteHandle:completionHandle];
    }
    else
    {
        NSError *error = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多数据"}];
        completionHandle(error);
    }
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [XiMaLaYaNetManager getAlbumWithId:_albumId page:_pageId completionHandle:^(XiMaLaYaAlbumModel *model, NSError *error) {
        if(_pageId == 1)
        {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.tracks.list];
        completionHandle(error);
    }];
}

-(instancetype)initWithAlbumId:(NSInteger)albumId
{
    if(self = [super init])
    {
        self.albumId = albumId;
    }
    return self;
}

-(XiMaLaYaAlbumTracksListModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}

/**  获取某行的封面图片URL */
-(NSURL *)coverURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].coverSmall];
}


/**  获取某行的题目 */
-(NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].title;
}

/**  获取某行的时间 */
-(NSString *)timeForRow:(NSInteger)row
{
    NSTimeInterval currentTime = [[NSDate date]timeIntervalSince1970];
    NSTimeInterval delta = currentTime - [self modelForRow:row].createdAt / 1000;
    NSInteger hours = delta / 3600;
    if(hours < 24)
    {
        return [NSString stringWithFormat:@"%ld小时前",hours];
    }
    NSInteger days = delta / 3600 / 24;
    return [NSString stringWithFormat:@"%ld天前",days];
        
}


/**  获取某行的出处 */
-(NSString *)sourceForRow:(NSInteger)row
{
    return [NSString stringWithFormat:@"by %@",[self modelForRow:row].nickname];
}

/**  获取某行的播放数 */
-(NSString *)playCountForRow:(NSInteger)row
{
    NSInteger count = [self modelForRow:row].playtimes;
    if(count < 10000)
    {
        return @([self modelForRow:row].playtimes).stringValue;
    }
    else
    {
        return [NSString stringWithFormat:@"%.2lf万",count/10000.0];
    }
}


/**  获取某行的喜欢数 */
-(NSString *)favorCountForRow:(NSInteger)row
{
    return @([self modelForRow:row].likes).stringValue;
}

/**  获取某行的评论数 */
-(NSString *)commentCountForRow:(NSInteger)row
{
    return @([self modelForRow:row].comments).stringValue;
}

/**  获取某行的播放时长 */
-(NSString *)durationForRow:(NSInteger)row
{
    NSInteger duration = [self modelForRow:row].duration;
    NSInteger minute = duration / 60;
    NSInteger second = duration % 60;
    return [NSString stringWithFormat:@"%02ld:%02ld",minute,second];
}

/**  获取某行的下载链接地址 */
-(NSURL *)downloadURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].downloadUrl];
}

/**  获取某行的音频播放地址 */
-(NSURL *)playURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].playUrl64];
}
@end
