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
        
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:3 day:21 title:@"骑车遛狗" detail:@"\"跑在前面的才是狗！\"\n\"只有人才能骑在车上，狗怎么骑车?\"" image:[UIImage imageNamed:@"3_21"] type:ZQPageModelTypeSummary blur:0];
            [tmp addObject:p];
        }
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:3 day:21 title:@"" detail:@"" image:[UIImage imageNamed:@""] type:ZQPageModelTypeSummary blur:0];
            [tmp addObject:p];
        }
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:3 day:21 title:@"" detail:@"" image:[UIImage imageNamed:@""] type:ZQPageModelTypeSummary blur:0];
            [tmp addObject:p];
        }
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:3 day:21 title:@"" detail:@"" image:[UIImage imageNamed:@""] type:ZQPageModelTypeSummary blur:0];
            [tmp addObject:p];
        }
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:3 day:21 title:@"" detail:@"" image:[UIImage imageNamed:@""] type:ZQPageModelTypeSummary blur:0];
            [tmp addObject:p];
        }
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:3 day:21 title:@"" detail:@"" image:[UIImage imageNamed:@""] type:ZQPageModelTypeSummary blur:0];
            [tmp addObject:p];
        }
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:3 day:21 title:@"" detail:@"" image:[UIImage imageNamed:@""] type:ZQPageModelTypeSummary blur:0];
            [tmp addObject:p];
        }
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:3 day:21 title:@"" detail:@"" image:[UIImage imageNamed:@""] type:ZQPageModelTypeSummary blur:0];
            [tmp addObject:p];
        }
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:3 day:21 title:@"" detail:@"" image:[UIImage imageNamed:@""] type:ZQPageModelTypeSummary blur:0];
            [tmp addObject:p];
        }
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:3 day:21 title:@"" detail:@"" image:[UIImage imageNamed:@""] type:ZQPageModelTypeSummary blur:0];
            [tmp addObject:p];
        }
        _pageModels = [tmp copy];
    }
    return _pageModels;
}

@end
