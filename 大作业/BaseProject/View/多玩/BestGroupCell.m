//
//  BestGroupCell.m
//  BaseProject
//
//  Created by 王杰 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupCell.h"
#define kPic (kWindowW - 50 * 5) / 6


@implementation BestGroupCell

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kPic);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-kPic);
            make.bottom.mas_equalTo(self.iconIV1.mas_top).mas_equalTo(-10);
        }];
        _titleLb.numberOfLines = 0;
    }
    return _titleLb;
}

- (TuWanImageView *)iconIV1 {
    if(_iconIV1 == nil) {
        _iconIV1 = [[TuWanImageView alloc] init];
        [self.contentView addSubview:_iconIV1];
        [_iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kPic);;
            make.size.mas_equalTo(CGSizeMake(50, 50));
            //make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(10);
            make.bottom.mas_equalTo(self.descLb.mas_top).mas_equalTo(-5);
        }];
    }
    return _iconIV1;
}

- (TuWanImageView *)iconIV2 {
    if(_iconIV2 == nil) {
        _iconIV2 = [[TuWanImageView alloc] init];
        [self.contentView addSubview:_iconIV2];
        [_iconIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV1.mas_right).mas_equalTo(kPic);
            make.size.mas_equalTo(self.iconIV1);
            make.centerY.mas_equalTo(self.iconIV1);
        }];
    }
    return _iconIV2;
}

- (TuWanImageView *)iconIV3 {
    if(_iconIV3 == nil) {
        _iconIV3 = [[TuWanImageView alloc] init];
        [self.contentView addSubview:_iconIV3];
        [_iconIV3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV2.mas_right).mas_equalTo(kPic);
            make.size.mas_equalTo(self.iconIV1);
            make.centerY.mas_equalTo(self.iconIV1);
        }];
    }
    return _iconIV3;
}
- (TuWanImageView *)iconIV4 {
    if(_iconIV4 == nil) {
        _iconIV4 = [[TuWanImageView alloc] init];
        [self.contentView addSubview:_iconIV4];
        [_iconIV4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV3.mas_right).mas_equalTo(kPic);
            make.size.mas_equalTo(self.iconIV1);
            make.centerY.mas_equalTo(self.iconIV1);
        }];
    }
    return _iconIV4;
}
- (TuWanImageView *)iconIV5 {
    if(_iconIV5 == nil) {
        _iconIV5 = [[TuWanImageView alloc] init];
        [self.contentView addSubview:_iconIV5];
        [_iconIV5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV4.mas_right).mas_equalTo(kPic);
            make.size.mas_equalTo(self.iconIV1);
            make.centerY.mas_equalTo(self.iconIV1);
            make.right.mas_equalTo(-kPic);
        }];
    }
    return _iconIV5;
}

- (UILabel *)descLb {
    if(_descLb == nil) {
        _descLb = [[UILabel alloc] init];
        [self.contentView addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
           // make.top.mas_equalTo(self.iconIV1.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(kPic);
            make.right.mas_equalTo(-kPic);
            make.bottom.mas_equalTo(-10);
        }];
        _descLb.font = [UIFont systemFontOfSize:15];
        _descLb.textColor = [UIColor lightGrayColor];
        _descLb.numberOfLines = 0;
    }
    return _descLb;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
    }
    return self;
}
@end
