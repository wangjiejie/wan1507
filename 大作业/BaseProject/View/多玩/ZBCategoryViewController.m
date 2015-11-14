//
//  ZBCategoryViewController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBCategoryViewController.h"
#import "ZBCategoryViewModel.h"
#import "ZBCategoryDetailViewController.h"

@interface ZBCategoryViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)ZBCategoryViewModel *zbCategoryVM;
@end

@implementation ZBCategoryViewController



- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.zbCategoryVM getDataFromNetCompleteHandle:^(NSError *error) {
                if(error)
                {
                    [self showErrorMsg:error.localizedDescription];
                }
                else
                {
                    [_tableView reloadData];
                }
                [_tableView.mj_header endRefreshing];
            }];
        }];
    }
    return _tableView;
}

- (ZBCategoryViewModel *)zbCategoryVM {
    if(_zbCategoryVM == nil) {
        _zbCategoryVM = [[ZBCategoryViewModel alloc] init];
    }
    return _zbCategoryVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    self.title = @"装备分类";
    [self.tableView.mj_header beginRefreshing];
}


#pragma mark --  UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.zbCategoryVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.accessoryType = 1;
    cell.textLabel.text = [self.zbCategoryVM titleForRow:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZBCategoryDetailViewController *vc = [[ZBCategoryDetailViewController alloc]initWithTag:[self.zbCategoryVM tagForRow:indexPath.row]];
    vc.title = [self.zbCategoryVM titleForRow:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
