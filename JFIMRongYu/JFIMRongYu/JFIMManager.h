//
//  JFIMManager.h
//  JFIMRongYu
//
//  Created by apple on 16/8/27.
//  Copyright © 2016年 pengjf. All rights reserved.
//


#define kRCIMAppKey @"6tnym1brnnmz7"



#import <Foundation/Foundation.h>
#import <RongIMKit/RongIMKit.h>
@interface JFIMManager : NSObject<RCIMUserInfoDataSource>

+ (instancetype)shareManager;

- (void)loginInRongYuWithToken:(NSString *)token;
@end
