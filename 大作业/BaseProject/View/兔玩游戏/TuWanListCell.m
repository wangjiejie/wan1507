//
//  TuWanListCell.m
//  BaseProject
//
//  Created by 王杰 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanListCell.h"

@implementation TuWanListCell

- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        //内容模式，保持比例，填充满
       // _iconIV.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:17];
    }
    return _titleLb;
}

- (UILabel *)longTitleLb {
    if(_longTitleLb == nil) {
        _longTitleLb = [[UILabel alloc] init];
        _longTitleLb.font = [UIFont systemFontOfSize:14];
        _longTitleLb.textColor = [UIColor lightGrayColor];
        _longTitleLb.numberOfLines = 0;
    }
    return _longTitleLb;
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

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.longTitleLb];
        [self.contentView addSubview:self.clicksNumLb];
        
        //图片：左：10 宽高：92x70  竖向居中
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(92, 70));
            make.centerY.mas_equalTo(0);
        }];
        
        //titleLb：左距离图片：8 右10  上比图片矮3
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(3);
        }];
        
        //longTitleLb：左右与题目一样  上距离题目8
        [self.longTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin).mas_equalTo(0);
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin).mas_equalTo(0);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(8);
        }];
        
        //图片：clicksNumLb：下与图片对齐，右与题目对齐
        [self.clicksNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin).mas_equalTo(0);
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin).mas_equalTo(0);
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
