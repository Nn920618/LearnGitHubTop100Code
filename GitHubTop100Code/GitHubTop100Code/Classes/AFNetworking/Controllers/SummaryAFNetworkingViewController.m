//
//  SummaryAFNetworkingViewController.m
//  GitHubTop100Code
//
//  Created by Nn on 16/3/8.
//  Copyright © 2016年 Nn. All rights reserved.
//

#import "SummaryAFNetworkingViewController.h"

@interface SummaryAFNetworkingViewController ()

@end

@implementation SummaryAFNetworkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *urlBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(bookmarksAction)];
    self.navigationItem.rightBarButtonItem = urlBarButtonItem;
}

- (void)bookmarksAction
{
    NSURL *url = [NSURL URLWithString:@"https://github.com/AFNetworking/AFNetworking"];
    [[UIApplication sharedApplication] openURL:url];
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
