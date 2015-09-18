//
//  FeedFrame.h
//  WeChatCode
//
//  Created by Zlien on 15/9/16.
//  Copyright (c) 2015年 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Feed.h"

@interface FeedFrame : NSObject

@property (nonatomic, assign) CGRect avatarFrame;
@property (nonatomic, assign) CGRect nickFrame;
@property (nonatomic, assign) CGRect contentFrame;
@property (nonatomic, assign) CGRect imageFrame;

@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, strong) Feed *feed;

+ (NSMutableArray*)frameModelWithArray:(NSMutableArray*)arr;
+ (instancetype)frameModelWithFeed:(Feed*)feed;

@end
