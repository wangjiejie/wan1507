//
//  TuWanListViewController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanListViewController.h"
#import "TuWanListCell.h"
#import "TuWanViewModel.h"
#import "TuWanImageCell.h"

@interface TuWanListViewController ()
@property (nonatomic,strong)TuWanViewModel *tuWanVM;
@end

@implementation TuWanListViewController

- (TuWanViewModel *)tuWanVM {
    if(_tuWanVM == nil) {
        _tuWanVM = [[TuWanViewModel alloc] initWithType:_infoType.integerValue];
    }
    return _tuWanVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TuWanListCell class] forCellReuseIdentifier:@"ListCell"];
    [self.tableView registerClass:[TuWanImageCell class] forCellReuseIdentifier:@"ImageCell"];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.tuWanVM refreshDataCompletionHandle:^(NSError *error) {
           [self.tableView.header endRefreshing];
           [self.tableView reloadData];
       }];
    }];
    [self.tableView.header beginRefreshing];
    
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
       [self.tuWanVM getMoreDataCompletionHandle:^(NSError *error) {
           [self.tableView.footer endRefreshing];
           [self.tableView reloadData];
       }];
    }];
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tuWanVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if([self.tuWanVM containImages:indexPath.row])
    {
        TuWanImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
        cell.titleLb.text = [self.tuWanVM titleForRowInList:indexPath.row];
        cell.clicksNumLb.text = [self.tuWanVM clickForRowInList:indexPath.row];
        [cell.iconIV0 setImageWithURL:[self.tuWanVM iconURLSForRowInList:indexPath.row][0] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
        [cell.iconIV1 setImageWithURL:[self.tuWanVM iconURLSForRowInList:indexPath.row][1] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
        [cell.iconIV2 setImageWithURL:[self.tuWanVM iconURLSForRowInList:indexPath.row][2] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
        return cell;
    }
    TuWanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    [cell.iconIV setImageWithURL:[self.tuWanVM iconURLForRowInList:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
    cell.titleLb.text = [self.tuWanVM titleForRowInList:indexPath.row];
    cell.longTitleLb.text = [self.tuWanVM descForRowInList:indexPath.row];
    cell.clicksNumLb.text = [self.tuWanVM clickForRowInList:indexPath.row];
    
    return cell;
}

/** 去掉分割线左侧的缝隙 */
kRemoveCellSeparator

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.tuWanVM containImages:indexPath.row])
    {
        return 135;
    }
    return 90;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
