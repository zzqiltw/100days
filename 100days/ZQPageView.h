//
//  ZQPageView.h
//  100days
//
//  Created by 郑志勤 on 2017/4/6.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZQPageModel.h"

@interface ZQPageView : UIView

- (void)bindData:(ZQPageModel *)pageModel;

- (void)showAnimation;

@end
