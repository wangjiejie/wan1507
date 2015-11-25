//
//  HerosFreeCell.h
//  BaseProject
//
//  Created by 王杰 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuWanImageView.h"

@interface HerosFreeCell : UICollectionViewCell
@property(nonatomic,strong) TuWanImageView *iconIV;

@property(nonatomic,strong) UILabel *titleLb;
@property(nonatomic,strong) UILabel *cnNameLb;
@property(nonatomic,strong) UILabel *locationLb;
@end
