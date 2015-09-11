//
//  CircleViewController.m
//  WeChatCode
//
//  Created by Zlien on 9/10/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "CircleViewController.h"
#import "ContentModel.h"
@interface CircleViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *contentText;
    NSMutableArray *contentBody;


}


@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self readySource];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"朋友圈";
    CGRect frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate=self;

    self.tableView.tableHeaderView = [self createHeaderView];

}

-(void) readySource{
    contentText = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33" ,nil];
    
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
    
    NSString *cellIdentifier =  [NSString stringWithFormat:@"Cell%ld%ld", (long)[indexPath section], (long)[indexPath row]];;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    ContentModel *model = [contentBody objectAtIndex:indexPath.row];
    
    UILabel * contentTex;
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
        CGRect contentTe = CGRectMake(5, 0, 230, 20);
        contentTex = [[UILabel alloc] initWithFrame:contentTe];
        
        contentTex.font = [UIFont systemFontOfSize:16];
        [cell addSubview:contentTex];
        }
    contentTex.text = model.contentText;
    return cell;
}

-(UIView *)createHeaderView{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,220)];
    headerView.backgroundColor =[UIColor redColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, 220)];
    imageView.image = [UIImage imageNamed:@"Default-568h"];
    [headerView addSubview:imageView];
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 30;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return contentText.count;
}


@end
