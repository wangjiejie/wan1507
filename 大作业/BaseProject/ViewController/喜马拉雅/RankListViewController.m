//
//  RankListViewController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RankListViewController.h"
#import "XiMaLaYaCategoryCell.h"
#import "XiMaLaYaCategoryViewModel.h"

@interface RankListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)XiMaLaYaCategoryViewModel *ximalayaCategoryVM;
@end

@implementation RankListViewController

- (XiMaLaYaCategoryViewModel *)ximalayaCategoryVM {
    if(_ximalayaCategoryVM == nil) {
        _ximalayaCategoryVM = [[XiMaLaYaCategoryViewModel alloc] init];
    }
    return _ximalayaCategoryVM;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 170/2;
        _tableView.estimatedRowHeight = 170/2;
        [_tableView registerClass:[XiMaLaYaCategoryCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

+(UINavigationController *)defaultNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        RankListViewController *vc = [RankListViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.title = @"音乐TOP50";
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.ximalayaCategoryVM refreshDataCompletionHandle:^(NSError *error) {
            if(error)
            {
                [self showErrorMsg:error];
            }
            else
            {
                [self.tableView reloadData];
            }
            [self.tableView.mj_footer resetNoMoreData];
            [self.tableView.mj_header endRefreshing];
        }];
    }];
   
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
       [self.ximalayaCategoryVM getMoreDataCompletionHandle:^(NSError *error) {
           if(error)
           {
               [self showErrorMsg:error.localizedDescription];
               if(error.code == 999)
               {
                   [self.tableView.mj_footer endRefreshingWithNoMoreData];
               }
               else
               {
                   [self.tableView.mj_footer endRefreshing];
               }
           }
           else
           {
               [self.tableView reloadData];
           }
           [self.tableView.mj_footer endRefreshing];

       }];
    }];
    
}


#pragma mark --  UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.ximalayaCategoryVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XiMaLaYaCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.ximalayaCategoryVM titleForRow:indexPath.row];
    cell.descLb.text = [self.ximalayaCategoryVM descForRow:indexPath.row];
    cell.numberLb.text = [self.ximalayaCategoryVM numberForRow:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.ximalayaCategoryVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.orderLb.text = @(indexPath.row + 1).stringValue;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
