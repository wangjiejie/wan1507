//
//  TuWanViewModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewModel.h"


@implementation TuWanViewModel

-(instancetype)initWithType:(InfoType)type
{
    if(self = [super init])
    {
        _type = type;
    }
    return self;
}

/** 预防新编程 防止没有使用 initWithType 方法*/
-(instancetype)init
{
    if(self = [super init])
    {
        NSAssert(NO,@"%s 必须使用initWithType初始化方法", __func__);
    }
    return self;
}
/** 刷新 */
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
    
}

/** 获取更多 */
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    _start += 11;
    [self getDataFromNetCompleteHandle:completionHandle];
}


/** 获取数据 */
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [ TuWanNetManager getTuWanListType:_type start:_start completionHandle:^(TuWanModel *model, NSError *error) {
        if(_start == 0)
        {
            [self.dataArr removeAllObjects];
            self.indexPicArr = nil;
        }
        [self.dataArr addObjectsFromArray:model.data.list];
        self.indexPicArr = model.data.indexpic;
        completionHandle(error);
    }];
}

-(BOOL)isExistIndexPic
{
    return self.indexPicArr != nil && self.indexPicArr.count != 0;
}

-(NSInteger)rowNumber
{
    return self.dataArr.count;
}

/** 根据showType 0是没图  1是有图 */
-(BOOL)containImages:(NSInteger)row
{
    return [[self modelForArr:self.dataArr row:row].showtype isEqualToString:@"1"];
}

-(TuWanDataIndexpicModel *)modelForArr:(NSArray *)arr row:(NSInteger)row
{
    return arr[row];
}
/** 返回列表中某行数据的题目 */
-(NSString *)titleForRowInList:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].title;
}

/** 返回列表中某行数据图片 */
-(NSURL *)iconURLForRowInList:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].litpic];
}

/** 返回列表中某行数据的描述 */
-(NSString *)descForRowInList:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].longtitle;
}


/** 返回列表中某行数据的浏览人数 */
-(NSString *)clickForRowInList:(NSInteger)row
{
   return [[self modelForArr:self.dataArr row:row].click stringByAppendingString:@"人浏览"];
}

/** 返回滚动展示栏的图片 */
-(NSURL *)iconURLForRowInIndexPic:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForArr:self.indexPicArr row:row].litpic];
}
/** 返回滚动展示栏的文字 */
-(NSString *)titleForRowInIndexPic:(NSInteger)row
{
    return [self modelForArr:self.indexPicArr row:row].title;
}

/** 返回滚动展示栏的图片数量 */
-(NSInteger)indexPicNumber
{
    return self.indexPicArr.count;
}

/** 获取列表中某行数据对应的html5链接 */
-(NSURL *)detailURLForRowInList:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].html5];
}
/** 返回滚动展示栏某行数据对应的html5链接 */
-(NSURL *)detailURLForRowInIndexPic:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForArr:self.indexPicArr row:row].html5];
}

/** 返回列表中某行数据的图片链接数组 */
-(NSArray *)iconURLSForRowInList:(NSInteger)row
{
    NSArray *arr = [self modelForArr:self.dataArr row:row].showitem;
    NSMutableArray *muArr = [NSMutableArray new];
    for (int i = 0; i < arr.count; i ++) {
        TuWanDataIndexpicShowitemModel *model = arr[i];
        [muArr addObject:[NSURL URLWithString:model.pic]];
    }
    return [muArr copy];
}




@end
