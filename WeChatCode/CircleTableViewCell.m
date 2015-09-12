//
//  CircleTableViewCell.m
//  WeChatCode
//
//  Created by Zlien on 9/11/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "CircleTableViewCell.h"
#import "ContentModel.h"
@interface CircleTableViewCell()

@property (nonatomic, strong) UILabel * contentText;




@end
@implementation CircleTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    
        _contentText = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 230, 20)];
        [self.contentView addSubview:_contentText];
        
    }
    return self;
}

- (void)config:(ContentModel *)model{
    self.contentText.text = model.contentText;
}


@end
