//
//  ZQPageDataSet.m
//  100days
//
//  Created by 郑志勤 on 2017/4/5.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "ZQPageDataSet.h"

@interface ZQPageDataSet()


@end

@implementation ZQPageDataSet

+ (instancetype)shareDataSet
{
    static ZQPageDataSet *__instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __instance = [[self alloc] init];
    });
    
    return __instance;
}

- (NSArray<ZQPageModel *> *)pageModels
{
    if (!_pageModels) {
        
        ZQPageModel *model1 = [ZQPageModel];
    }
    return _pageModels;
}

@end
