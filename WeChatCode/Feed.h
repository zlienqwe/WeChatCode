//
//  contentModel.h
//  WeChatCode
//
//  Created by Zlien on 9/11/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feed : NSObject

@property (strong, nonatomic) NSString *senderName;
@property (strong, nonatomic) NSString *nick;
@property (strong, nonatomic) NSString *avatarString;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSMutableArray *imagesArray;
@property (strong, nonatomic) NSString *imageString;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
