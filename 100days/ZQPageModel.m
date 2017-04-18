//
//  ZQPageModel.m
//  100days
//
//  Created by 郑志勤 on 2017/3/31.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "ZQPageModel.h"


@implementation ZQPageModel

static inline NSDateFormatter *ZQSharedDateFormatter(NSString *dateFormat) {
    static dispatch_once_t onceToken;
    static NSDateFormatter *formatter = nil;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
    });
    formatter.dateFormat = dateFormat;
    return formatter;
}

static inline NSString * ZQVerticalString(NSString *originalString) {
    NSMutableString *str = [NSMutableString string];
    
    for (NSInteger i = 0; i < originalString.length; ++i) {
        NSString *sub = [originalString substringWithRange:NSMakeRange(i, 1)];
        
        [str appendString:sub];
        
        [str appendString:@"\n"];
    }
    
    if (originalString.length > 0) {
        [str deleteCharactersInRange:NSMakeRange(str.length - 1, 1)];
    }
    
    return [str copy];
}

+ (instancetype)pageModelWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day title:(NSString *)title detail:(NSString *)detail image:(UIImage *)image type:(ZQPageModelType)type
{
    ZQPageModel *model = [[self alloc] init];
    
    NSString *dateString = [NSString stringWithFormat:@"%ld-%ld-%ld", year, month, day];
    
    model.date = [ZQSharedDateFormatter(@"yyyy-MM-dd") dateFromString:dateString];
    model.title = title;
    model.detail = detail;
    model.image = image;
    
    model.type = type;
    
    return model;
}

- (NSString *)verticalTitle
{
    return ZQVerticalString(self.title);
}

- (NSString *)verticalDetail
{
    return ZQVerticalString(self.detail);
}

@end
