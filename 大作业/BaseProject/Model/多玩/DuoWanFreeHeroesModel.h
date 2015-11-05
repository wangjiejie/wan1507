//
//  DuoWanFreeHeroesModel.h
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class DuoWanFreeHeroesFreeModel;
@interface DuoWanFreeHeroesModel : BaseModel

@property (nonatomic, strong) NSArray<DuoWanFreeHeroesFreeModel *> *free;

@property (nonatomic, copy) NSString *desc;

@end
@interface DuoWanFreeHeroesFreeModel : NSObject

@property (nonatomic, copy) NSString *enName;

@property (nonatomic, copy) NSString *cnName;

@property (nonatomic, copy) NSString *rating;

@property (nonatomic, copy) NSString *location;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *tags;

@end

