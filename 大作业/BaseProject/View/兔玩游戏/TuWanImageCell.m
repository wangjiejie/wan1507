//
//  TuWanImageCell.m
//  BaseProject
//
//  Created by 王杰 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanImageCell.h"

@implementation TuWanImageCell
- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:17];
    }
    return _titleLb;
}

- (UILabel *)clicksNumLb {
    if(_clicksNumLb == nil) {
        _clicksNumLb = [[UILabel alloc] init];
        _clicksNumLb.font = [UIFont systemFontOfSize:12];
        _clicksNumLb.textColor = [UIColor lightGrayColor];
        _clicksNumLb.textAlignment = NSTextAlignmentRight;
    }
    return _clicksNumLb;
}

- (UIImageView *)iconIV0 {
    if(_iconIV0 == nil) {
        _iconIV0 = [[UIImageView alloc] init];
        //内容模式，保持比例，填充满
        //_iconIV0.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconIV0;
}

- (UIImageView *)iconIV1 {
    if(_iconIV1 == nil) {
        _iconIV1 = [[UIImageView alloc] init];
        //内容模式，保持比例，填充满
        //_iconIV1.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconIV1;
}

- (UIImageView *)iconIV2 {
    if(_iconIV2 == nil) {
        _iconIV2 = [[UIImageView alloc] init];
        //内容模式，保持比例，填充满
       // _iconIV2.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconIV2;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.clicksNumLb];
        [self.contentView addSubview:self.iconIV0];
        [self.contentView addSubview:self.iconIV1];
        [self.contentView addSubview:self.iconIV2];
        
      
        
        //titleLb：左：8 上10
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.rightMargin.mas_equalTo(self.clicksNumLb.mas_leftMargin).mas_equalTo(-10);
        }];
        
        //clicksNumLb：上与题目一样  右：10
        [self.clicksNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.titleLb.mas_topMargin).mas_equalTo(0);
            make.right.mas_equalTo(-10);
            make.width.mas_lessThanOrEqualTo(70);
            make.width.mas_greaterThanOrEqualTo(40);
            
        }];
        
        //图0：高：88，左：10 上距离题目下10
        [self.iconIV0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(88);
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(5);
        }];
        
        //图1： 高和图1一样 左距离图片0右5，上与图0一样
        [self.iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV0.mas_right).mas_equalTo(5);
            make.size.mas_equalTo(self.iconIV0);
            make.topMargin.mas_equalTo(self.iconIV0.mas_topMargin).mas_equalTo(0);
        }];
        
        //图2：右：10 高和图1一样 左距离图片1右5，上与图1一样
        [self.iconIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV1.mas_right).mas_equalTo(5);
            make.size.mas_equalTo(self.iconIV0);
            make.top.mas_equalTo(self.iconIV0.mas_top).mas_equalTo(0);
            make.right.mas_equalTo(-10);
        }];
        
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
