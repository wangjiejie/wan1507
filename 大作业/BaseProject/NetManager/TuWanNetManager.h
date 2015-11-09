//
//  TuWanNetManager.h
//  BaseProject
//
//  Created by 王杰 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuWanModel.h"
#import "TuWanPicModel.h"
#import "TuWanVideoModel.h"


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


//下方注释是 VVDocumenter 插件生成的。 安装此插件，在任何需要注释的位置 写///   三个/ 就可以自动弹出注释模板了

/**
 *  获取某种类型的资讯
 *
 *  @param type  资讯类型
 *  @param start 当前资讯起始索引值，最小为0。 eg 0,11,22,33,44...
 *
 *  @return 请求所在任务
 */
+ (id)getTuWanListType:(InfoType)type  start:(NSInteger)start completionHandle:(void(^)(TuWanModel *model, NSError *error))completionHandle;

/**
 *  获取视频类资讯的详情页
 *
 *  @param aid 资讯aid
 *
 *  @return 任务
 */
+ (id)getVideoDetailWithId:(NSString *)aid kCompletionHandle;

/**
 *  获取图片类资讯的详情页
 *
 *  @param aid 资讯aid
 *
 *  @return 任务
 */
+ (id)getPicDetailWithId:(NSString *)aid kCompletionHandle;
@end
