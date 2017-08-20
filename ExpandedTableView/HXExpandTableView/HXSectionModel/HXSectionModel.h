//
//  HXSectionModel.h
//  ExpandedTableView
//
//  Created by Jney on 2017/8/20.
//  Copyright © 2017年 Jney. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HXSectionCellModel : NSObject


/**
 每个分区下面cell的显示标题
 */
@property(strong, nonatomic)NSString *rowTitleString;

/**
 获取假数据
 
 @return 返回每个section下面有多少个cell
 */
+(NSArray *)hx_getSectionCellModels;

@end

@interface HXSectionModel : NSObject
/**
 分区下面可以有很多个cell对应的模型
 */
@property(strong, nonatomic)NSArray<HXSectionCellModel *> *cellModels;

/**
 是否展开
 */
@property(assign, nonatomic)BOOL isExpanded;
/**
 每个分区显示的标题
 */
@property(strong, nonatomic)NSString *sectionTitleString;


/**
 获取假数据

 @return 返回有多少section的一个数组
 */
+(NSArray *)hx_getSectionModels;

@end


