//
//  GET2_AFNetworkingViewController.m
//  GitHubTop100Code
//
//  Created by Nn on 16/3/8.
//  Copyright © 2016年 Nn. All rights reserved.
//

#import "GET2_AFNetworkingViewController.h"
#import "BaiduApiSessionManager.h"
#import <GitHubFrameworks/UIKit+AFNetworking.h>

@interface GET2_AFNetworkingViewController ()
@property (nonatomic, strong) NSURLSessionDataTask *task;
@property (nonatomic, strong) NSArray *datasource;
@end

@implementation GET2_AFNetworkingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    assert(self.clsId != nil);
    NSDictionary *parameters = @{@"id": self.clsId,
                                 @"page": @(1),
                                 @"rows": @(55)};
    BaiduApiSessionManager *sessionMgr = [[BaiduApiSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://apis.baidu.com/tngou/info/list"]];
    __weak typeof(self) weakSelf = self;
    self.task = [sessionMgr GET:@"" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSArray *tngou = responseObject[@"tngou"];
        if ([tngou isKindOfClass:[NSArray class]])
        {
            strongSelf.datasource = tngou;
        }
        [strongSelf.tableView reloadData];
//        NSLog(@"%@", responseObject);
    } failure:nil];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *source = self.datasource[indexPath.row];
    cell.textLabel.text = source[@"title"];
    cell.detailTextLabel.text = source[@"description"];
    NSString *imgUrlStr = [NSString stringWithFormat:@"http://tnfs.tngou.net/img%@", source[@"img"]];
    NSURL *imgUrl = [NSURL URLWithString:imgUrlStr];
    [cell.imageView setImageWithURL:imgUrl];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end
