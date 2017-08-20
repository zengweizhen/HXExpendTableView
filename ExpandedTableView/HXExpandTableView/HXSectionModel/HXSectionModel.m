//
//  HXSectionModel.m
//  ExpandedTableView
//
//  Created by Jney on 2017/8/20.
//  Copyright © 2017年 Jney. All rights reserved.
//

#import "HXSectionModel.h"

@implementation HXSectionCellModel

+(NSArray *)hx_getSectionCellModels{
    
    NSMutableArray *rows = [NSMutableArray array];
    //这里假设每个分区里面有20个cell
    for (NSInteger i = 0; i < 20; i++) {
        HXSectionCellModel *model = [[HXSectionCellModel alloc] init];
        model.rowTitleString = [NSString stringWithFormat:@"这里是第%ld个cell",(long)i];
        [rows addObject:model];
        
    }
    return rows;
    
}

@end


@implementation HXSectionModel

+(NSArray *)hx_getSectionModels{
    
    NSMutableArray *sections = [NSMutableArray array];
    //这里假设有20个section
    for (NSInteger i = 0; i < 20; i++) {
        HXSectionModel *model = [[HXSectionModel alloc] init];
        ///默认i=5和i=2位展开状态
        model.isExpanded = (i != 2 && i != 5) ? NO : YES;
        model.sectionTitleString = [NSString stringWithFormat:@"这里是第%ld个分区",(long)i];
        model.cellModels = [HXSectionCellModel hx_getSectionCellModels];
        [sections addObject:model];
    }
    return sections;
}

@end


