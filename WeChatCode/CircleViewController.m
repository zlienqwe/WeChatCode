//
//  CircleViewController.m
//  WeChatCode
//
//  Created by Zlien on 9/10/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "CircleViewController.h"

@interface CircleViewController ()

@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"朋友圈";
    CGRect frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];

    [self.view addSubview:self.tableView];
    [self.tableView addSubview:[self createHeaderView]];
    [self.tableView addSubview:[self createBodyView]];
}


-(UILabel *)createHeaderView{
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2)];
    headerLabel.backgroundColor =[UIColor redColor];
    return headerLabel;
}
-(UILabel *)createBodyView{
    UILabel *bodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height/2)];
    bodyLabel.backgroundColor = [UIColor blueColor];
    
    return bodyLabel;
}


@end
