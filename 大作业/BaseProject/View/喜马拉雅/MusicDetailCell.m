//
//  MusicDetailCell.m
//  BaseProject
//
//  Created by 王杰 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MusicDetailCell.h"

@implementation MusicDetailCell

- (TuWanImageView *)coverIV {
    if(_coverIV == nil) {
        _coverIV = [[TuWanImageView alloc] init];
        [self.contentView addSubview:_coverIV];
        [_coverIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(55, 55));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
        }];
        _coverIV.layer.cornerRadius = 55 / 2.0;
        
        /**
         *  添加播放图
         */
        UIImageView *playIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_playbtn"]];
        [_coverIV addSubview:playIV];
        [playIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
    }
    return _coverIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.coverIV.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(self.timeLb.mas_left).mas_equalTo(-10);
        }];
        _titleLb.numberOfLines = 0;
    }
    return _titleLb;
}

- (UILabel *)timeLb {
    if(_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        [self.contentView addSubview:_timeLb];
        _timeLb.font = [UIFont systemFontOfSize:14];
        _timeLb.textColor = [UIColor lightGrayColor];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.width.mas_equalTo(100);
        }];
        _timeLb.textAlignment = NSTextAlignmentRight;
    }
    return _timeLb;
}

- (UILabel *)sourceLb {
    if(_sourceLb == nil) {
        _sourceLb = [[UILabel alloc] init];
        [self.contentView addSubview:_sourceLb];
        [_sourceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(4);
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin);
        }];
        _sourceLb.font = [UIFont systemFontOfSize:15];
        _sourceLb.textColor = [UIColor lightGrayColor];
    }
    return _sourceLb;
}

- (UILabel *)playCountLb {
    if(_playCountLb == nil) {
        _playCountLb = [[UILabel alloc] init];
        [self.contentView addSubview:_playCountLb];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_play"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(18, 18));
            make.leftMargin.mas_equalTo(self.sourceLb.mas_leftMargin);
            make.bottom.mas_equalTo(-10);
            make.top.mas_equalTo(self.sourceLb.mas_bottom).mas_equalTo(8);
        }];
        
        [_playCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageView);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
        }];
        _playCountLb.font = [UIFont systemFontOfSize:12];
        _playCountLb.textColor = [UIColor lightGrayColor];
    }
    return _playCountLb;
}

- (UILabel *)favorCountLb {
    if(_favorCountLb == nil) {
        _favorCountLb = [[UILabel alloc] init];
        [self.contentView addSubview:_favorCountLb];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_likes_n"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(18, 18));
            make.centerY.mas_equalTo(self.playCountLb);
            make.left.mas_equalTo(self.playCountLb.mas_right).mas_equalTo(7);
        }];
        [_favorCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            make.centerY.mas_equalTo(imageView);
            
        }];
        _favorCountLb.font = [UIFont systemFontOfSize:12];
        _favorCountLb.textColor = [UIColor lightGrayColor];
    }
    return _favorCountLb;
}

- (UILabel *)commentCountLb {
    if(_commentCountLb == nil) {
        _commentCountLb = [[UILabel alloc] init];
        [self.contentView addSubview:_commentCountLb];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_comments"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(18, 18));
            make.centerY.mas_equalTo(self.favorCountLb);
            make.left.mas_equalTo(self.favorCountLb.mas_right).mas_equalTo(7);
        }];
        [_commentCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            make.centerY.mas_equalTo(imageView);
        
        }];
        _commentCountLb.font = [UIFont systemFontOfSize:12];
        _commentCountLb.textColor = [UIColor lightGrayColor];

    }
    return _commentCountLb;
}

- (UILabel *)durationLb {
    if(_durationLb == nil) {
        _durationLb = [[UILabel alloc] init];
        [self.contentView addSubview:_durationLb];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_duration"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(18, 18));
            make.centerY.mas_equalTo(self.commentCountLb);
            make.left.mas_equalTo(self.commentCountLb.mas_right).mas_equalTo(7);
        }];
        [_durationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            make.centerY.mas_equalTo(imageView);
        }];
        _durationLb.font = [UIFont systemFontOfSize:12];
        _durationLb.textColor = [UIColor lightGrayColor];

    }
    return _durationLb;
}

- (UIButton *)downloadBtn {
    if(_downloadBtn == nil) {
        _downloadBtn = [UIButton buttonWithType:0];
        [self.contentView addSubview:_downloadBtn];
        [_downloadBtn setBackgroundImage:[UIImage imageNamed:@"cell_download"] forState:0];
        [_downloadBtn bk_addEventHandler:^(id sender) {
            DDLogVerbose(@"asdadad");
        } forControlEvents:UIControlEventTouchUpInside];
        [_downloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _downloadBtn;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        /**
         *  设置被选中后的背景色
         */
        UIView *view = [UIView new];
        view.backgroundColor = kRGBColor(243, 255, 254);
        self.selectedBackgroundView = view;
        self.separatorInset = UIEdgeInsetsMake(0, 100, 0, 0);
        
        self.downloadBtn.hidden = NO;
    }
    return self;
}

@end
