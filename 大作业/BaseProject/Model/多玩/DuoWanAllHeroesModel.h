//
//  DuoWanAllHeroesModel.h
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class DuoWanAllHeroesAllModel;
@interface DuoWanAllHeroesModel : BaseModel

@property (nonatomic, strong) NSArray<DuoWanAllHeroesAllModel *> *all;

@end
@interface DuoWanAllHeroesAllModel : NSObject

@property (nonatomic, copy) NSString *enName;

@property (nonatomic, copy) NSString *cnName;

@property (nonatomic, copy) NSString *rating;

@property (nonatomic, copy) NSString *location;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *tags;

@end

