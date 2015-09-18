//
//  CircleViewController.m
//  WeChatCode
//
//  Created by Zlien on 9/10/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "MomentsViewController.h"
#import "MomentsViewModel.h"
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
@property (nonatomic, strong) MomentsViewModel *momentViewModel;

@end

@implementation MomentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar];
    [self createTableView];
    [self createHeaderView];
    [self createMomentsFeed];
    self.title = @"朋友圈";
}

-(instancetype)init{
    if ([super init]) {
        self.momentViewModel = [[MomentsViewModel alloc] init];
        self.frameArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)setNavigationBar {
    UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:nil];
    self.navigationItem.rightBarButtonItem = cameraButton;
}

- (void)createTableView {
    CGRect frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 60);
    self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate=self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:self.tableView];
}

- (void)createHeaderView {
    [self.momentViewModel loadingHeaderView:^(HeaderView *headerView){
        self.tableView.tableHeaderView = headerView;
    } failure:^{
        NSLog(@"%s", __func__);
    }];
}

- (void)createMomentsFeed {
    [self.momentViewModel loadingMomentsFeed:^(NSMutableArray *frameArray){
        self.frameArray = frameArray;
        [self.tableView reloadData];
    }failure:^{
        NSLog(@"%s", __func__);
    }];
}



#pragma mark - table view delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.frameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MomentsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell = [[MomentsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    FeedFrame *feedFrame = self.frameArray[indexPath.row];
    [cell createUIComponent:feedFrame.feed];
    cell.feedFrame = [self.frameArray objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FeedFrame *feed = self.frameArray[indexPath.row];
    return feed.cellHeight;
}

@end
