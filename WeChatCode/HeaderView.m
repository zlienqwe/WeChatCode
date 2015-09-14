//
//  HeaderView.m
//  WeChatCode
//
//  Created by Zlien on 9/12/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "HeaderView.h"
#import "UrlHelper.h"
#import "UIImageView+WebCache.h"

static NSInteger padding = 10;
static NSInteger avatarHeight = 60;
static NSInteger avatarWidth = 60;
static NSInteger backgroungImageViewHeight = 180;
@implementation HeaderView
 
-(id)initWithDic:(NSDictionary *)dic frame:(CGRect)frame{
    self = [self initWithFrame:frame];

    if (self) {
 
        self.backgroundImageView = [self buildBackgroundImageViewWithDic:dic];
        [self addSubview:self.backgroundImageView];
        self.avatarImageView = [self buildAvatarViewWithDic:dic];
        [self addSubview:self.avatarImageView];
        self.nickLabel = [self buildNickLabelWith:dic];
        [self addSubview:self.nickLabel];
    }
    return self;
}

-(UILabel *)buildNickLabelWith:(NSDictionary *) dic{
    
    UILabel *nickLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width - 2 * padding - avatarWidth - 70 , backgroungImageViewHeight-20, 80, 20)];
    
    nickLabel.text = [dic objectForKey:@"nick"];
    nickLabel.textColor = [UIColor blackColor];
    nickLabel.font = [UIFont systemFontOfSize:14];
    
    return nickLabel;
}

-(UIImageView *)buildBackgroundImageViewWithDic:(NSDictionary *)dic{
    
    UIImageView *backgroundImageView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, backgroungImageViewHeight)];
    
    [backgroundImageView sd_setImageWithURL:[dic objectForKey:@"profile-image"] placeholderImage:[UIImage imageNamed:@"backgroundplaceholder"]];

    
    return backgroundImageView;
}



-(UIImageView *)buildAvatarViewWithDic:(NSDictionary *)dic{
    
    UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width - padding - avatarWidth, backgroungImageViewHeight - 40, avatarWidth , avatarHeight)];
    [avatarImageView sd_setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"avatar"]] placeholderImage:[UIImage imageNamed:@"avatarplaceholder"]];
    return avatarImageView;
}



@end
