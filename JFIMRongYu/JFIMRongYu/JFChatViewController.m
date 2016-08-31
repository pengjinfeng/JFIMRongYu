//
//  JFChatViewController.m
//  JFIMRongYu
//
//  Created by apple on 16/8/27.
//  Copyright © 2016年 pengjf. All rights reserved.
//

#import "JFChatViewController.h"

@interface JFChatViewController ()

@end

@implementation JFChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//点击cell获取message信息
- (void)didTapMessageCell:(RCMessageModel *)model{
    NSLog(@"%@",model);
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
