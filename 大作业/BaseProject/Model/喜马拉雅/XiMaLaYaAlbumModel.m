//
//  XiMaLaYaAlbumModel.m
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaLaYaAlbumModel.h"

@implementation XiMaLaYaAlbumModel


@end


@implementation XiMaLaYaAlbumAlbumModel

@end


@implementation XiMaLaYaAlbumTracksModel

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [XiMaLaYaAlbumTracksListModel class]};
}

@end


@implementation XiMaLaYaAlbumTracksListModel

@end
