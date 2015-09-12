//
//  CircleViewController.m
//  WeChatCode
//
//  Created by Zlien on 9/10/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "CircleViewController.h"
#import "ContentModel.h"
#import "CircleTableViewCell.h"
#import "UrlHelper.h"
#import "HeaderView.h"

@interface CircleViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *contentText;
    NSMutableArray *contentReply;
    NSMutableArray *contentBody;

}

@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self readySource];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"朋友圈";
    [self setNavigationBar];
    CGRect frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate=self;
    [self createHeaderView];
}
-(void) setNavigationBar{
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera  target:self action:nil];
    self.navigationItem.rightBarButtonItem = cameraButton;
}
-(void) readySource{

    contentText = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48" ,nil];

    contentBody = [[NSMutableArray alloc] init];
    for (NSInteger index = 0; index < [contentText count]; index++) {
        ContentModel* model = [[ContentModel alloc] init];
        NSString *contentT;
        contentT = [contentText objectAtIndex:index];
        model.contentText = [NSString stringWithFormat:@"%@",contentT];
        [contentBody addObject:model];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *cellIdentifier = @"cell";
    CircleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (cell == nil) {
        cell = [[CircleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [cell config:contentBody[indexPath.row]];

    return cell;
}


-(void)createHeaderView{

    
    UrlHelper *urlHelper =  [[UrlHelper alloc] init];
    [urlHelper requestWith:UserInfoUrl success:^(NSDictionary *dic)  {
        NSLog(@"3333 %@",dic);
        
        HeaderView *headerView = [[HeaderView alloc] initWithDic:dic frame:CGRectMake(0, 0, self.view.frame.size.width, 220)];
        self.tableView.tableHeaderView = headerView;
        
    } failure:^{
        NSLog(@"shibai");
    }];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return contentText.count;
}


@end
