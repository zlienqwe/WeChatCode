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
#import "FeedFrame.h"
#import "Feed.h"

@implementation MomentsViewModel

- (void)loadingHeaderView:(void (^)(HeaderView *headerView))success failure:(void (^)())failure {
    [MomentsAPI requestHeaderViewInfo:^(User *user) {
        HeaderView *headerView = [[HeaderView alloc] initWithUser:user frame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, 220)];
        success(headerView);
        } failure:^{
        failure();
    }];
}

- (void)loadingMomentsFeed:(void (^)(NSMutableArray *frameArray))success failure:(void (^)())failure{
    NSMutableArray *feedArray = [[NSMutableArray alloc] init];
    [MomentsAPI requestFeeds:^(NSMutableArray *responseObject){
        NSMutableArray *frameArray = [[NSMutableArray alloc] init];
        for (NSDictionary *moment in responseObject) {
            Feed *feed = [[Feed alloc] initWithDic:moment];
            [feedArray addObject:feed];
            frameArray = [FeedFrame frameModelWithArray:feedArray];
        }
        success(frameArray);
    } failure:^{
        NSLog(@"!!!!!!!");
    }];
}
@end
