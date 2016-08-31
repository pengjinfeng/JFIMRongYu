//
//  JFChatListViewController.m
//  JFIMRongYu
//
//  Created by apple on 16/8/27.
//  Copyright © 2016年 pengjf. All rights reserved.
//

#import "JFChatListViewController.h"
#import "JFChatViewController.h"
@interface JFChatListViewController ()<RCIMUserInfoDataSource>

@end

@implementation JFChatListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigation];
    [RCIM sharedRCIM].userInfoDataSource = self;
    //设置需要显示哪些类型的会话
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                        @(ConversationType_DISCUSSION),
                                        @(ConversationType_CHATROOM),
                                        @(ConversationType_GROUP),
                                        @(ConversationType_APPSERVICE),
                                        @(ConversationType_SYSTEM)]];
    //设置需要将哪些类型的会话在会话列表中聚合显示
    [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),
                                          @(ConversationType_GROUP)]];
    
    
}
//重写RCConversationListViewController的onSelectedTableRow事件
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
         conversationModel:(RCConversationModel *)model
               atIndexPath:(NSIndexPath *)indexPath {
    JFChatViewController *conversationVC = [[JFChatViewController alloc]init];
    conversationVC.conversationType = model.conversationType;
    conversationVC.targetId = @"1234";
    conversationVC.title =@"pengf";
    [self.navigationController pushViewController:conversationVC animated:YES];
}


#pragma mark -- 设置导航栏
- (void)setNavigation{
    self.navigationItem.title = @"会话列表";
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(barButtonClick:)];
    self.navigationItem.rightBarButtonItem = left;
    
}
- (void)barButtonClick:(UIBarButtonItem *)button{
    JFChatViewController *conversationVC = [[JFChatViewController alloc]init];
    conversationVC.conversationType = ConversationType_PRIVATE;
    conversationVC.targetId = @"1234";
    conversationVC.title = @"pengf";
    [self.navigationController pushViewController:conversationVC animated:YES];
}
/**
 *此方法中要提供给融云用户的信息，建议缓存到本地，然后改方法每次从您的缓存返回
 */
- (void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion{
    
    NSLog(@"------------%@",userId);
    RCUserInfo *user = [[RCUserInfo alloc]init];
    user.userId = @"1234";
    user.name = @"pengf";
    user.portraitUri = @"https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=1756054607,4047938258&fm=96&s=94D712D20AA1875519EB37BE0300C008";
    return completion(user);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
