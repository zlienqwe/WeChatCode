//
//  ViewController.m
//  WeChatCode
//
//  Created by Zlien on 9/9/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UILabel * welcomeLabel;
}
@end
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initWelcomeLabel];
        // Do any additional setup after loading the view, typically from a nib.
}
-(void)initWelcomeLabel{
    int welcomeLabelH = 20;
    int welcomeLabelW = 200;
    welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - welcomeLabelW) / 2, (SCREEN_HEIGHT - welcomeLabelH) / 2, welcomeLabelW, welcomeLabelH)];
    welcomeLabel.textAlignment = NSTextAlignmentCenter;
    welcomeLabel.text = @"Welcome to WeChat";
    welcomeLabel.textColor = [UIColor blackColor];
    welcomeLabel.font = [UIFont systemFontOfSize:16];
    welcomeLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:welcomeLabel];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
