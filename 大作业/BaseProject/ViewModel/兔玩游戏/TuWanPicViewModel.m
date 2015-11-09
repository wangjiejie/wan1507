//
//  TuWanPicViewModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanPicViewModel.h"

@implementation TuWanPicViewModel

-(id)initWithAid:(NSString * _Nonnull)aid
{
    if(self = [super init])
    {
        self.aid = aid;
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

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [TuWanNetManager getPicDetailWithId:_aid completionHandle:^(TuWanPicModel *model, NSError *error) {
        self.picModel = model;
        completionHandle(error);
    }];
}

-(NSInteger)rowNumber
{
    return self.picModel.content.count;
}

-(NSURL *)picURLForRow:(NSInteger)row
{
    TuWanPicContentModel *model = self.picModel.content[row];
    return [NSURL URLWithString:model.pic];
}
@end
