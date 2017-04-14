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
            ZQPageModel *pageModel = [ZQPageModel new];
            
            pageModel.date = [NSDate date];
            pageModel.title = @"我们的日子";
            pageModel.detail = @"渴望之物的来临,\n总是在我们停止渴求它们之后";
            pageModel.image = [UIImage imageNamed:@"Background"];
            pageModel.type = i % 3;
            [tmp addObject:pageModel];
        }
        
        _pageModels = [tmp copy];
    }
    return _pageModels;
}

@end
