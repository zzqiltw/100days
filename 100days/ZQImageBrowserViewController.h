//
//  ZQImageBrowserViewController.h
//  100days
//
//  Created by 郑志勤 on 2017/3/31.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZQPageModel.h"
@interface ZQImageBrowserViewController : UIViewController

- (instancetype)initWithPageModels:(NSArray<ZQPageModel *> *)pageModels;

@end