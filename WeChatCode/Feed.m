//
//  contentModel.m
//  WeChatCode
//
//  Created by Zlien on 9/11/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "Feed.h"

@implementation Feed

-(instancetype)initWithDic:(NSDictionary *)dic{
    self = [self init];

    if (self) {
        self.content = [dic objectForKey:@"content"];
        self.senderName = [[dic objectForKey:@"sender"] objectForKey:@"username"];
        self.avatarString = [[dic objectForKey:@"sender"] objectForKey:@"avatar"];
        self.nick = [[dic objectForKey:@"sender"] objectForKey:@"nick"];
    }
    return self;
}

@end
