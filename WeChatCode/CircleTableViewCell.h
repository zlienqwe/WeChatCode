//
//  CircleTableViewCell.h
//  WeChatCode
//
//  Created by Zlien on 9/11/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Feed.h"

@interface CircleTableViewCell : UITableViewCell

- (void)config:(Feed *)feed;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier feed:(Feed *)feed;

@end
