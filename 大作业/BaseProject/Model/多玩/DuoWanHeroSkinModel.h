//
//  DuoWanHeroSkinModel.h
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class Duowanheroskinesarraymodel;
@interface DuoWanHeroSkinModel : BaseModel

@property (nonatomic, strong) NSArray<Duowanheroskinesarraymodel *> *DuoWanHeroSkinesArrayModel;

@end
@interface Duowanheroskinesarraymodel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *bigImg;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *smallImg;

@end

