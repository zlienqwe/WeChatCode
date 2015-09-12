//
//  UrlHelper.h
//  WeChatCode
//
//  Created by Zlien on 9/11/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlHelper : NSObject

- (void)requestWith:(NSString *)urlString success:(void (^)(NSDictionary *))success failure:(void (^)())failure;

@end
