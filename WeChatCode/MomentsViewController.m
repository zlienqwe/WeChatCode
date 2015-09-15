//
//  CircleViewController.m
//  WeChatCode
//
//  Created by Zlien on 9/10/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "MomentsViewController.h"
#import "Feed.h"
#import "MomentsTableViewCell.h"
#import "MomentsAPI.h"
#import "HeaderView.h"
#import "UIImageView+WebCache.h"

@interface MomentsViewController()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) NSMutableArray *feedArray;
@property(nonatomic, strong) UITableView *tableView;

@end

@implementation MomentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar];
    [self createHeaderView];
    [self loadingMomentsFeed];
    self.title = @"朋友圈";
    [self createTableView];
}

- (void)createTableView {
    CGRect frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate=self;
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)setNavigationBar {
    UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:nil];
    self.navigationItem.rightBarButtonItem = cameraButton;
}

- (void)loadingMomentsFeed {
    self.feedArray = [[NSMutableArray alloc] init];
    [MomentsAPI requestFeeds:^(NSArray *responseObject) {
        for (NSDictionary *dic in responseObject) {
            Feed *feed = [[Feed alloc] initWithDic:dic];
            [self.feedArray addObject:feed];
        }
        [self.tableView reloadData];
    } failure:^{
        NSLog(@"content connect error");
    }];
}

- (void)createHeaderView {
    [MomentsAPI requestHeaderViewInfo:^(User *user) {
        HeaderView *headerView = [[HeaderView alloc] initWithUser:user frame:CGRectZero];
        self.tableView.tableHeaderView = headerView;
    } failure:^{
        NSLog(@"headerView connect error");
    }];
}


#pragma mark - table view delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.feedArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"cell";
    MomentsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[MomentsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        [cell createUIComponent:self.feedArray[indexPath.row]];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

@end
