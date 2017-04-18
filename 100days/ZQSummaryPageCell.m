
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
    self = [super initWithFrame:frame];
    if (self) {
        self.lineView.hidden = NO;
    }
    return self;
}

- (void)layoutUI
{
    [super layoutUI];
    
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.lineView.mas_top).offset(-5);
        make.left.equalTo(self.lineView.mas_left);
    }];
    
    [self.detailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom).offset(5);
        make.right.offset(-20);
    }];
    
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.detailLabel.mas_left);
        make.centerY.offset(-20);
        make.width.equalTo(self.titleLabel.mas_width);
        make.height.mas_equalTo(1.f / [UIScreen mainScreen].scale);
    }];
    
    [self.dateView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.top.offset(44);
        make.height.mas_equalTo(0.18 * HEIGHT_SCREEN);
        make.width.equalTo(self.dateView.mas_height).multipliedBy(0.5);
    }];
    
}

@end
