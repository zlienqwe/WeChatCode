//
//  ViewController.m
//  WeChatCode
//
//  Created by Zlien on 9/9/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "HomeViewController.h"
#import "MomentsViewController.h"

@interface HomeViewController()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
    [self createMomentsButton];
    [self createWelcomeLabel];
}

- (void)createMomentsButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(self.view.bounds.size.width/2 - 40, self.view.bounds.size.height/2 - 60, 80, 40);
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"朋友圈" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(pushMomentViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)createWelcomeLabel {
    UILabel *welcomeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    welcomeLabel.text = @"Welcome to WeChat";
    welcomeLabel.textColor = [UIColor blackColor];
    welcomeLabel.font = [UIFont systemFontOfSize:16];
    [welcomeLabel sizeToFit];
    welcomeLabel.center =self.view.center;
    [self.view addSubview:welcomeLabel];
}

- (void)pushMomentViewController {
    [self.navigationController pushViewController:[[MomentsViewController alloc] init] animated:YES];
}

@end
