//
//  MusicListViewController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MusicListViewController.h"
#import "XiMaLaYaAlbumViewModel.h"
#import "MusicDetailCell.h"
#import "PlayView.h"
@interface MusicListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)XiMaLaYaAlbumViewModel *ximalayaAlbumVM;

@property (nonatomic,strong)UITableView *tableView;
@end

@implementation MusicListViewController

- (XiMaLaYaAlbumViewModel *)ximalayaAlbumVM {
    if(_ximalayaAlbumVM == nil) {
        _ximalayaAlbumVM = [[XiMaLaYaAlbumViewModel alloc] initWithAlbumId:_albumId];
    }
    return _ximalayaAlbumVM;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[MusicDetailCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView = [UIView new];
        _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
           [self.ximalayaAlbumVM refreshDataCompletionHandle:^(NSError *error) {
               if(error)
               {
                   [self showErrorMsg:error.localizedDescription];
               }
               else
               {
                   [_tableView.mj_footer resetNoMoreData];
                   [_tableView reloadData];
               }
               [_tableView.mj_header endRefreshing];
           }];
        }];
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
           [self.ximalayaAlbumVM getMoreDataCompletionHandle:^(NSError *error) {
               if(error)
               {
                   [self showErrorMsg:error.localizedDescription];
               }
               else
               {
                   [_tableView reloadData];
                   if(self.ximalayaAlbumVM.isHasMore)
                   {
                       [_tableView.mj_footer endRefreshing];
                   }
                   else
                   {
                       [_tableView.mj_footer endRefreshingWithNoMoreData];
                   }
               }
               //[_tableView.mj_footer endRefreshing];
           }];
        }];
       
    }
    return _tableView;
}

-(instancetype)initWithAlbumId:(NSInteger)albumId
{
    if(self = [super init])
    {
        self.albumId = albumId;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
     [self.tableView.mj_header beginRefreshing];
    
    [self.view addSubview:[PlayView sharedInstance]];
    [[PlayView sharedInstance] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
}

#pragma mark -- UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.ximalayaAlbumVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MusicDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.coverIV.imageView setImageWithURL:[self.ximalayaAlbumVM coverURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.titleLb.text = [self.ximalayaAlbumVM titleForRow:indexPath.row];
    cell.timeLb.text = [self.ximalayaAlbumVM timeForRow:indexPath.row];
    cell.sourceLb.text = [self.ximalayaAlbumVM sourceForRow:indexPath.row];
    cell.playCountLb.text = [self.ximalayaAlbumVM playCountForRow:indexPath.row];
    cell.favorCountLb.text = [self.ximalayaAlbumVM favorCountForRow:indexPath.row];
    cell.commentCountLb.text = [self.ximalayaAlbumVM commentCountForRow:indexPath.row];
    cell.durationLb.text = [self.ximalayaAlbumVM durationForRow:indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[PlayView sharedInstance] playWithURL:[self.ximalayaAlbumVM playURLForRow:indexPath.row]];
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
@end
