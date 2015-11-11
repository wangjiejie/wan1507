//
//  PlayView.m
//  BaseProject
//
//  Created by 王杰 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PlayView.h"

@implementation PlayView

+(PlayView *)sharedInstance
{
    static PlayView *p = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        p = [[PlayView alloc]init];
    });
    return p;
}

-(instancetype)init
{
    if(self = [super init])
    {
        self.playBtn.hidden = NO;
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}


- (UIButton *)playBtn {
    if(_playBtn == nil) {
        _playBtn = [UIButton buttonWithType:0];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"PlayButtonOverlayLarge@3x"] forState:UIControlStateNormal];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"btn_record_pause"] forState:UIControlStateSelected];
        [self addSubview:_playBtn];
        [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_playBtn bk_addEventHandler:^(UIButton *sender) {
            if(sender.selected)
            {
                [_player pause];
            }
            else
            {
                [_player play];
            }
            sender.selected = !sender.selected;
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _playBtn;
}

-(void)playWithURL:(NSURL *)musicURL
{
    [[AVAudioSession sharedInstance]setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance]setActive:YES error:nil];
    _player = [AVPlayer playerWithURL:musicURL];
    [_player play];
    self.playBtn.selected = YES;
}
@end
