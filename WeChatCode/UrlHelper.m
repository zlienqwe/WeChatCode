
//  UrlHelper.m
//  WeChatCode
//
//  Created by Zlien on 9/11/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "UrlHelper.h"
#import "AFNetworking.h"


@implementation UrlHelper

- (void)requestHeaderViewInfo:(void (^)(NSDictionary *))success failure:(void (^)())failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
     
    [manager GET:UserInfoUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){

        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *dic = responseObject;
            success(dic);
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error){
        NSLog(@"error %@",error);
        failure();
    }];
}
    
-(void)requestFeeds:(void (^)(NSArray *))success failure:(void (^)())failure{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:ContentUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        
        if ([responseObject isKindOfClass:[NSArray class]]) {
            success(responseObject);
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error){
        NSLog(@"error %@",error);
        failure();
    }];
}

@end
