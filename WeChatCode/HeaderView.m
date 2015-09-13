//
//  HeaderView.m
//  WeChatCode
//
//  Created by Zlien on 9/12/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "HeaderView.h"
#import "UrlHelper.h"
static NSInteger padding = 10;
static NSInteger avatarHeight = 60;
static NSInteger avatarWidth = 60;
static NSInteger backgroungImageViewHeight = 180;
@implementation HeaderView
 
-(id)initWithDic:(NSDictionary *)dic frame:(CGRect)frame{
    self = [self initWithFrame:frame];
    
    if (self) {
        self.backgroudImageView = [self buildBackgroundImageViewWithUrl:[dic objectForKey:@"profile-image"]];
        [self addSubview:self.backgroudImageView ];
        self.avatarImageView = [self buildAvatarViewWithUrl:[dic objectForKey:@"avatar"]];
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

-(UIImageView *)buildBackgroundImageViewWithUrl:(NSString *)urlString{
    
    UIImageView *backgroudImageView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, backgroungImageViewHeight)];
    UIImage *aimage = [self requestImageWith:urlString];
    [backgroudImageView setImage:aimage];
    
    return backgroudImageView;
}



-(UIImageView *)buildAvatarViewWithUrl:(NSString *)urlString{
    
    UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width - padding - avatarWidth, backgroungImageViewHeight - 40, avatarWidth , avatarHeight)];
    UIImage *aimage = [self requestImageWith:urlString];
    [avatarImageView setImage:aimage];

    return avatarImageView;
}

-(UIImage *)requestImageWith:(NSString *)urlString{
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *aimage = [[UIImage alloc] initWithData:data];
    
    return aimage;
}


@end
