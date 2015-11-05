//
//  DuoWanHeroWeekDataModel.h
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class DuoWanHeroWeekDataModel,DuoWanHeroWeekDataChartsModel,DuoWanHeroWeekDataChartsRatio_DataModel;

@interface DuoWanHeroWeekModel : BaseModel

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) DuoWanHeroWeekDataModel *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface DuoWanHeroWeekDataModel : NSObject

@property (nonatomic, strong) NSArray<DuoWanHeroWeekDataChartsModel *> *charts;

@property (nonatomic, assign) double averageWinRatio;
@property (nonatomic, assign) double averageKNum;
@property (nonatomic, assign) double championId;
@property (nonatomic, assign) double averageDNum;
@property (nonatomic, assign) double averageANum;
@property (nonatomic, assign) double rank;

@end

@interface DuoWanHeroWeekDataChartsModel : NSObject

@property (nonatomic, copy) NSString *color;

@property (nonatomic, strong) NSArray<DuoWanHeroWeekDataChartsRatio_DataModel *> *ratioData;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *yAxisTitle;
@end

@interface DuoWanHeroWeekDataChartsRatio_DataModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger value;

@end

