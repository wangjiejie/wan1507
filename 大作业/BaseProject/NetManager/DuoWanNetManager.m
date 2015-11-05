//
//  DuoWanNetManager.m
//  BaseProject
//
//  Created by 王杰 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanNetManager.h"

//免费+全部英雄
#define kHeroPath           @"http://lolbox.duowan.com/phone/apiHeroes.php"
//英雄皮肤
#define kHeroSkinPath       @"http://box.dwstatic.com/apiHeroSkin.php"
//英雄配音
#define kHeroSoundPath      @"http://box.dwstatic.com/apiHeroSound.php"
//英雄视频
#define kHeroVideoPath      @"http://box.dwstatic.com/apiVideoesNormalDuowan.php"
//英雄出装
#define kHeroCZPath         @"http://db.duowan.com/lolcz/img/ku11/api/lolcz.php"
//英雄资料
#define kHeroDetailPath     @"http://lolbox.duowan.com/phone/apiHeroDetail.php"
//英雄排行
#define kHeroTop10Path      @"http://lolbox.duowan.com/phone/heroTop10PlayersNew.php"
//天赋符文
#define kGiftAndRunPath     @"http://box.dwstatic.com/apiHeroSuggestedGiftAndRun.php"
//英雄改动
#define kHeroInfoPath       @"http://db.duowan.com/boxnews/heroinfo.php"
//一周数据
#define kHeroWeekDataPath   @"http://183.61.12.108/apiHeroWeekData.php"
//游戏百科列表
#define kToolMenuPath       @"http://box.dwstatic.com/apiToolMenu.php"
//装备分类
#define kZBCategoryPath     @"http://lolbox.duowan.com/phone/apiZBCategory.php"
//某装备分类内容
#define kZBItemListPath     @"http://lolbox.duowan.com/phone/apiZBItemList.php"
//装备详情
#define kItemDetailPath     @"http://lolbox.duowan.com/phone/apiItemDetail.php"
//天赋
#define kGiftPath           @"http://lolbox.duowan.com/phone/apiGift.php"
//符文列表
#define kRunesPath          @"http://lolbox.duowan.com/phone/apiRunes.php"
//召唤师技能列表
#define kSumAbilityPath     @"http://lolbox.duowan.com/phone/apiSumAbility.php"
//最佳阵容
#define kBestGroupPath      @"http://box.dwstatic.com/apiHeroBestGroup.php"

//获取当前系统版本号
#define kOSType       @"OSType": [@"iOS" stringByAppendingString:[UIDevice currentDevice].systemVersion]
#define kVersionName    @"versionName": @"2.4.0"
#define kV              @"v": @140


@implementation DuoWanNetManager

+ (id)getHeroWithType:(HeroType)type completionHandle:(void (^)(id, NSError *))completionHandle{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kOSType, kV}];
    switch (type) {
        case HeroTypeFree: {
            [params setObject:@"free" forKey:@"type"];
            break;
        }
        case HeroTypeAll: {
            [params setObject:@"all" forKey:@"type"];
            break;
        }
        default: {
            NSAssert1(NO, @"%s:type类型不正确", __func__);
            break;
        }
    }
    
    return [self GET:kHeroPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        switch (type) {
            case HeroTypeFree: {
                completionHandle([DuoWanFreeHeroesModel objectWithKeyValues:responseObj], error);
                break;
            }
            case HeroTypeAll: {
                completionHandle([DuoWanAllHeroesModel objectWithKeyValues:responseObj], error);
                break;
            }
            default: {
                completionHandle(nil, error);
                break;
            }
        }
    }];
}


+ (id)getHeroSkinsWithHeroName:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroSkinPath parameters:@{kOSType, kV, kVersionName, @"hero": heroName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([DuoWanHeroSkinModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getHeroSoundWithHeroName:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroSoundPath parameters:@{kOSType, kV, kVersionName, @"hero": heroName} completionHandler:^(id responseObj, NSError *error) {
        //Json数据就是标准数组，不需要解析
        completionHandle(responseObj, error);
    }];
}

+ (id)getHeroVideosWithPage:(NSInteger)page tag:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroVideoPath parameters:@{kVersionName, kOSType, @"action": @"l", @"p": @(page), @"src": @"letv", @"tag": enName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([DuoWanVideoesNormalesarrayModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getHeroCZWithHeroName:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroCZPath parameters:@{kV, kOSType, @"limit": @7, @"championName": enName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([DuoWanLolczModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+(id)getHeroDetailWithHeroName:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kHeroDetailPath parameters:@{kV, kOSType, @"her oName": enName} completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([DuoWanHeroDetailModel objectWithKeyValues:responseObj], error);
    }];
}


+(id)getHeroSuggestedGiftAndRunWithHeroName:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kGiftAndRunPath parameters:@{kV, kOSType, @"hero": enName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([DuoWanHeroSuggestedGiftAndRunesarrayModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}


+(id)getHeroChangeWithHeroName:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kHeroInfoPath parameters:@{kV, kOSType, @"name": enName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([DuoWanHeroChangeModel objectWithKeyValues:responseObj], error);
    }];
}


+(id)getHeroWeekDataWithHeroId:(NSInteger)heroId completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kHeroWeekDataPath parameters:@{@"heroId": @(heroId)} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([DuoWanHeroWeekModel objectWithKeyValues:responseObj], error);
    }];
}


+ (id)getToolMenuCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kToolMenuPath parameters:@{kV, kVersionName, kOSType, @"category": @"database"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([DuoWanToolMenuModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getZBCategoryCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kZBCategoryPath parameters:@{} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([DuoWanZBCategoryModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getZBItemListWithTag:(NSString *)tag completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kZBItemListPath parameters:@{@"tag": tag, kV, kOSType, kVersionName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([DuoWanZBItemListModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getItemDetailWithItemId:(NSInteger)itemId completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kItemDetailPath parameters:@{kV, kOSType, @"id": @(itemId)} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([DuoWanItemDetailModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getGIftCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kGiftPath parameters:@{kV, kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([DuoWanGiftModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getRunesCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kRunesPath parameters:@{kV, kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([DuoWanRunesModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getSumAbilityCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kSumAbilityPath parameters:@{kV, kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([DuoWanSumAbilityModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getHeroBestGroupCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kBestGroupPath parameters:@{kV, kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([DuoWanHeroBestGroupModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}



















































@end
