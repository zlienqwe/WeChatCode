//
//  FeedFrame.m
//  WeChatCode
//
//  Created by Zlien on 15/9/16.
//  Copyright (c) 2015年 Zlien. All rights reserved.
//

#import "FeedFrame.h"

@implementation FeedFrame

+ (instancetype)frameModelWithFeed:(Feed *)feed {
    return [[self alloc] initWithFeed:feed];
}
   
+ (NSMutableArray *)frameModelWithArray:(NSArray *)feedArray {
    NSMutableArray *feedFrameData = [NSMutableArray array];
    for (Feed *feed in feedArray) {
        FeedFrame *feedFrame = [self frameModelWithFeed:feed];
        [feedFrameData addObject:feedFrame];
    }
    return feedFrameData;
}

- (instancetype)initWithFeed:(Feed*)feed {
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
        self.avatarFrame = CGRectMake(avatarX, avatarY, avatarWH, avatarWH);
        
        CGFloat nickY = avatarY;
        CGFloat nickX = CGRectGetMaxX(self.avatarFrame) + margin;
        NSDictionary *nickAttrs = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
        CGSize nickSize = [self.feed.nick sizeWithAttributes:nickAttrs];
        self.nickFrame = (CGRect){{nickX, nickY}, nickSize};
        
        CGFloat contentX = nickX;
        CGFloat contentY = CGRectGetMaxY(self.avatarFrame) + margin;
        CGFloat contentW = [UIScreen mainScreen].bounds.size.width - margin - contentX;
        CGSize contentMaxSize = CGSizeMake(contentW, MAXFLOAT);
        NSDictionary *contentAttrs = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
        CGFloat contentH = [self.feed.content boundingRectWithSize:contentMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:contentAttrs context:nil].size.height;
        self.contentFrame = CGRectMake(contentX, contentY, contentW, contentH);
        
        if (self.feed.imageString) {
            CGFloat imageWH = 150;
            CGFloat imageX = contentX;
            CGFloat imageY = CGRectGetMaxY(self.contentFrame) + margin;
            self.imageFrame = CGRectMake(imageX, imageY, imageWH, imageWH);
            _cellHeight = CGRectGetMaxY(self.imageFrame);
        } else {
            _cellHeight = CGRectGetMaxY(self.contentFrame);
        }
        _cellHeight += margin;
    }
    return _cellHeight;
}

@end
