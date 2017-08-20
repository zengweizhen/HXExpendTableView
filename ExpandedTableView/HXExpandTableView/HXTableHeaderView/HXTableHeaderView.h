//
//  HXTableHeaderView.h
//  ExpandedTableView
//
//  Created by Jney on 2017/8/20.
//  Copyright © 2017年 Jney. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HXSectionModel;

typedef void(^SectionClickBlock)(void);

@interface HXTableHeaderView : UITableViewHeaderFooterView
/**
 每一个分区对应一个sectionModel
 */
@property(strong, nonatomic)HXSectionModel *sectionModel;
/**
 点击section的回调,用来刷新tableView
 */
@property(copy, nonatomic)SectionClickBlock sectionClickBlacok;

@end
