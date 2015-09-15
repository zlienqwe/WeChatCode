//
//  UserModel.m
//  WeChatCode
//
//  Created by Zlien on 9/12/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "User.h"

@implementation User

- (User *)initWithDic:(NSDictionary *)dic {
    self.nick = dic[@"nick"];
    self.avatar = dic[@"avatar"];
    self.profileImage = dic[@"profile-image"];
    return self;
}

@end
