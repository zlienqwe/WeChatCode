//
//  HeaderView.m
//  WeChatCode
//
//  Created by Zlien on 9/12/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "HeaderView.h"
#import "UIImageView+WebCache.h"
#import "User.h"

static NSUInteger padding = 10;
static NSUInteger avatarHeight = 60;
static NSUInteger avatarWidth = 60;
static NSUInteger headerViewFrame = 200;

@interface HeaderView ()

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *nickLabel;

@end

@implementation HeaderView
 
- (id)initWithUser:(User *)user frame:(CGRect)frame {
    if ([self initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];

        [self createBackgroundImageViewWithURLString:user.profileImage];
        [self createNickLabelWithString:user.nick];
        [self createAvatarViewWithURLString:user.avatar];
    }
    return self;
}

- (void)createBackgroundImageViewWithURLString:(NSString *)string {
    self.backgroundImageView =[[UIImageView alloc] init];
    [self.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:string] placeholderImage:[UIImage imageNamed:@"backgroundplaceholder"]];
    [self addSubview:self.backgroundImageView];
}

- (void)createNickLabelWithString:(NSString *)string {
    self.nickLabel = [[UILabel alloc] init];
    self.nickLabel.text = string;
    self.nickLabel.textColor = [UIColor blackColor];
    self.nickLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.nickLabel];
}

- (void)createAvatarViewWithURLString:(NSString *)string {
    self.avatarImageView = [[UIImageView alloc] init] ;
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:string] placeholderImage:[UIImage imageNamed:@"avatarplaceholder"]];
    [self addSubview:self.avatarImageView];
}

- (void)layoutSubviews {
    self.frame = CGRectMake(0, 0, self.window.frame.size.width, headerViewFrame);
    self.backgroundImageView.frame = CGRectMake(0, 0, self.frame.size.width, headerViewFrame);
    self.avatarImageView.frame = CGRectMake(self.frame.size.width - padding - avatarWidth, headerViewFrame - avatarHeight + padding, avatarWidth, avatarHeight);
    [self.nickLabel sizeToFit];
    self.nickLabel.center = CGPointMake(self.frame.size.width - 2 * padding - avatarWidth - self.nickLabel.frame.size.width / 2, headerViewFrame - avatarHeight + 4  * padding);
}

@end
