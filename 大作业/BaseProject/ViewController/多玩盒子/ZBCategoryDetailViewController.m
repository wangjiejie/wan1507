//
//  ZBCategoryDetailViewController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBCategoryDetailViewController.h"
#import "ZBItemListViewModel.h"
#import "ZBItemListCell.h"

//总要拼接，做宏
#define kIconPathWithId(id)  [NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%ld_64x64.png", id]

@interface ZBCategoryDetailViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)ZBItemListViewModel *itemListVM;
@end

@implementation ZBCategoryDetailViewController
-(instancetype)initWithTag:(NSString *)tag
{
    if(self = [super init])
    {
        self.tag = tag;
    }
    return self;
}
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
            [self.itemListVM getDataFromNetCompleteHandle:^(NSError *error) {
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

- (ZBItemListViewModel *)itemListVM {
    if(_itemListVM == nil) {
        _itemListVM = [[ZBItemListViewModel alloc] initWithTag:_tag];
    }
    return _itemListVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    [self.collectionView.mj_header beginRefreshing];
    

}

#pragma mark <UICollectionViewDataSource>



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.itemListVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZBItemListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconIV.imageView setImageWithURL:[NSURL URLWithString:kIconPathWithId([self.itemListVM IDForRow:indexPath.row]) ] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.titleLb.text = [self.itemListVM titleForRow:indexPath.row];
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




@end
