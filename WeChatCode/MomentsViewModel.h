//
//  MomentsHeaderViewModel.h
//  WeChatCode
//
//  Created by Zlien on 9/17/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MomentsViewController.h"
#import "HeaderView.h"

@interface MomentsViewModel : NSObject

- (void)loadingHeaderView:(void (^)(HeaderView *headerView))success failure:(void (^)())failure;
- (void)loadingMomentsFeed:(void (^)(NSArray *frameArray))success failure:(void (^)())failure;

@end
