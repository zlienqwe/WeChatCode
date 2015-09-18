
//  UrlHelper.m
//  WeChatCode
//
//  Created by Zlien on 9/11/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "MomentsAPI.h"
#import "AFNetworking.h"
#import "User.h"

@implementation MomentsAPI

+ (void)requestHeaderViewInfo:(void (^)(User *user))success failure:(void (^)())failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:UserInfoUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            User *user = [[User alloc] initWithDic:responseObject];
            success(user);
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error){
        NSLog(@"error %s",__func__);
        failure();
    }];
}

+ (void)requestFeeds:(void (^)())success failure:(void (^)())failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:ContentUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        if ([responseObject isKindOfClass:[NSArray class]]) {
            success(responseObject);
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error){
        NSLog(@"error %s",__func__);
        failure();
    }];
}

@end
