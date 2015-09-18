//
//  CircleTableViewCell.m
//  WeChatCode
//
//  Created by Zlien on 9/11/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "MomentsTableViewCell.h"
#import "Feed.h"
#import "UIImageView+WebCache.h"
@interface MomentsTableViewCell()

@property (nonatomic, strong) UILabel *content;
@property (nonatomic, strong) UILabel *senderName;
@property (nonatomic, strong) UIImageView *avatar;
@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UILabel *commentSenderName;

@end

@implementation MomentsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createUIComponent];
    }
    return self;
}

- (void)createUIComponent {
    self.content = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.content sizeToFit];
    self.content.numberOfLines = 0;
    [self.contentView addSubview:self.content];
    
    self.senderName = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.senderName];
    
    self.avatar = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.avatar];
    
    self.image = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.image];
    
}

- (void)updateUIComponentWithFeedFrame:(FeedFrame *)feedFrame {
    self.content.text = feedFrame.feed.content;
    self.senderName.text = feedFrame.feed.senderName;
    [self.avatar sd_setImageWithURL:[NSURL URLWithString:feedFrame.feed.avatarString] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    [self.image sd_setImageWithURL:[NSURL URLWithString:feedFrame.feed.imageString] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    [self updateCellFrame:(FeedFrame *)feedFrame];
}

- (void)updateCellFrame:(FeedFrame *)feedFrame {
    self.avatar.frame = feedFrame.avatarFrame;
    self.senderName.frame = feedFrame.nickFrame;
    self.content.frame = feedFrame.contentFrame;
    self.image.frame = feedFrame.imageFrame;
    
    CGRect newFrame = [self frame];
    newFrame.size.height = feedFrame.cellHeight;
    self.frame = newFrame;
}

@end
