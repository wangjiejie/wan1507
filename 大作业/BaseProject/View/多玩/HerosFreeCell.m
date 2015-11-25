//
//  HerosFreeCell.m
//  BaseProject
//
//  Created by 王杰 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HerosFreeCell.h"

@implementation HerosFreeCell
- (TuWanImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TuWanImageView alloc] init];
        [self addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.iconIV);
        }];
        _titleLb.font = [UIFont systemFontOfSize:15];
    }
    return _titleLb;
}

- (UILabel *)cnNameLb {
    if(_cnNameLb == nil) {
        _cnNameLb = [[UILabel alloc] init];
        [self addSubview:_cnNameLb];
        [_cnNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLb);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(5);
        }];
        _cnNameLb.font = [UIFont systemFontOfSize:12];
        _cnNameLb.textColor = [UIColor lightGrayColor];
    }
    return _cnNameLb;
}

- (UILabel *)locationLb {
    if(_locationLb == nil) {
        _locationLb = [[UILabel alloc] init];
        [self addSubview:_locationLb];
        [_locationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.cnNameLb);
            make.top.mas_equalTo(self.cnNameLb.mas_bottom).mas_equalTo(5);
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin).mas_equalTo(-2);
        }];
        _locationLb.font = [UIFont systemFontOfSize:12];
        _locationLb.textColor = [UIColor blueColor];
    }
    return _locationLb;
}

@end
