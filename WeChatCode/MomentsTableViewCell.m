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
    }
    return self;
}

- (void)createUIComponent:(Feed *)feed {
    self.content = [[UILabel alloc] init];
    self.content.text = feed.content;
    [self.content sizeToFit];
    self.content.numberOfLines = 0;
    [self.contentView addSubview:self.content];
    
    self.senderName = [[UILabel alloc] init];
    self.senderName.text = feed.senderName;
    [self.contentView addSubview:self.senderName];
    
    self.avatar = [[UIImageView alloc] init];
    self.avatar = [self buildImageViewWithUrl:feed.avatarString];
    [self.contentView addSubview:self.avatar];
    
    self.image = [[UIImageView alloc] init];
    self.image = [self buildImageViewWithUrl:feed.imageString];
    [self.contentView addSubview:self.image];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.avatar.frame = self.feedFrame.avatarFrame;
    self.senderName.frame = self.feedFrame.nickFrame;
    self.content.frame = self.feedFrame.contentFrame;
    self.image.frame = self.feedFrame.imageFrame;
}

- (UIImageView *)buildImageViewWithUrl:(NSString *)URL {
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView sd_setImageWithURL:(NSURL *)(URL) placeholderImage:[UIImage imageNamed:@"placeholder"]];
    return imageView;
}

@end
