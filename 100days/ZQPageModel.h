//
//  ZQPageModel.h
//  100days
//
//  Created by 郑志勤 on 2017/3/31.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZQPageModelType) {
    ZQPageModelTypeVeryShort,
    ZQPageModelTypeSummary,
    ZQPageModelTypeDetail,
};

@interface ZQPageModel : NSObject

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detail;

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, assign) ZQPageModelType type;

@end
