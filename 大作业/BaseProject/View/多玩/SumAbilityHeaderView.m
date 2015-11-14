//
//  SumAbilityHeaderView.m
//  BaseProject
//
//  Created by 王杰 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SumAbilityHeaderView.h"

@implementation SumAbilityHeaderView

- (TuWanImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TuWanImageView alloc] init];
        [self addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(8);
            make.size.mas_equalTo(CGSizeMake(60, 60));
        }];
    }
    return _iconIV;
}

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        [self addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.iconIV);
        }];
        _nameLb.font = [UIFont systemFontOfSize:15];
    }
    return _nameLb;
}

- (UILabel *)levelLb {
    if(_levelLb == nil) {
        _levelLb = [[UILabel alloc] init];
        [self addSubview:_levelLb];
        [_levelLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.nameLb);
            make.top.mas_equalTo(self.nameLb.mas_bottom).mas_equalTo(2);
        }];
        _levelLb.font = [UIFont systemFontOfSize:12];
        _levelLb.textColor = [UIColor lightGrayColor];
    }
    return _levelLb;
}

- (UILabel *)cooldownLb {
    if(_cooldownLb == nil) {
        _cooldownLb = [[UILabel alloc] init];
        [self addSubview:_cooldownLb];
        [_cooldownLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.levelLb);
            make.top.mas_equalTo(self.levelLb.mas_bottom).mas_equalTo(2);
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin).mas_equalTo(-7);
        }];
        _cooldownLb.font = [UIFont systemFontOfSize:12];
        _cooldownLb.textColor = [UIColor lightGrayColor];
    }
    return _cooldownLb;
}
@end
