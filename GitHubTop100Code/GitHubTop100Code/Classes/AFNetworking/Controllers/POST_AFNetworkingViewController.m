//
//  POST_AFNetworkingViewController.m
//  GitHubTop100Code
//
//  Created by Nn on 16/3/9.
//  Copyright © 2016年 Nn. All rights reserved.
//

#import "POST_AFNetworkingViewController.h"
#import <GitHubFrameworks/AFNetworking.h>

@interface POST_AFNetworkingViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (weak, nonatomic) IBOutlet UITextView *textview;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic, strong) NSURLSessionDataTask *task;
@end

@implementation POST_AFNetworkingViewController



- (IBAction)checkAction:(id)sender
{
    [self.textfield resignFirstResponder];
    NSDictionary *parameters = @{@"str": self.textfield.text,
                                 @"like": @"true"};
    self.button.enabled = NO;
    __weak typeof(self) weakSelf = self;
    AFHTTPSessionManager *sessionMgr = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.hoapi.com/index.php/Home/Api/check"]];
    [sessionMgr POST:@"" parameters:parameters constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.textview.text = [responseObject description];
        strongSelf.button.enabled = YES;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.textview.text = [error description];
        strongSelf.button.enabled = YES;
    }];
}

@end
