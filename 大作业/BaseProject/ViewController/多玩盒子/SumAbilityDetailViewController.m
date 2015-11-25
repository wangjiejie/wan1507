//
//  SumAbilityDetailViewController.m
//  BaseProject
//
//  Created by 王杰 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SumAbilityDetailViewController.h"
#import "SumAbilityHeaderView.h"
//总要拼接，做宏
#define kIconPathWithId(id)  [NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%@.png", id]
@interface SumAbilityDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;


@end

@implementation SumAbilityDetailViewController

-(id)initWithModelDic:(NSDictionary *)dic
{
    if(self = [super init])
    {
        self.modelDic = dic;
    }
    return self;
}
- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    SumAbilityHeaderView *headerView = [[SumAbilityHeaderView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 76)];
  
    [headerView.iconIV.imageView setImageWithURL:[NSURL URLWithString:kIconPathWithId(self.modelDic[@"ID"])] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    headerView.nameLb.text = self.modelDic[@"name"];
    headerView.levelLb.text = [NSString stringWithFormat:@"需要等级 %@",self.modelDic[@"level"]];
    headerView.cooldownLb.text = [NSString stringWithFormat:@"冷却时间 %@",self.modelDic[@"cooldown"]];
      self.tableView.tableHeaderView = headerView;
    
    [Factory addShareItemToVC:self url:nil];
}

#pragma mark --  UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    switch (indexPath.section) {
        case 0:
            
            cell.textLabel.text = self.modelDic[@"des"];
            cell.textLabel.numberOfLines = 0;
            break;
            
        case 1:
            cell.textLabel.text = self.modelDic[@"strong"];
              cell.textLabel.numberOfLines = 0;
            break;
        case 2:
            cell.textLabel.text = self.modelDic[@"tips"];
              cell.textLabel.numberOfLines = 0;
            break;
        default:
            break;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @[@"描述", @"天赋",@"提示"][section];
}

@end
