//
//  HXExpandViewController.m
//  ExpandedTableView
//
//  Created by Jney on 2017/8/20.
//  Copyright © 2017年 Jney. All rights reserved.
//

#import "HXExpandViewController.h"
#import "HXTableHeaderView.h"
#import "HXSectionModel.h"

@interface HXExpandViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic)UITableView *tableView;
@property(strong, nonatomic)NSArray<HXSectionModel*> *sectionModels;

@end

@implementation HXExpandViewController

- (NSArray *)sectionModels{
    if (!_sectionModels) {
        _sectionModels = [HXSectionModel hx_getSectionModels];
    }
    return _sectionModels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ///初始化tableView
    [self hx_createTableView];
    
    
}
/**
 初始化tableView
 */
- (void)hx_createTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor yellowColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HXExpandViewControllerCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}

#pragma mark - tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.sectionModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    
    return self.sectionModels[section].isExpanded ? self.sectionModels[section].cellModels.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HXExpandViewControllerCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HXExpandViewControllerCell"];
    }
    
    cell.textLabel.text = self.sectionModels[indexPath.section].cellModels[indexPath.row].rowTitleString;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    HXTableHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HXTableHeaderView"];
    if (!headerView) {
        headerView = [[HXTableHeaderView alloc] initWithReuseIdentifier:@"HXTableHeaderView"];
    }
    
    headerView.sectionModel = self.sectionModels[section];
    ///刷新页面回调
    headerView.sectionClickBlacok = ^{
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:section]
                 withRowAnimation:UITableViewRowAnimationFade];
    };
    return headerView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
}

@end
