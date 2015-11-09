//
//  TuWanNetManager.m
//  BaseProject
//
//  Created by 王杰 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanNetManager.h"


#define kPath  @"http://cache.tuwan.com/app/"
#define kAppId @"appid":@1
#define kAppVer @"appver":@2.1
#define kTuWanPath      @"http://cache.tuwan.com/app/"
#define kTuWanDetailPath     @"http://api.tuwan.com/app/"

@implementation TuWanNetManager

+(id)getTuWanListType:(InfoType)infoType start:(NSInteger)start completionHandle:(void (^)(TuWanModel *, NSError *))completionHandle
{
    //把所有接口共有的参数放到switch外面
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kAppVer, kAppId, @"start": @(start)}];
    
    switch (infoType) {
        case TuWanTypeTouTiao:
            [params setObject:@"indexpic" forKey:@"classmore"];
            break;
        case TuWanTypeDuJia:
            [params setObject:@"heronews" forKey:@"class"];
            [params setObject:@"八卦" forKey:@"mod"];
            break;
        case TuWanTypeAnHei3:
            [params setObject:@"indexpic" forKey:@"classmore"];
            [params setObject:@"83623" forKey:@"dtid"];
            break;
        case TuWanTypeMoShou:
            [params setObject:@"indexpic" forKey:@"classmore"];
            [params setObject:@"31537" forKey:@"dtid"];
            break;
        case TuWanTypeFengBao:
            [params setObject:@"indexpic" forKey:@"classmore"];
            [params setObject:@"31538" forKey:@"dtid"];
            break;
        case TuWanTypeLuShi:
            [params setObject:@"indexpic" forKey:@"classmore"];
            [params setObject:@"31528" forKey:@"dtid"];
            break;
        case TuWanTypeXingJi2:
            [params setObject:@"91821" forKey:@"dtid"];
            break;
        case TuWanTypeShouWang:
            [params setObject:@"57067" forKey:@"dtid"];
            break;
        case TuWanTypeTuPian:
            [params setObject:@"pic" forKey:@"type"];
            [params setObject:@"83623,31528,31537,31538,57067,91821" forKey:@"dtid"];
            break;
        case TuWanTypeShiPing:
            [params setObject:@"video" forKey:@"type"];
            [params setObject:@"83623,31528,31537,31538,57067,91821" forKey:@"dtid"];
            break;
        case TuWanTypeGongLue:
            [params setObject:@"guide" forKey:@"type"];
            [params setObject:@"83623,31528,31537,31538,57067,91821" forKey:@"dtid"];
            break;
        case TuWanTypeHuanHua:
            [params setObject:@"幻化" forKey:@"mod"];
            [params setObject:@"heronews" forKey:@"class"];
            break;
        case TuWanTypeQuWen:
            [params setObject:@"0" forKey:@"dtid"];
            [params setObject:@"heronews" forKey:@"class"];
            [params setObject:@"趣闻" forKey:@"mod"];
            [params setObject:@"indexpic" forKey:@"classmore"];
            break;
        case TuWanTypeCos:
            [params setObject:@"0" forKey:@"dtid"];
            [params setObject:@"cos" forKey:@"class"];
            [params setObject:@"cos" forKey:@"mod"];
            [params setObject:@"indexpic" forKey:@"classmore"];
            break;
        case TuWanTypeMeiNv:
            [params setObject:@"cos1" forKey:@"typechild"];
            [params setObject:@"heronews" forKey:@"class"];
            [params setObject:@"美女" forKey:@"mod"];
            [params setObject:@"indexpic" forKey:@"classmore"];
            break;
        default:
            break;
    }
    //因为兔玩服务器的要求，传入参数不能为中文，需要转化为%号形式
    NSString *path = [self percentPathWithPath:kPath params:params];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TuWanModel mj_objectWithKeyValues:responseObj], error);
    }];
}


+ (id)getVideoDetailWithId:(NSString *)aid kCompletionHandle{
    return [self GET:[self percentPathWithPath:kTuWanDetailPath params:@{kAppId, @"aid": aid}] parameters:nil completionHandler:^(id responseObj, NSError *error) {
        //这里一定要用firstObj方法来取，不能用[0]。 如果数组为空  第一种不会崩溃，值为nil。  第二种会数组越界
        completionHandle([TuWanVideoModel mj_objectArrayWithKeyValuesArray:responseObj].firstObject, error);
    }];
}

+ (id)getPicDetailWithId:(NSString *)aid kCompletionHandle{
    return [self GET:[self percentPathWithPath:kTuWanDetailPath params:@{kAppId, @"aid": aid}] parameters:nil completionHandler:^(id responseObj, NSError *error) {
        //这里一定要用firstObj方法来取，不能用[0]。 如果数组为空  第一种不会崩溃，值为nil。  第二种会数组越界
        completionHandle([TuWanPicModel mj_objectArrayWithKeyValuesArray:responseObj].firstObject, error);
    }];
}
@end
