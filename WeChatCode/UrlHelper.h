//
//  UrlHelper.h
//  WeChatCode
//
//  Created by Zlien on 9/11/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlHelper : NSObject
-(void)requestNetWork;
-(NSMutableArray *)jsonToData:(NSDictionary *)dic;
@end
