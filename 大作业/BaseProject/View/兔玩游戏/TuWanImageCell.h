//
//  TuWanImageCell.h
//  BaseProject
//
//  Created by 王杰 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuWanImageView.h"

@interface TuWanImageCell : UITableViewCell

/** 题目标签 */
@property (nonatomic,strong)UILabel *titleLb;

/** 点击数标签 */
@property (nonatomic,strong)UILabel *clicksNumLb;

/** 图片1 */
@property (nonatomic,strong)TuWanImageView *iconIV0;

/** 图片2 */
@property (nonatomic,strong)TuWanImageView *iconIV1;

/** 图片3 */
@property (nonatomic,strong)TuWanImageView *iconIV2;



@end
