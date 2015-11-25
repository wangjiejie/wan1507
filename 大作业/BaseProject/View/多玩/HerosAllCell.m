//
//  HerosAllCell.m
//  BaseProject
//
//  Created by 王杰 on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HerosAllCell.h"

@implementation HerosAllCell
- (TuWanImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TuWanImageView alloc] init];
        [self addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(70, 70));
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.iconIV);
            make.top.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(5);
        }];
        _titleLb.font = [UIFont systemFontOfSize:15];
    }
    return _titleLb;
}
@end
