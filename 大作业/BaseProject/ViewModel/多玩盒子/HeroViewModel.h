//
//  HeroViewModel.h
//  BaseProject
//
//  Created by 王杰 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"

@interface HeroViewModel : BaseViewModel
/**
 *  "enName": "Trundle",
 "cnName": "特朗德尔",
 "title": "巨魔之王",
 "tags": "fighter",
 "rating": "7,6,2,5",
 "location": "上单,打野",
 "price": "3150,3000"
*/


/** 必须使用此初始化方法，需要一个类型 */
-(instancetype)initWithType:(HeroType)type;
@property (nonatomic)HeroType type;


/** 数量 */
@property (nonatomic)NSInteger rowNumber;

/** 返回免费英雄的desc */
@property (nonatomic,strong)NSString *desc;

@property (nonatomic,strong)NSArray *heroFreeArr;

/** 返回某行英雄的enName */
-(NSString *)enNameForRow:(NSInteger)row;


/** 返回某行英雄的cnName */
-(NSString *)cnNameForRow:(NSInteger)row;


/** 返回某行英雄的title */
-(NSString *)titleForRow:(NSInteger)row;

/** 返回某行英雄的tags */
-(NSString *)tagsForRow:(NSInteger)row;

/** 返回某行英雄的location */
-(NSString *)ratingForRow:(NSInteger)row;

/** 返回某行英雄的location */
-(NSString *)locationForRow:(NSInteger)row;

/** 返回某行英雄的price */
-(NSString *)priceForRow:(NSInteger)row;

@end
