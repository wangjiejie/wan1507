//
//  TuWanPicViewModel.h
//  BaseProject
//
//  Created by 王杰 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"

@interface TuWanPicViewModel : BaseViewModel


-(id)initWithAid:( NSString * _Nonnull)aid;

/** aid的赋值应该是非空的 */
@property (nonatomic,strong) NSString * _Nonnull aid;

@property (nonatomic)NSInteger rowNumber;

-(NSURL *)picURLForRow:(NSInteger)row;

@property (nonatomic,strong)TuWanPicModel *picModel;
@end
