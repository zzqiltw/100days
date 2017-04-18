//
//  ZQDetailPageCell.m
//  100days
//
//  Created by 郑志勤 on 2017/4/14.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "ZQDetailPageCell.h"
#import <Masonry/Masonry.h>
@interface ZQDetailPageCell()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation ZQDetailPageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.bgImageView.layer.mask = self.shapeLayer;
        
        self.lineView.hidden = NO;
    }
    return self;
}

- (CAShapeLayer *)shapeLayer
{
    if (!_shapeLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];

        CGFloat shortHeight = 0.56 * HEIGHT_SCREEN;
        CGFloat longHeight = 0.68 * HEIGHT_SCREEN;

        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointZero];
        [path addLineToPoint:CGPointMake(0, longHeight)];
        [path addLineToPoint:CGPointMake(WIDTH_SCREEN, shortHeight)];
        [path addLineToPoint:CGPointMake(WIDTH_SCREEN, 0)];
        [path closePath];
        shapeLayer.path = path.CGPath;

        _shapeLayer = shapeLayer;
    }
    return _shapeLayer;
}

- (void)layoutUI
{
    [super layoutUI];
    
    self.titleLabel.textColor = [UIColor blackColor];
    self.detailLabel.textColor = [UIColor blackColor];
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.bottom.offset(-160);
    }];
    
    self.detailLabel.textAlignment = NSTextAlignmentCenter;
    
    self.lineView.backgroundColor = [UIColor blackColor];
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
        make.width.equalTo(@14);
        make.height.mas_equalTo(2.f / [UIScreen mainScreen].scale);
    }];
}

@end
