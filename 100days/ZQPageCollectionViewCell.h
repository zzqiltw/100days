//
//  ZQPageCollectionViewCell.h
//  100days
//
//  Created by 郑志勤 on 2017/3/31.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZQPageModel.h"
#import "ZQDateView.h"

#define WIDTH_SCREEN ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT_SCREEN ([UIScreen mainScreen].bounds.size.height)

@interface ZQPageCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) ZQDateView *dateView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;


- (void)bindData:(ZQPageModel *)pageModel;

- (void)showAnimation;

// override
- (NSDictionary *)attributesForLabel:(UILabel *)label;
- (void)layoutUI;
@end
