//
//  NSDate+ZQ.m
//  100days
//
//  Created by 郑志勤 on 2017/4/6.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "NSDate+ZQ.h"

@implementation NSDate (ZQ)

- (NSDateComponents *)dateComponents
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:self];
}

- (NSInteger)year
{
    return [self dateComponents].year;
}

- (NSInteger)month
{
    return [self dateComponents].month;
}

- (NSInteger)day
{
    return [self dateComponents].day;
}

- (NSString *)shortCallForMonth
{
    switch (self.month) {
        case 1:
            return @"Jan.";
            break;
        case 2:
            return @"Feb.";
            break;
        case 3:
            return @"Mar.";
            break;
        case 4:
            return @"Apr.";
            break;
        case 5:
            return @"May.";
            break;
        case 6:
            return @"Jun.";
            break;
        case 7:
            return @"Jul.";
            break;
        case 8:
            return @"Aug.";
            break;
        case 9:
            return @"Sept.";
            break;
        case 10:
            return @"Oct.";
            break;
        case 11:
            return @"Nov.";
            break;
        case 12:
            return @"Dec.";
            break;
            
        default:
            break;
    }
    
    return @"";
}

@end
