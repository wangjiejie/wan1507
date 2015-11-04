//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "BaseNetManager.h"
#import "TuWanModel.h"
#import "TuWanNetManager.h"
#import "XiMaLaYaNetManager.h"
#import "DuoWanNetManager.h"
#import "DuoWanModel.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    
    [TuWanNetManager getTuWanListType:TuWanTypeTouTiao start:0 completionHandle:^(TuWanModel *model, NSError *error) {
        DDLogVerbose(@".......");
    }];
    /*多玩盒子 接口测试*/
    [DuoWanNetManager getHeroWithType:HeroTypeAll completionHandle:^(DuoWanAllHeroesModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [DuoWanNetManager getHeroWithType:HeroTypeFree completionHandle:^(DuoWanFreeHeroesModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [DuoWanNetManager getHeroSkinsWithHeroName:@"Braum" completionHandle:^(NSArray *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [DuoWanNetManager getHeroSoundWithHeroName:@"Braum" completionHandle:^(NSArray *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [DuoWanNetManager getHeroVideosWithPage:1 tag:@"Braum" completionHandle:^(NSArray *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [DuoWanNetManager getHeroCZWithHeroName:@"Braum" completionHandle:^(NSArray *model, NSError *error) {
        DDLogVerbose(@"");
    }];

    [DuoWanNetManager getHeroDetailWithHeroName:@"Braum" completionHandle:^(id model, NSError *error) {
       DDLogVerbose(@""); 
    }];
    
    [DuoWanNetManager getHeroSuggestedGiftAndRunWithHeroName:@"Braum" completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@""); 
    }];
    
    [DuoWanNetManager getHeroChangeWithHeroName:@"Skarner" completionHandle:^(id model, NSError *error) {
         DDLogVerbose(@""); 
    }];
    
    [DuoWanNetManager getHeroWeekDataWithHeroId:72 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@""); 
    }];
    
    [DuoWanNetManager getToolMenuCompletionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [DuoWanNetManager getZBCategoryCompletionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [DuoWanNetManager getZBItemListWithTag:@"consumable" completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [DuoWanNetManager getItemDetailWithItemId:3004 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [DuoWanNetManager getGIftCompletionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [DuoWanNetManager getRunesCompletionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [DuoWanNetManager getHeroBestGroupCompletionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];

    
    return YES;
}

@end
