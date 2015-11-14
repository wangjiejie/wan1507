//
//  BestGroupViewModel.h
//  BaseProject
//
//  Created by 王杰 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"

//总要拼接，做宏
#define kIconPathWithEnName(enName)  [NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", enName]

@interface BestGroupViewModel : BaseViewModel
/** 有多少行 */
@property(nonatomic) NSInteger rowNumber;

/** 某行的题目 */
- (NSString *)titleForRow:(NSInteger)row;

/** 某行的图片URL数组 */
- (NSArray *)iconURLArrForRow:(NSInteger)row;

/** 某行的描述 */
- (NSString *)descForRow:(NSInteger)row;

/** 英雄描述数组 */
- (NSArray *)descsForRow:(NSInteger)row;

@end
