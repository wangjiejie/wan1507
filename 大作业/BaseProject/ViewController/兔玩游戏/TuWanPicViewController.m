//
//  TuWanPicViewController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanPicViewController.h"
#import "TuWanPicViewModel.h"

@interface TuWanPicViewController ()<MWPhotoBrowserDelegate>
@property (nonatomic,strong)TuWanPicViewModel *tuWanPicVM;
@end

@implementation TuWanPicViewController

- (TuWanPicViewModel *)tuWanPicVM {
    if(_tuWanPicVM == nil) {
        _tuWanPicVM = [[TuWanPicViewModel alloc] initWithAid:_aid];
    }
    return _tuWanPicVM;
}

-(id)initWithAid:(NSString * )aid
{
    if(self = [super init])
    {
        self.aid = aid;
    }
    return self;
}

/** 预防新编程 防止没有使用 initWithType 方法*/
-(instancetype)init
{
    if(self = [super init])
    {
        NSAssert(NO,@"%s 必须使用initWithType初始化方法", __func__);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =  [UIColor whiteColor];
    [Factory addBackItemToVC:self];
    [self showProgress];
    
    [self.tuWanPicVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self hideProgress];
        MWPhotoBrowser *photoB = [[MWPhotoBrowser alloc]initWithDelegate:self];
        //[self.navigationController pushViewController:photoB animated:YES];
        NSMutableArray *naviVCs = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
        [naviVCs removeLastObject];
        [naviVCs addObject:photoB];
        self.navigationController.viewControllers = naviVCs;
            }];
}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser
{
    return self.tuWanPicVM.rowNumber;
}
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index
{
    MWPhoto *photo = [MWPhoto photoWithURL:[self.tuWanPicVM picURLForRow:index]];
    return photo;
}


@end
