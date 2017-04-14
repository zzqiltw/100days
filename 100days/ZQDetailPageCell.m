//
//  ZQDetailPageCell.m
//  100days
//
//  Created by 郑志勤 on 2017/4/14.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "ZQDetailPageCell.h"

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

@end
