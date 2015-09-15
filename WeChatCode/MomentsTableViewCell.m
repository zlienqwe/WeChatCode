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

static NSUInteger avatarHeight = 60;
static NSUInteger avatarWidth = 60;

@interface MomentsTableViewCell()

@property (nonatomic, strong) UILabel *content;
@property (nonatomic, strong) UILabel *senderName;
@property (nonatomic, strong) UIImageView *avatar;

@end

@implementation MomentsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
    return self;
}

- (void)createUIComponent:(Feed *)feed {
    self.content = [[UILabel alloc] init];
    self.content.text = feed.content;
    [self.contentView addSubview:_content];
    
    self.senderName = [[UILabel alloc] init];
    self.senderName.text = feed.senderName;
    [self.contentView addSubview:_senderName];
    
    self.avatar = [[UIImageView alloc] init];
    self.avatar = [self buildAvatarViewWithUrl:feed];
    [self.contentView addSubview:_avatar];
}

- (void)layoutSubviews {
    CGSize frameSize = self.frame.size;
    self.content.frame = CGRectMake(70, 40, frameSize.width - 70, frameSize.height - 40);
    self.senderName.frame = CGRectMake(70, 40, frameSize.width - 70, frameSize.height - 40);
    self.avatar.frame = CGRectMake(0, 0, avatarWidth, avatarHeight);
}

- (UIImageView *)buildAvatarViewWithUrl:(Feed *)feed {
    UIImageView *avatarImageView = [[UIImageView alloc] init];
    [avatarImageView sd_setImageWithURL:(NSURL *)(feed.avatarString) placeholderImage:[UIImage imageNamed:@"avatarplaceholder"]];
    return avatarImageView;
}

@end
