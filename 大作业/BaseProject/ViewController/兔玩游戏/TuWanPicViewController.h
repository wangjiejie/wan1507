//
//  TuWanPicViewController.h
//  BaseProject
//
//  Created by 王杰 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanPicViewController : UIViewController

/** 此界面内容是根据aid来决定的 ， aid必须传的  */
-(id _Nonnull)initWithAid:(NSString * _Nonnull)aid;

/** aid的赋值应该是非空的 */
@property (nonatomic,strong) NSString * _Nonnull aid;


@end
