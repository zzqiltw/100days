
//
//  ZQSummaryPageCell.m
//  100days
//
//  Created by 郑志勤 on 2017/4/14.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "ZQSummaryPageCell.h"

#import <Masonry/Masonry.h>

#import "UIFont+ZQ.h"

@interface ZQSummaryPageCell()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;


@end

@implementation ZQSummaryPageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

        
    }
    return self;
}

- (void)showAnimation
{
    [super showAnimation];
    }


- (void)bindData:(ZQPageModel *)pageModel
{
    [super bindData:pageModel];
}

- (NSDictionary *)attributesForLabel:(UILabel *)label
{
    return [super attributesForLabel:label];
    
 
}





@end
