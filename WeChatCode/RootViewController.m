//
//  ViewController.m
//  WeChatCode
//
//  Created by Zlien on 9/9/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置窗口背景颜色，默认为黑色
    self.view.backgroundColor = [UIColor whiteColor];
    
    //把welcomeLabel添加到RootViewController的UIView
    [self.view addSubview:[self createWelcomeLabel]];

        // Do any additional setup after loading the view, typically from a nib.
}

-(UILabel *)createWelcomeLabel{
    
    //初始化UILabel,设置其大小为窗口大小
    
    UILabel *welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [welcomeLabel setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleRightMargin];

    //设置welcomeLabel中文字的位置、内容、颜色、字体
    welcomeLabel.textAlignment = NSTextAlignmentCenter;
    welcomeLabel.text = @"Welcome to WeChat";
    welcomeLabel.textColor = [UIColor blackColor];
    welcomeLabel.font = [UIFont systemFontOfSize:16];
    
    return welcomeLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
