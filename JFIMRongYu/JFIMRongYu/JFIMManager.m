//
//  JFIMManager.m
//  JFIMRongYu
//
//  Created by apple on 16/8/27.
//  Copyright © 2016年 pengjf. All rights reserved.
//

#import "JFIMManager.h"

@implementation JFIMManager

//创建单例类的同时注册SDK
+ (instancetype)shareManager{
   __block JFIMManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[JFIMManager alloc] init];
        [[RCIM sharedRCIM] initWithAppKey:kRCIMAppKey];
    });
    return manager;
}
#pragma mark -- 荣云的登录方法
- (void)loginInRongYuWithToken:(NSString *)token{
    [[RCIM sharedRCIM] connectWithToken:token success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%ld", (long)status);
    } tokenIncorrect:^{
        NSLog(@"token错误");
    }];  
}

@end
