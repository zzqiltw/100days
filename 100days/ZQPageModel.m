//
//  ZQPageModel.m
//  100days
//
//  Created by 郑志勤 on 2017/3/31.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "ZQPageModel.h"

@implementation ZQPageModel

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

+ (instancetype)pageModelWithDate:(NSDate *)date title:(NSString *)title detail:(NSString *)detail image:(UIImage *)image type:(ZQPageModelType)type
{
    ZQPageModel *model = [[self alloc] init];
    
    
    
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
