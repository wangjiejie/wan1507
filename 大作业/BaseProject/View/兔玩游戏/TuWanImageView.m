//
//  TuWanImageView.m
//  BaseProject
//
//  Created by 王杰 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanImageView.h"

@implementation TuWanImageView

-(instancetype)init
{
    if(self = [super init])
    {
        _imageView = [UIImageView new];
        [self addSubview:_imageView];
        _imageView.contentMode = 2;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        //当前视图容易减掉超出自身区域的视图
        self.clipsToBounds = YES;
    }
    return self;
}

@end
