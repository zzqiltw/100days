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
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:1 day:1 title:@"台北记忆" detail:@"想和你一起去你想去的远方" image:[UIImage imageNamed:@"1_1"] type:ZQPageModelTypeVeryShort blur:0];
            [tmp addObject:p];
        }
        
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:1 day:23 title:@"你今天真好看" detail:@"封面赠语" image:[UIImage imageNamed:@"1_23"] type:ZQPageModelTypeVeryShort blur:0];
            [tmp addObject:p];
        }
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:2 day:14 title:@"最幸福的日子" detail:@"红豆糕和暖手球" image:[UIImage imageNamed:@"2_14"] type:ZQPageModelTypeVeryShort blur:0];
            [tmp addObject:p];
        }
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:3 day:5 title:@"上海之行" detail:@"\"有可以剥皮皮虾的对象也是一种幸福！\"\n \"同意\"" image:[UIImage imageNamed:@"3_5"] type:ZQPageModelTypeSummary blur:0];
            [tmp addObject:p];
        }
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:3 day:14 title:@"卷福" detail:@"只要是你想吃的东西\n再远也给你买回来~" image:[UIImage imageNamed:@"3_14"] type:ZQPageModelTypeDetail blur:0];
            [tmp addObject:p];
        }
        
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:3 day:21 title:@"海盐芝士蛋糕" detail:@"以及手托腮的可爱模样" image:[UIImage imageNamed:@"111"] type:ZQPageModelTypeSummary blur:0];
            [tmp addObject:p];
        }
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:3 day:21 title:@"骑车遛狗" detail:@"\"跑在前面的才是狗！\"\n\"只有人才能骑在车上，狗怎么骑车?\"" image:[UIImage imageNamed:@"3_21"] type:ZQPageModelTypeSummary blur:0];
            [tmp addObject:p];
        }
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:3 day:27 title:@"鸟爸爸" detail:@"觅食归来" image:[UIImage imageNamed:@"3_27"] type:ZQPageModelTypeVeryShort blur:0];
            [tmp addObject:p];
        }
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:4 day:8 title:@"大兴糕点" detail:@"\"我才不喜欢吃糕点呢\n因为是你喜欢吃我才买的\"" image:[UIImage imageNamed:@"4_8"] type:ZQPageModelTypeSummary blur:0];
            [tmp addObject:p];
        }
        {
            ZQPageModel *p = [ZQPageModel pageModelWithYear:2017 month:3 day:28 title:@"最美不过是你" detail:@"100天到永远" image:[UIImage imageNamed:@"3_28"] type:ZQPageModelTypeVeryShort blur:0];
            [tmp addObject:p];
        }
        _pageModels = [tmp copy];
    }
    return _pageModels;
}

@end
