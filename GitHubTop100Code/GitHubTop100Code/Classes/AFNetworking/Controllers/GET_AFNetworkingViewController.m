//
//  GET_AFNetworkingViewController.m
//  GitHubTop100Code
//
//  Created by Nn on 16/3/8.
//  Copyright © 2016年 Nn. All rights reserved.
//

#import "GET_AFNetworkingViewController.h"
#import "GET2_AFNetworkingViewController.h"
#import "BaiduApiSessionManager.h"

@interface GET_AFNetworkingViewController ()
@property (nonatomic, strong) NSURLSessionDataTask *task;
@property (nonatomic, strong) NSArray *datasource;
@end

@implementation GET_AFNetworkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    BaiduApiSessionManager *sessionMgr = [[BaiduApiSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://apis.baidu.com/tngou/info/classify"]];
    __weak typeof(self) weakSelf = self;
    self.task = [sessionMgr GET:@"" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
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
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *source = self.datasource[indexPath.row];
    GET2_AFNetworkingViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GET2_AFNetworkingViewController"];
    vc.clsId = source[@"id"];
    [self.navigationController showViewController:vc sender:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    [self.task cancel];
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
