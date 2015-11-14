//
//  BestGroupCell.h
//  BaseProject
//
//  Created by 王杰 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuWanImageView.h"

@interface BestGroupCell : UITableViewCell

/** 题目标签 */
@property (nonatomic,strong)UILabel *titleLb;

/** 图片1 */
@property (nonatomic,strong)TuWanImageView *iconIV1;

/** 图片2 */
@property (nonatomic,strong)TuWanImageView *iconIV2;

/** 图片3 */
@property (nonatomic,strong)TuWanImageView *iconIV3;

/** 图片4 */
@property (nonatomic,strong)TuWanImageView *iconIV4;


/** 图片5 */
@property (nonatomic,strong)TuWanImageView *iconIV5;


/** 描述标签 */
@property (nonatomic,strong)UILabel *descLb;



@end
