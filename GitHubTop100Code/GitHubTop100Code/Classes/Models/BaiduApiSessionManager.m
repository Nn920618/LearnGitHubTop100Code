//
//  BaiduApiSessionManager.m
//  GitHubTop100Code
//
//  Created by Nn on 16/3/8.
//  Copyright © 2016年 Nn. All rights reserved.
//

#import "BaiduApiSessionManager.h"

@implementation BaiduApiSessionManager


- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self == nil)
    {
        return nil;
    }
    [self.requestSerializer setValue:@"c357271ede7166a2a926f29213ddbcef" forHTTPHeaderField:@"apikey"];
    return self;
}
@end
