//
//  ZQPageListViewController.h
//  100days
//
//  Created by 郑志勤 on 2017/4/5.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZQPageModel.h"

@interface ZQPageListViewController : UIViewController

@property (nonatomic, strong) NSArray<ZQPageModel *> *pageModels;

@end
