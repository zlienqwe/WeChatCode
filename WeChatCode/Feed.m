//
//  contentModel.m
//  WeChatCode
//
//  Created by Zlien on 9/11/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "Feed.h"

@implementation Feed

- (instancetype)initWithDic:(NSDictionary *)dic {
    if ([self init]) {
        NSDictionary *tempDic = dic[@"sender"];
        
        self.content = dic[@"content"];
        self.senderName = tempDic[@"username"];
        self.avatarString = tempDic[@"avatar"];
        self.nick = tempDic[@"nick"];
    }
    return self;
}

@end 
