//
//  HXTableHeaderView.m
//  ExpandedTableView
//
//  Created by Jney on 2017/8/20.
//  Copyright © 2017年 Jney. All rights reserved.
//

#import "HXTableHeaderView.h"
#import "HXSectionModel.h"

static CGFloat HXTableHeaderViewHeight = 44;


@interface HXTableHeaderView ()

@property(strong, nonatomic)UIImageView *iconImageView;
@property(strong, nonatomic)UILabel     *titleLabel;

@end

@implementation HXTableHeaderView
@synthesize iconImageView, titleLabel;

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        ///section图标
        iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, (HXTableHeaderViewHeight - 15)/2.0, 10, 15)];
        iconImageView.image = [UIImage imageNamed:@"arrow"];
        //iconImageView.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:iconImageView];
        
        ///section标题
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(iconImageView.frame.size.width + iconImageView.frame.origin.x + 15, 0, width - (iconImageView.frame.size.width + self.frame.origin.x + 20), HXTableHeaderViewHeight)];
        //titleLabel.backgroundColor = [UIColor redColor];
        titleLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:titleLabel];
        
        ///分区下面的线条
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, HXTableHeaderViewHeight - 0.5, width, 0.5)];
        lineLabel.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:lineLabel];
        
        
        ///在header上面放一个按钮 用于展开或者收起
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width, HXTableHeaderViewHeight)];
        [button addTarget:self action:@selector(onExpand:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        
        
    }
    return self;
}

-(void)setSectionModel:(HXSectionModel *)sectionModel{
    
    _sectionModel = sectionModel;
    if (sectionModel.isExpanded) {
        NSLog(@"展开");
        self.iconImageView.transform = CGAffineTransformMakeRotation(M_PI/2.0);
        
    }else{
        NSLog(@"收起");
        self.iconImageView.transform = CGAffineTransformIdentity;
        
    }
    titleLabel.text = sectionModel.sectionTitleString;
}

-(void)onExpand:(UIButton *)btn{
    
    self.sectionModel.isExpanded = !self.sectionModel.isExpanded;
    [UIView animateWithDuration:0.3 animations:^{
        if (self.sectionModel.isExpanded) {
            self.iconImageView.transform = CGAffineTransformMakeRotation(M_PI/2.0);

        } else {
            self.iconImageView.transform = CGAffineTransformIdentity;
        }
    }];
    if (self.sectionClickBlacok) {
        self.sectionClickBlacok();
    }
}

@end
