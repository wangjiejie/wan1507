//
//  ZBItemListViewModel.h
//  BaseProject
//
//  Created by 王杰 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"

@interface ZBItemListViewModel : BaseViewModel

-(id)initWithTag:(NSString *)tag NS_DESIGNATED_INITIALIZER;
@property (nonatomic,strong)NSString *tag;
/** 有多少行 */
@property(nonatomic) NSInteger rowNumber;

/** 某行的题目 */
- (NSString *)titleForRow:(NSInteger)row;

-(NSInteger)IDForRow:(NSInteger)row;

@end
