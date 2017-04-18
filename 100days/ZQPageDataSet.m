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
        NSMutableArray *tmp = [NSMutableArray array];
        for (NSInteger i = 0; i < 10; ++i) {
            ZQPageModel *model1 = [ZQPageModel pageModelWithYear:2017 month:1 day:8 title:@"123" detail:@"456" image:[UIImage imageNamed:@"Background"] type:i % 3];
            [tmp addObject:model1];
        }
        
        _pageModels = [tmp copy];
    }
    return _pageModels;
}

@end
