//
//  DuoWanBaiKeViewController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanBaiKeViewController.h"
#import "DuoWanToolMenuViewModel.h"
#import "TuWanImageView.h"
#import "TuWanHtml5ViewController.h"
#import "BestGroupViewController.h"
#import "ZBCategoryViewController.h"
#import "SumAbilityViewController.h"

@interface ToolMenuCell : UITableViewCell
/** 左侧图片 */
@property (nonatomic,strong)TuWanImageView *iconIV;

/** 题目标签 */
@property (nonatomic,strong)UILabel *titleLb;

@end

@implementation ToolMenuCell

- (TuWanImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TuWanImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(36, 36));
            
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.centerY.mas_equalTo(self.iconIV);
            make.right.mas_equalTo(-10);
        }];
    }
    return _titleLb;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    return self;
}


@end

@interface DuoWanBaiKeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)DuoWanToolMenuViewModel *toolMenuVM;
@end

@implementation DuoWanBaiKeViewController

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[ToolMenuCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView = [UIView new];
       _tableView.rowHeight = 52;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.toolMenuVM getDataFromNetCompleteHandle:^(NSError *error) {
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

- (DuoWanToolMenuViewModel *)toolMenuVM {
    if(_toolMenuVM == nil) {
        _toolMenuVM = [[DuoWanToolMenuViewModel alloc] init];
    }
    return _toolMenuVM;
}
-(instancetype)init
{
    if (self = [super init]) {
        self.title = @"游戏百科";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    [self.tableView.mj_header beginRefreshing];
    
}

#pragma mark --  UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.toolMenuVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ToolMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.iconIV.imageView setImageWithURL:[self.toolMenuVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.titleLb.text = [self.toolMenuVM titleForRow:indexPath.row];
    return cell;
}

kRemoveCellSeparator

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if([self.toolMenuVM itemTypeForRow:indexPath.row] == ToolMenuItemTypeWeb)
    {
        TuWanHtml5ViewController *vc = [[TuWanHtml5ViewController alloc]initWithURL:[self.toolMenuVM webURLForRow:indexPath.row]];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if([[self.toolMenuVM tagForRow:indexPath.row] isEqualToString:@"best_group"])
    {
        BestGroupViewController *vc = [BestGroupViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if([[self.toolMenuVM tagForRow:indexPath.row] isEqualToString:@"item"])
    {
        ZBCategoryViewController *vc = [ZBCategoryViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if([[self.toolMenuVM tagForRow:indexPath.row] isEqualToString:@"sum_ability"])
    {
        SumAbilityViewController *vc = [SumAbilityViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
        
}


@end
