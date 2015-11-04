//
//  TuWanModel.h
//  BaseProject
//
//  Created by 王杰 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"


@class TuWanDataModel,TuWanDataIndexpicModel,TuWanDataIndexpicInfochildModel,TuWanDataIndexpicShowitemModel,TuWanDataIndexpicShowitemInfoModel,TuWanDataListModel,TuWanDataListInfochildModel,TuWanDataListShowitemModel,TuWanDataListShowitemInfoModel;

@interface TuWanModel : BaseModel


@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) TuWanDataModel *data;

@property (nonatomic, copy) NSString *code;


@end


@interface TuWanDataModel : NSObject

@property (nonatomic, strong) NSArray<TuWanDataIndexpicModel *> *indexpic;

@property (nonatomic, strong) NSArray<TuWanDataListModel *> *list;

@end

@interface TuWanDataIndexpicModel : NSObject

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *showtype;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *longtitle;

@property (nonatomic, copy) NSString *typeName;

@property (nonatomic, copy) NSString *html5;

@property (nonatomic, copy) NSString *toutiao;

@property (nonatomic, strong) TuWanDataIndexpicInfochildModel *infochild;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, assign) NSInteger pictotal;

@property (nonatomic, strong) NSArray<TuWanDataIndexpicShowitemModel *> *showitem;

@property (nonatomic, copy) NSString *pubdate;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *murl;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, copy) NSString *zangs;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *timer;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *desc;

@end

@interface TuWanDataIndexpicInfochildModel : NSObject

@property (nonatomic, copy) NSString *later;

@property (nonatomic, copy) NSString *cn;

@property (nonatomic, copy) NSString *facial;

@property (nonatomic, copy) NSString *feature;

@property (nonatomic, copy) NSString *role;

@property (nonatomic, copy) NSString *shoot;

@end

@interface TuWanDataIndexpicShowitemModel : NSObject

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) TuWanDataIndexpicShowitemInfoModel *info;

@end

@interface TuWanDataIndexpicShowitemInfoModel : NSObject

@property (nonatomic, copy) NSString *width;

@property (nonatomic, assign) NSInteger height;

@end

@interface TuWanDataListModel : NSObject

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *showtype;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *longtitle;

@property (nonatomic, copy) NSString *typeName;

@property (nonatomic, copy) NSString *html5;

@property (nonatomic, copy) NSString *toutiao;

@property (nonatomic, strong) TuWanDataListInfochildModel *infochild;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, assign) NSInteger pictotal;

@property (nonatomic, strong) NSArray<TuWanDataListShowitemModel *> *showitem;

@property (nonatomic, copy) NSString *pubdate;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *murl;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, copy) NSString *zangs;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *timer;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *desc;

@end

@interface TuWanDataListInfochildModel : NSObject

@property (nonatomic, copy) NSString *later;

@property (nonatomic, copy) NSString *cn;

@property (nonatomic, copy) NSString *facial;

@property (nonatomic, copy) NSString *feature;

@property (nonatomic, copy) NSString *role;

@property (nonatomic, copy) NSString *shoot;

@end

@interface TuWanDataListShowitemModel : NSObject

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) TuWanDataListShowitemInfoModel *info;

@end

@interface TuWanDataListShowitemInfoModel : NSObject

@property (nonatomic, copy) NSString *width;

@property (nonatomic, assign) NSInteger height;

@end

