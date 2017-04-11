//
//  ZQPageView.m
//  100days
//
//  Created by 郑志勤 on 2017/4/6.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "ZQPageView.h"
#import "UIImage+ZQ.h"
#import "ZQDateView.h"
#import "UIFont+ZQ.h"
#import <Masonry/Masonry.h>

#define WIDTH_SCREEN ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT_SCREEN ([UIScreen mainScreen].bounds.size.height)

@interface ZQPageView()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIImageView *bgImageView;

//@property (nonatomic, strong) UIImageView *visiableImageView;

@property (nonatomic, strong) ZQDateView *dateView;

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation ZQPageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self bgImageView];
        
        [self titleLabel];
        
        [self detailLabel];
        
        //        [self visiableImageView];
        
        [self dateView];
    }
    return self;
}

- (void)showAnimation
{
    CGFloat duration = 0.6;

    self.bgImageView.alpha = 0.0f;
    
    self.titleLabel.alpha = 0.f;
    self.detailLabel.alpha = 0.f;
    self.dateView.alpha = 0.f;
    
    
    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.bgImageView.alpha = 1.f;
    } completion:^(BOOL finished) {
//        self.bgImageView.layer.mask = self.shapeLayer;

        self.titleLabel.transform = CGAffineTransformMakeTranslation(0, 30);
        self.detailLabel.transform = CGAffineTransformMakeTranslation(0, 30);
        self.dateView.transform = CGAffineTransformMakeTranslation(0, -30);
        
        
        [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.dateView.transform = CGAffineTransformIdentity;
            self.dateView.alpha = 1.f;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.titleLabel.alpha = 1.f;
                self.titleLabel.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    self.detailLabel.alpha = 1.f;
                    self.detailLabel.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {
                    
                }];
            }];
        }];

    }];
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

- (void)bindData:(ZQPageModel *)pageModel
{
    self.titleLabel.text = pageModel.title;
    //    self.detailLabel.text = pageModel.detail;
    
    self.detailLabel.attributedText = [[NSAttributedString alloc] initWithString:pageModel.detail
                                                                      attributes:[self attributesForLabel:self.detailLabel]];
    self.bgImageView.image = [pageModel.image stackBlur:10];
    //    self.bgImageView.image = pageModel.image;
    //    self.visiableImageView.image = pageModel.image;
    self.dateView.date = pageModel.date;
    self.dateView.title = pageModel.title;
}

- (NSDictionary *)attributesForLabel:(UILabel *)label
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    
    attributes[NSFontAttributeName] = label.font ? : [UIFont defaultFontWithSize:15];
    attributes[NSForegroundColorAttributeName] = label.textColor ? : [UIColor whiteColor];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineSpacing = 6;
    style.alignment = NSTextAlignmentCenter;
    
    attributes[NSParagraphStyleAttributeName] = style;
    
    return [attributes copy];
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        
        _titleLabel.font = [UIFont defaultFontWithSize:15];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_titleLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
            
            make.bottom.offset(-160);
        }];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
        
        _detailLabel.font = [UIFont defaultFontWithSize:16];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.textColor = [UIColor whiteColor];
        
        _detailLabel.numberOfLines = 0;
        
        [self addSubview:_detailLabel];
        
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
            
            make.top.equalTo(self.titleLabel.mas_bottom).offset(30);
        }];
    }
    return _detailLabel;
}

- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [UIImageView new];
        
        [self insertSubview:_bgImageView atIndex:0];
        
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.offset(0);
        }];
    }
    return _bgImageView;
}
//
//- (UIImageView *)visiableImageView
//{
//    if (!_visiableImageView) {
//        _visiableImageView = [[UIImageView alloc] init];
//
//        _visiableImageView.layer.borderWidth = 2.f;
//        _visiableImageView.layer.masksToBounds = YES;
//        _visiableImageView.layer.cornerRadius = kZQPageImageViewWH * 0.5;
//        _visiableImageView.layer.borderColor = [UIColor whiteColor].CGColor;
//
//        [self.contentView addSubview:_visiableImageView];
//
//        [_visiableImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.offset(100);
//
//            make.centerX.offset(0);
//
//            make.width.height.equalTo(@(kZQPageImageViewWH));
//        }];
//    }
//    return _visiableImageView;
//}

- (ZQDateView *)dateView
{
    if (!_dateView) {
        _dateView = [[ZQDateView alloc] init];
        
        [self addSubview:_dateView];
        
        [_dateView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
            make.centerY.offset(-64);
            
//            make.centerY.offset(0);
//            make.right.offset(-10);
            make.width.equalTo(@(0.2*WIDTH_SCREEN));
            make.height.equalTo(@(0.2*HEIGHT_SCREEN));
        }];
    }
    return _dateView;
}


@end
