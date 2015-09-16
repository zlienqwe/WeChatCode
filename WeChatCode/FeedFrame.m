//
//  FeedFrame.m
//  WeChatCode
//
//  Created by Zlien on 15/9/16.
//  Copyright (c) 2015年 Zlien. All rights reserved.
//

#import "FeedFrame.h"

@implementation FeedFrame

+ (instancetype)frameModelWithModel:(Feed *)feed {
    return [[self alloc] initWithModel:feed];
}

+ (NSMutableArray *)frameModelWithArray:(NSMutableArray *)arr {
    NSMutableArray *data = [NSMutableArray array];
    for (Feed *fe in arr) {
        FeedFrame *newF =  [self frameModelWithModel:fe];
        [data addObject:newF];
    }
    return data;
}

- (instancetype)initWithModel:(Feed*)feed {
    if (self = [super init]) {
        self.feed = feed;
    }
    return self;
}

- (CGFloat) cellHeight {
    if (_cellHeight == 0) {
        CGFloat margin = 10;
        
        CGFloat avatarX = margin;
        CGFloat avatarY = margin;
        CGFloat avatarWH = 30;
        self.nickFrame = CGRectMake(avatarX, avatarY, avatarWH, avatarWH);
        
        CGFloat nickY = avatarY;
        CGFloat nickX = CGRectGetMaxX(self.avatarFrame) + margin;
        NSDictionary *nickAttrs = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
        CGSize nickSize = [self.feed.nick sizeWithAttributes:nickAttrs];
        self.nickFrame = (CGRect){{nickX, nickY}, nickSize};
        
        CGFloat contentX = avatarX;
        CGFloat contentY = CGRectGetMaxY(self.avatarFrame) + margin;
        CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 2 * contentX;
        CGSize contentMaxSize = CGSizeMake(contentW, MAXFLOAT);
        NSDictionary *contentAttrs = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
        CGFloat contentH = [
        
        
        
        
    }
    return _cellHeight;
}

@end
