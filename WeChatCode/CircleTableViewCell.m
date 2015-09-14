//
//  CircleTableViewCell.m
//  WeChatCode
//
//  Created by Zlien on 9/11/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "CircleTableViewCell.h"
#import "Feed.h"
#import "UIImageView+WebCache.h"

static NSInteger avatarHeight = 60;
static NSInteger avatarWidth = 60;

@interface CircleTableViewCell()

@property (nonatomic, strong) UILabel * content;
@property (nonatomic, strong) UILabel * senderName;
@property (nonatomic, strong) UIImageView * avatar;

@end
@implementation CircleTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier feed:(Feed *)feed{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    
        _content = [[UILabel alloc] initWithFrame:CGRectMake(70, 0, 230, 20)];
        _content.text = feed.content;
        [self.contentView addSubview:_content];
        
        _senderName = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 40, 20)];
        _senderName.text = feed.senderName;
        [self.contentView addSubview:_senderName];
        
        _avatar = [[UIImageView alloc] init];
        _avatar = [self buildAvatarViewWithUrl:feed];
        [self.contentView addSubview:_avatar];
        
    }
    return self;
}
-(UIImageView *)buildAvatarViewWithUrl:(Feed *)feed{
    
    UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, avatarWidth , avatarHeight)];
    [avatarImageView sd_setImageWithURL:(NSURL *)(feed.avatarString) placeholderImage:[UIImage imageNamed:@"avatarplaceholder"]];
    


    
    return avatarImageView;
}

@end
