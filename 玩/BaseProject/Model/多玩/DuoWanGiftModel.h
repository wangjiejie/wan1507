//
//  DuoWanGiftModel.h
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class DuoWanGiftAModel;
@interface DuoWanGiftModel : BaseModel

@property (nonatomic, strong) NSArray<DuoWanGiftAModel *> *a;

@property (nonatomic, strong) NSArray<DuoWanGiftAModel *> *d;

@property (nonatomic, strong) NSArray<DuoWanGiftAModel *> *g;

@end
@interface DuoWanGiftAModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSArray<NSString *> *level;

@end
