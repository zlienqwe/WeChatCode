//
//  UrlHelper.h
//  WeChatCode
//
//  Created by Zlien on 9/11/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

@interface MomentsAPI : NSObject

+ (void)requestHeaderViewInfo:(void (^)(User *user))success failure:(void (^)())failure;
+ (void)requestFeeds:(void (^)())success failure:(void (^)())failure;

@end
