//
//  SumAbilityViewModel.h
//  BaseProject
//
//  Created by 王杰 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface SumAbilityViewModel : BaseViewModel
/** 有多少行 */
@property(nonatomic) NSInteger rowNumber;

/** 某行的题目 */
- (NSString *)titleForRow:(NSInteger)row;

/** 某行的tag */
- (NSString *)IDForRow:(NSInteger)row;

/** 某行的天赋 */
- (NSString *)strongForRow:(NSInteger)row;

/** 某行的冷却时间 */
- (NSString *)cooldownForRow:(NSInteger)row;


/** 某行的等级 */
- (NSString *)levelForRow:(NSInteger)row;

/** 某行的提示 */
- (NSString *)tipsForRow:(NSInteger)row;

/** 某行的描述 */
- (NSString *)desForRow:(NSInteger)row;

@end
