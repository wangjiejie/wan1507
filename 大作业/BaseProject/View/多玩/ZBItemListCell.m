//
//  ZBItemListCell.m
//  BaseProject
//
//  Created by 王杰 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBItemListCell.h"

@implementation ZBItemListCell
- (TuWanImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TuWanImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(70, 70));
        }];

    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(5);
        }];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.font = [UIFont systemFontOfSize:15];
    }
    return _titleLb;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.iconIV.hidden = NO;
        self.titleLb.hidden = NO;
    }
    return self;
}
@end
