//
//  SumAbilityViewController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SumAbilityViewController.h"
#import "SumAbilityViewModel.h"
#import "ZBItemListCell.h"
#import "SumAbilityDetailViewController.h"

//总要拼接，做宏
#define kIconPathWithId(id)  [NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%@.png", id]

@interface SumAbilityViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionView *collectionView;

@property (nonatomic,strong)SumAbilityViewModel *sumAbilityVM;
@end

@implementation SumAbilityViewController


- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH) collectionViewLayout:layout];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.sumAbilityVM getDataFromNetCompleteHandle:^(NSError *error) {
                if(error)
                {
                    [self showErrorMsg:error.localizedDescription];
                }
                else
                {
                    [_collectionView reloadData];
                }
                [_collectionView.mj_header endRefreshing];
                
            }];
            [_collectionView registerClass:[ZBItemListCell class] forCellWithReuseIdentifier:@"Cell"];
        }];
    }
    return _collectionView;

}

- (SumAbilityViewModel *)sumAbilityVM {
    if(_sumAbilityVM == nil) {
        _sumAbilityVM = [[SumAbilityViewModel alloc] init];
    }
    return _sumAbilityVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    self.title = @"召唤师技能";
    [self.collectionView.mj_header beginRefreshing];
}


#pragma mark --  UITableViewDelegate
#pragma mark <UICollectionViewDataSource>



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.sumAbilityVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZBItemListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconIV.imageView setImageWithURL:[NSURL URLWithString:kIconPathWithId([self.sumAbilityVM IDForRow:indexPath.row]) ] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.titleLb.text = [self.sumAbilityVM titleForRow:indexPath.row];
    return cell;
}

//四周边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//行间距

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
//列间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
//每个cell的大小

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(70, 95);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = @{@"ID":[self.sumAbilityVM IDForRow:indexPath.row],
                          @"name":[self.sumAbilityVM titleForRow:indexPath.row],
                          @"level":[self.sumAbilityVM levelForRow:indexPath.row],
                          @"cooldown":[self.sumAbilityVM cooldownForRow:indexPath.row],
                          @"des":[self.sumAbilityVM desForRow:indexPath.row],
                          @"strong":[self.sumAbilityVM strongForRow:indexPath.row],
                          @"tips":[self.sumAbilityVM tipsForRow:indexPath.row],
                          };
    SumAbilityDetailViewController *vc = [[SumAbilityDetailViewController alloc]initWithModelDic:dic];
    vc.title = [self.sumAbilityVM titleForRow:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
