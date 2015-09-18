//
//  CircleTableViewCell.h
//  WeChatCode
//
//  Created by Zlien on 9/11/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedFrame.h"
@class Feed;

@interface MomentsTableViewCell : UITableViewCell

- (void)updateUIComponentWithFeedFrame:(FeedFrame *)feedFrame;

@end
