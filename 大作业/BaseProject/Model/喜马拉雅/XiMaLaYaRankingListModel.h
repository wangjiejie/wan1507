//
//  XiMaLaYaRankingListModel.h
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class XiMaLaYaRankListListModel;

@interface XiMaLaYaRankingListModel : BaseModel


@property (nonatomic, assign) NSInteger pageId;

@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<XiMaLaYaRankListListModel *> *list;

@property (nonatomic, assign) NSInteger ret;

@end
@interface XiMaLaYaRankListListModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, assign) NSInteger tracksCounts;

@property (nonatomic, assign) NSInteger playsCounts;

@property (nonatomic, assign) NSInteger isFinished;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, copy) NSString *coverMiddle;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger lastUptrackAt;

@property (nonatomic, copy) NSString *albumCoverUrl290;

@property (nonatomic, assign) NSInteger serialState;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, assign) NSInteger lastUptrackId;

@end

