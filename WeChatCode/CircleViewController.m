//
//  CircleViewController.m
//  WeChatCode
//
//  Created by Zlien on 9/10/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "CircleViewController.h"
#import "Feed.h"
#import "CircleTableViewCell.h"
#import "UrlHelper.h"
#import "HeaderView.h"

@interface CircleViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *feedArray;
@end

@implementation CircleViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createHeaderView];
    [self readySource];

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"朋友圈";
    [self setNavigationBar];
    CGRect frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate=self;
    
    self.tableView.tableFooterView = [[UIView alloc] init];
}

-(void) setNavigationBar{
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera  target:self action:nil];
    self.navigationItem.rightBarButtonItem = cameraButton;
}

-(void) readySource{
    _feedArray = [[NSMutableArray alloc] init];

    UrlHelper *urlHelper =  [[UrlHelper alloc] init];
    
    [urlHelper requestFeeds:^(NSArray *arr) {

        for (NSDictionary *dic in arr) {
            
            Feed *feed = [[Feed alloc] initWithDic:dic];
            
            [self.feedArray addObject:feed];
            [self.tableView reloadData];
        }
    } failure:^{
        NSLog(@"content connect error");
    }];
}

-(void)createHeaderView{
    
    UrlHelper *urlHelper =  [[UrlHelper alloc] init];
    [urlHelper requestHeaderViewInfo:^(NSDictionary *dic) {
        HeaderView *headerView = [[HeaderView alloc] initWithDic:dic frame:CGRectMake(0, 0, self.view.frame.size.width, 220)];
        self.tableView.tableHeaderView = headerView;
        
    } failure:^{
        NSLog(@"headerView connect error");
    }];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *cellIdentifier = @"cell";
    CircleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  
        if (cell == nil) {
        cell = [[CircleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier feed:self.  feedArray[indexPath.row]];
    }

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.feedArray count];
}

@end
