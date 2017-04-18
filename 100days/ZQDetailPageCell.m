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

//@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@property (nonatomic, strong) UIView *topLineView;
@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation ZQDetailPageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.topLineView = [[UIView alloc] init];
        self.topLineView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.topLineView];
        
        
        self.bottomLineView = [[UIView alloc] init];
        self.bottomLineView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.bottomLineView];
        self.bottomLineView.hidden = YES;
        
        self.lineView.hidden = NO;
        
        [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
    }
    return self;
}
//
//- (CAShapeLayer *)shapeLayer
//{
//    if (!_shapeLayer) {
//        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//
//        CGFloat shortHeight = 0.56 * HEIGHT_SCREEN;
//        CGFloat longHeight = 0.68 * HEIGHT_SCREEN;
//
//        UIBezierPath *path = [UIBezierPath bezierPath];
//        [path moveToPoint:CGPointZero];
//        [path addLineToPoint:CGPointMake(0, longHeight)];
//        [path addLineToPoint:CGPointMake(WIDTH_SCREEN, shortHeight)];
//        [path addLineToPoint:CGPointMake(WIDTH_SCREEN, 0)];
//        [path closePath];
//        shapeLayer.path = path.CGPath;
//
//        _shapeLayer = shapeLayer;
//    }
//    return _shapeLayer;
//}

- (void)showSubviewAfterAnimation
{
    [super showSubviewAfterAnimation];
    self.topLineView.hidden = NO;
}

- (void)hideSubviewForAnimation
{
    [super hideSubviewForAnimation];
    self.topLineView.hidden = YES;
}

- (void)layoutUI
{
    [super layoutUI];
    
//    self.titleLabel.textColor = [UIColor blackColor];
//    self.detailLabel.textColor = [UIColor blackColor];
//    self.lineView.backgroundColor = [UIColor blackColor];

    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.bottom.offset(-180);
    }];
    
    self.detailLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
        make.width.equalTo(@14);
        make.height.mas_equalTo(0.5f / [UIScreen mainScreen].scale);
    }];
    
    [self.topLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.left.offset(30);
        make.right.offset(-30);
        make.bottom.equalTo(self.titleLabel.mas_top).offset(-30);
    }];
    
    [self.bottomLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.left.equalTo(self.topLineView);
        make.right.equalTo(self.topLineView);
        make.top.equalTo(self.detailLabel.mas_bottom).offset(30);
    }];
}

- (void)showAnimation
{
    [super showAnimation];
    
    self.topLineView.transform = CGAffineTransformMakeScale(0.1, 1);
    self.topLineView.alpha = 0.0f;
    [UIView animateWithDuration:0.6 delay:0.6 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.topLineView.transform = CGAffineTransformIdentity;
        self.topLineView.alpha = 1.f;
    } completion:^(BOOL finished) {
        
    }];
}


@end
