//
//  ZQPageDataSet.h
//  100days
//
//  Created by 郑志勤 on 2017/4/5.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZQPageModel.h"

@interface ZQPageDataSet : NSObject

+ (instancetype)shareDataSet;

@property (nonatomic, strong) NSArray<ZQPageModel *> *pageModels;

@end
