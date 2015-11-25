//
//  HeroListViewController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroListViewController.h"
#import "HeroViewModel.h"
#import "HerosAllCell.h"
#import "HerosFreeCell.h"
//总要拼接，做宏
#define kIconPathWithEnName(enName)  [NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", enName]

@interface HeroListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)HeroViewModel *heroVM;
@property (nonatomic,strong)UICollectionView *collectionView;

@end

@implementation HeroListViewController

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
        [_collectionView registerClass:[HerosAllCell class] forCellWithReuseIdentifier:@"AllCell"];
        [_collectionView registerClass:[HerosFreeCell class] forCellWithReuseIdentifier:@"FreeCell"];
        _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.heroVM getDataFromNetCompleteHandle:^(NSError *error) {
                [_collectionView reloadData];
                [_collectionView.mj_header endRefreshing];
            }];
        }];
        
    }
    return _collectionView;
}
- (HeroViewModel *)heroVM {
    if(_heroVM == nil) {
        _heroVM = [[HeroViewModel alloc] initWithType:_heroType.integerValue];
    }
    return _heroVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView.mj_header beginRefreshing];
   
}
#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.heroVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(_heroType.integerValue == 0)
    {
        HerosFreeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FreeCell" forIndexPath:indexPath];
        [cell.iconIV.imageView setImageWithURL:[NSURL URLWithString:kIconPathWithEnName([self.heroVM enNameForRow:indexPath.row]) ] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        cell.titleLb.text = [self.heroVM titleForRow:indexPath.row];
        cell.cnNameLb.text = [self.heroVM cnNameForRow:indexPath.row];
        cell.locationLb.text = [self.heroVM locationForRow:indexPath.row];
        return cell;
    }
    HerosAllCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AllCell" forIndexPath:indexPath];
    [cell.iconIV.imageView setImageWithURL:[NSURL URLWithString:kIconPathWithEnName([self.heroVM enNameForRow:indexPath.row]) ] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.titleLb.text = [self.heroVM titleForRow:indexPath.row];
    return cell;
    
}

//四周边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
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
    if(_heroType.integerValue == 0)
    {
        return CGSizeMake((kWindowW-15)/2, 60);
    }
    return CGSizeMake((kWindowW-25)/4, 95);
}




@end
