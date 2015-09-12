//
//  UrlHelper.m
//  WeChatCode
//
//  Created by Zlien on 9/11/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "UrlHelper.h"
#import "AFNetworking.h"


@implementation UrlHelper

- (void)requestWith:(NSString *)urlString success:(void (^)(NSDictionary *))success failure:(void (^)())failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
     
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        NSLog(@"%@",responseObject);
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *dic = responseObject;
            success(dic);
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error){
        NSLog(@"error %@",error);
        failure();
    }];
}


@end
