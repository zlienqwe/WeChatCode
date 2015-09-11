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
NSString *urlPath = @"http://thoughtworks-ios.herokuapp.com/user/jsmith/tweets";

-(void)requestNetWork{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlPath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        NSLog(@"%@",responseObject);
    }failure:^(AFHTTPRequestOperation *operation, NSError *error){
        NSLog(@"EEEEEEEEEEEEEEEE");
    }];

}

-(NSMutableArray *)jsonToData:(NSDictionary *)dic{

    
    NSError *error = [NSError new];
    NSData *myData = [NSKeyedArchiver archivedDataWithRootObject:dic];
    NSMutableArray *jsonToDictionary = [NSJSONSerialization JSONObjectWithData:myData options:0 error:&error];

    return [NSMutableArray arrayWithArray:jsonToDictionary];
}

@end
