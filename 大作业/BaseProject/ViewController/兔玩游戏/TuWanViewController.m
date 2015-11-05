//
//  TuWanViewController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewController.h"
#import "TuWanViewModel.h"


@interface TuWanViewController ()
@property (nonatomic,strong)TuWanViewModel *tuWanVM;
@end

@implementation TuWanViewController
-(TuWanViewModel *)tuWanVM
{
    if(!_tuWanVM)
    {
        _tuWanVM = [[TuWanViewModel alloc]initWithType:TuWanTypeCos];
    }
    return _tuWanVM;
}
+(UINavigationController *)standardTuWanNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        TuWanViewController *vc = [TuWanViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenSeaColor];
    self.title = @"兔玩";
    
    [Factory addMenuItemToVC:self];
    [self.tuWanVM refreshDataCompletionHandle:^(NSError *error) {
        DDLogVerbose(@"");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
