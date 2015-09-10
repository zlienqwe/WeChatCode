//
//  ViewController.m
//  WeChatCode
//
//  Created by Zlien on 9/9/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    UILabel * welcomeLabel;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置窗口背景颜色，默认为黑色
    self.view.backgroundColor = [UIColor whiteColor];

    //调用initWelcomeLabel方法
    [self initWelcomeLabel];
    
    //把welcomeLabel添加到RootViewController的UIView
    [self.view addSubview:welcomeLabel];

        // Do any additional setup after loading the view, typically from a nib.
}
-(void)initWelcomeLabel{
    
    //初始化UILabel,设置其大小为窗口大小
    welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    //设置welcomeLabel中文字的位置、内容、颜色、字体
    welcomeLabel.textAlignment = NSTextAlignmentCenter;
    welcomeLabel.text = @"Welcome to WeChat";
    welcomeLabel.textColor = [UIColor blackColor];
    welcomeLabel.font = [UIFont systemFontOfSize:16];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
