//
//  ViewController.m
//  WeChatCode
//
//  Created by Zlien on 9/9/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "RootViewController.h"
#import "CircleViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置窗口背景颜色，默认为黑色
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Main";

    //把welcomeLabel添加到RootViewController的UIView
    [self.view addSubview:[self createWelcomeLabel]];
    [self.view addSubview:[self createGoToNextViewButton]];

        // Do any additional setup after loading the view, typically from a nib.
}

-(UIButton *) createGoToNextViewButton{
    UIButton *goToNextViewButton = [UIButton buttonWithType:UIButtonTypeSystem];
    goToNextViewButton.frame = CGRectMake(self.view.bounds.size.width/2 - 40, self.view.bounds.size.height/2 - 60, 80, 40);
    goToNextViewButton.backgroundColor = [UIColor blackColor];
    [goToNextViewButton setTitle:@"朋友圈" forState:UIControlStateNormal];
    [goToNextViewButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [goToNextViewButton addTarget:self action:@selector(goToNextView) forControlEvents:UIControlEventTouchDown];
    return goToNextViewButton;
}

-(void)goToNextView{
    CircleViewController *circleViewController = [[CircleViewController alloc] init];
    [self.navigationController pushViewController:circleViewController animated:YES];

}
-(UILabel *)createWelcomeLabel{
    
    //初始化UILabel,设置其大小为窗口大小
    
    UILabel *welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    welcomeLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleRightMargin;
    
    //设置welcomeLabel中文字的位置、内容、颜色、字体
    welcomeLabel.textAlignment = NSTextAlignmentCenter;
    welcomeLabel.text = @"Welcome to WeChat";
    welcomeLabel.textColor = [UIColor blackColor];
    welcomeLabel.font = [UIFont systemFontOfSize:16];
    
    return welcomeLabel;
}


@end
