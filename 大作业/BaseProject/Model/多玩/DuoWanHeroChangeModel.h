//
//  DuoWanHeroChangeModel.h
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"


@class DuoWanHeroChangeChangelogModel;
@interface DuoWanHeroChangeModel : BaseModel

@property (nonatomic, copy) NSString *gold;
@property (nonatomic, copy) NSString *coupon;
@property (nonatomic, strong) NSArray<DuoWanHeroChangeChangelogModel *> *changeLog;
@property (nonatomic, copy) NSString *eName;
@property (nonatomic, copy) NSString *cName;
@property (nonatomic, copy) NSString *location;

@end


@interface DuoWanHeroChangeChangelogModel : NSObject

@property (nonatomic, copy) NSString *version;

@property (nonatomic, copy) NSString *time;

@property (nonatomic, copy) NSString *info;

@end
