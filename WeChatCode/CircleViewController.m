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

    [self.view addSubview:[self createHeaderView]];
    [self.view addSubview:[self createBodyView]];
    }

-(UILabel *)createHeaderView{
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2)];
    headerLabel.backgroundColor =[UIColor redColor];
    return headerLabel;
}
-(UILabel *)createBodyView{
    UILabel *bodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height)];
    bodyLabel.backgroundColor = [UIColor blueColor];
    
    return bodyLabel;
}


@end
