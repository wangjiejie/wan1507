//
//  HeroViewModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroViewModel.h"

@implementation HeroViewModel

-(instancetype)initWithType:(HeroType)type
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
/** 获取数据 */
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getHeroWithType:_type completionHandle:^(id model, NSError *error) {
        if(_type == HeroTypeFree)
        {
            DuoWanFreeHeroesModel *modelFree = (DuoWanFreeHeroesModel *)model;
            self.heroFreeArr = [modelFree.free copy];
            self.desc = modelFree.desc;
            
        }
        else
        {
            DuoWanAllHeroesModel *modelAll = (DuoWanAllHeroesModel *)model;
            self.dataArr = [modelAll.all copy];
        }
        completionHandle(error);
    } ];
}


-(NSInteger)rowNumber
{
    if(_type == HeroTypeFree)
    {
     return self.heroFreeArr.count;
    }
    return self.dataArr.count;
}

-(DuoWanAllHeroesAllModel *)modelAllForRow:(NSInteger)row
{
    return self.dataArr[row];
}

-(DuoWanFreeHeroesFreeModel *)modelFreeForRow:(NSInteger)row
{
    return self.heroFreeArr[row];
}
/** 返回某行英雄的enName */
-(NSString *)enNameForRow:(NSInteger)row
{
    if(_type == HeroTypeFree)
    {
        return [self modelFreeForRow:row].enName;
    }
    return [self modelAllForRow:row].enName;
}


/** 返回某行英雄的cnName */
-(NSString *)cnNameForRow:(NSInteger)row
{
    if(_type == HeroTypeFree)
    {
        return [self modelFreeForRow:row].cnName;
    }
    return [self modelAllForRow:row].cnName;

}


/** 返回某行英雄的title */
-(NSString *)titleForRow:(NSInteger)row
{
    if(_type == HeroTypeFree)
    {
        return [self modelFreeForRow:row].title;
    }
    return [self modelAllForRow:row].title;
}

/** 返回某行英雄的tags */
-(NSString *)tagsForRow:(NSInteger)row
{
    if(_type == HeroTypeFree)
    {
        return [self modelFreeForRow:row].tags;
    }
    return [self modelAllForRow:row].tags;
}

/** 返回某行英雄的rating */
-(NSString *)ratingForRow:(NSInteger)row
{
    if(_type == HeroTypeFree)
    {
        return [self modelFreeForRow:row].rating;
    }
    return [self modelAllForRow:row].rating;
}

/** 返回某行英雄的location */
-(NSString *)locationForRow:(NSInteger)row
{
    if(_type == HeroTypeFree)
    {
        return [self modelFreeForRow:row].location;
    }
    return [self modelAllForRow:row].location;
}

/** 返回某行英雄的price */
-(NSString *)priceForRow:(NSInteger)row
{
    if(_type == HeroTypeFree)
    {
        return [self modelFreeForRow:row].price;
    }
    return [self modelAllForRow:row].price;
}

@end
