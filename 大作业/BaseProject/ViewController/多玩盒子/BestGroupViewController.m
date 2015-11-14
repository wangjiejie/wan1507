//
//  BestGroupViewController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupViewController.h"
#import "BestGroupCell.h"
#import "BestGroupViewModel.h"
#import "BestGroupDetailViewController.h"

@interface BestGroupViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)BestGroupViewModel *bestGroupVM;

@end

@implementation BestGroupViewController

- (BestGroupViewModel *)bestGroupVM {
    if(_bestGroupVM == nil) {
        _bestGroupVM = [[BestGroupViewModel alloc] init];
    }
    return _bestGroupVM;
}
- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[BestGroupCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView = [UIView new];
        
         _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.bestGroupVM getDataFromNetCompleteHandle:^(NSError *error) {
                if(error)
                {
                    [self showErrorMsg:error.localizedDescription];
                }
                else
                {
                    [_tableView reloadData];
                }
                [_tableView.mj_header endRefreshing];
            } ];
        }];
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    self.title = @"最佳阵容";
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark -- UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"aaaaaaa%ld",self.bestGroupVM.rowNumber);
    return self.bestGroupVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BestGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.bestGroupVM titleForRow:indexPath.row];
    [cell.iconIV1.imageView setImageWithURL:[self.bestGroupVM iconURLArrForRow:indexPath.row][0] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    [cell.iconIV2.imageView setImageWithURL:[self.bestGroupVM iconURLArrForRow:indexPath.row][1] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    [cell.iconIV3.imageView setImageWithURL:[self.bestGroupVM iconURLArrForRow:indexPath.row][2] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    [cell.iconIV4.imageView setImageWithURL:[self.bestGroupVM iconURLArrForRow:indexPath.row][3] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    [cell.iconIV5.imageView setImageWithURL:[self.bestGroupVM iconURLArrForRow:indexPath.row][4] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.descLb.text = [self.bestGroupVM descForRow:indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BestGroupDetailViewController *vc=[[BestGroupDetailViewController alloc] initWithTitle:[self.bestGroupVM titleForRow:indexPath.row] desc:[self.bestGroupVM descForRow:indexPath.row] icons:[self.bestGroupVM iconURLArrForRow:indexPath.row] decs:[self.bestGroupVM descsForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}


@end
