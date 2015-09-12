//
//  HeaderView.h
//  WeChatCode
//
//  Created by Zlien on 9/12/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface HeaderView : UIView

@property (nonatomic, strong) UIImageView *backgroudImageView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *nickLabel;

-(id)initWithDic:(NSDictionary *)dic frame:(CGRect)frame;

@end
