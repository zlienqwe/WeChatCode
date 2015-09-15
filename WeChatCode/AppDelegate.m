//
//  AppDelegate.m
//  WeChatCode
//
//  Created by Zlien on 9/9/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    HomeViewController *rootViewController = [[HomeViewController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    [navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:(0/225.0) green:(0/225.0) blue:(0/225.0) alpha:1.0]];
    [navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [navigationController.navigationBar setTranslucent:NO];
    [navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    self.window.rootViewController = navigationController;

    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
