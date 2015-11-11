//
//  XiMaLaYaAlbumViewModel.h
//  BaseProject
//
//  Created by 王杰 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiMaLaYaNetManager.h"

@interface XiMaLaYaAlbumViewModel : BaseViewModel

/**  专门的初始化方法 */
-(instancetype)initWithAlbumId:(NSInteger)albumId NS_DESIGNATED_INITIALIZER;

@property (nonatomic)NSInteger albumId;

/**  当前行数 */
@property (nonatomic)NSInteger rowNumber;

/**  当前请求页数 */
@property (nonatomic)NSInteger pageId;

/**  最大页数 */
@property (nonatomic)NSInteger maxPageId;

/**  是否更多页 */
@property (nonatomic,getter=isHasMore)BOOL hasMore;


/**  获取某行的封面图片URL */
-(NSURL *)coverURLForRow:(NSInteger)row;


/**  获取某行的题目 */
-(NSString *)titleForRow:(NSInteger)row;

/**  获取某行的时间 */
-(NSString *)timeForRow:(NSInteger)row;


/**  获取某行的出处 */
-(NSString *)sourceForRow:(NSInteger)row;

/**  获取某行的播放数 */
-(NSString *)playCountForRow:(NSInteger)row;


/**  获取某行的喜欢数 */
-(NSString *)favorCountForRow:(NSInteger)row;

/**  获取某行的评论数 */
-(NSString *)commentCountForRow:(NSInteger)row;

/**  获取某行的播放时长 */
-(NSString *)durationForRow:(NSInteger)row;

/**  获取某行的下载链接地址 */
-(NSURL *)downloadURLForRow:(NSInteger)row;

/**  获取某行的音频播放地址 */
-(NSURL *)playURLForRow:(NSInteger)row;

@end
