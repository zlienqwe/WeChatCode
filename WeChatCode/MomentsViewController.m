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
static NSString *cellIdentifier = @"cell";
@interface MomentsViewController()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *feedArray;
@property (nonatomic, strong) NSMutableArray *frameArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MomentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar];
    [self createTableView];
    [self loadingHeaderView];
    [self loadingMomentsFeed];
    self.title = @"朋友圈";
}

- (void)setNavigationBar {
    UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:nil];
    self.navigationItem.rightBarButtonItem = cameraButton;
}

- (void) loadingHeaderView {
    [MomentsAPI requestHeaderViewInfo:^(User *user) {
        HeaderView *headerView = [[HeaderView alloc] initWithUser:user frame:CGRectMake(0, 0, self.view.frame.size.width, 220)];
        self.tableView.tableHeaderView = headerView;
    } failure:^{
        NSLog(@"headerView connect error %s", __func__);
    }];
}

- (void)loadingMomentsFeed {
    self.feedArray = [[NSMutableArray alloc] init];
    [MomentsAPI requestFeeds:^(NSArray *responseObject) {
        for (NSDictionary *dic in responseObject) {
            Feed *feed = [[Feed alloc] initWithDic:dic];
            [self.feedArray addObject:feed];
            _frameArray = [FeedFrame frameModelWithArray:_feedArray];
        }
        [self.tableView reloadData];
    } failure:^{
        NSLog(@"content connect error %s", __func__);
    }];
}

- (void)createTableView {
    CGRect frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 60);
    self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate=self;
    self.tableView.tableFooterView = [[UIView alloc] init];
}


#pragma mark - table view delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.feedArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MomentsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        cell = [[MomentsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        [cell createUIComponent:self.feedArray[indexPath.row]];
        cell.feedFrame = [_frameArray objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FeedFrame *fee = _frameArray[indexPath.row];
    return fee.cellHeight;
}

@end
