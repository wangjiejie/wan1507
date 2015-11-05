//
//  DuoWanVideoesNormalModel.h
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
@class DuoWanVideoesNormalesarrayModel;
@interface DuoWanVideoesNormalModel : BaseModel
@property (nonatomic, strong) NSArray<DuoWanVideoesNormalesarrayModel *> *DuoWanVideoesNormalesArrayModel;

@end
@interface DuoWanVideoesNormalesarrayModel : NSObject
@property (nonatomic, strong) NSString *coverUrl;
@property (nonatomic, strong) NSString *udb;
@property (nonatomic, strong) NSString *channelId;
@property (nonatomic, strong) NSString *uploadTime;
@property (nonatomic, strong) NSString *vid;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *letvVideoUnique;
@property (nonatomic, strong) NSString *letvVideoId;
@property (nonatomic, assign) double videoLength;
@property (nonatomic, assign) double totalPage;


@end

