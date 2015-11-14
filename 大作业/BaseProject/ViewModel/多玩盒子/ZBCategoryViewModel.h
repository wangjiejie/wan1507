//
//  ZBCategoryViewModel.h
//  BaseProject
//
//  Created by 王杰 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"

@interface ZBCategoryViewModel : BaseViewModel
/** 有多少行 */
@property(nonatomic) NSInteger rowNumber;

/** 某行的题目 */
- (NSString *)titleForRow:(NSInteger)row;

/** 某行的tag */
- (NSString *)tagForRow:(NSInteger)row;
@end
