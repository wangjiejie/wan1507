//
//  TuWanNetManager.h
//  BaseProject
//
//  Created by 王杰 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuWanModel.h"
typedef NS_ENUM(NSUInteger, InfoType) {
    TuWanTypeTouTiao,  //头条
    TuWanTypeDuJia,     //独家
    TuWanTypeAnHei3,     //暗黑3
    TuWanTypeMoShou,     //魔兽
    TuWanTypeFengBao,   //风暴
    TuWanTypeLuShi,    //炉石
    TuWanTypeXingJi2,      //星际2
    TuWanTypeShouWang,     //守望
    TuWanTypeTuPian,       //图片
    TuWanTypeShiPing,      //视频
    TuWanTypeGongLue,        //攻略
    TuWanTypeHuanHua,       //幻化
    TuWanTypeQuWen,         //趣闻
    TuWanTypeCos,           //COS
    TuWanTypeMeiNv,         //美女
};


@interface TuWanNetManager : BaseNetManager

+ (id)getTuWanListType:(InfoType)type  start:(NSInteger)start completionHandle:(void(^)(TuWanModel *model, NSError *error))completionHandle;

@end
