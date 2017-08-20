//
//  ViewController.m
//  ExpandedTableView
//
//  Created by Jney on 2017/8/20.
//  Copyright © 2017年 Jney. All rights reserved.
//

#import "ViewController.h"
#import "HXExpandViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)nextViewController:(UIButton *)sender {
    
    [self.navigationController pushViewController:[HXExpandViewController new] animated:YES];
}




@end
