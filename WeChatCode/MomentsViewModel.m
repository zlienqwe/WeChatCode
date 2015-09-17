//
//  MomentsHeaderViewModel.m
//  WeChatCode
//
//  Created by Zlien on 9/17/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "MomentsViewModel.h"
#import "MomentsAPI.h"
#import "HeaderView.h"

@implementation MomentsViewModel

- (void)loadingHeaderView:(void (^)(HeaderView *headerView))success failure:(void (^)())failure {
    [MomentsAPI requestHeaderViewInfo:^(User *user) {
        HeaderView *headerView = [[HeaderView alloc] initWithUser:user frame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, 220)];
        success(headerView);
        } failure:^{
        failure();
    }];
}

@end
