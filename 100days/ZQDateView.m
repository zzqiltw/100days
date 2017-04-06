//
//  ZQDateView.m
//  100days
//
//  Created by 郑志勤 on 2017/4/6.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "ZQDateView.h"
#import "NSDate+ZQ.h"
#import "UIFont+ZQ.h"
#import <Masonry/Masonry.h>

static CGFloat const kZQDataLabelHeight = 32;

@interface ZQDateView()

@property (nonatomic, strong) CAShapeLayer *borderLayer;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) UILabel *monthLabel;
@property (nonatomic, strong) UILabel *yearLabel;

@end

@implementation ZQDateView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [self borderLayer];
        
        [self titleLabel];
        
        [self dayLabel];
        [self monthLabel];
        [self yearLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.borderLayer.frame = self.bounds;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:self.bounds];
    bezierPath.lineWidth = 4.f;
    self.borderLayer.path = bezierPath.CGPath;
}

- (void)setDate:(NSDate *)date
{
    _date = date;
    
    self.dayLabel.text = [NSString stringWithFormat:@"%02ld", date.day];
    self.monthLabel.text = date.shortCallForMonth;
    self.yearLabel.text = [NSString stringWithFormat:@"%ld", date.year];
}

- (void)setTitle:(NSString *)title
{
    _title = [title copy];
    
    self.titleLabel.text = title;
}

- (UILabel *)dayLabel
{
    if (!_dayLabel) {
        _dayLabel = [[UILabel alloc] init];
        _dayLabel.font = [UIFont defaultFontWithSize:36];
        _dayLabel.textAlignment = NSTextAlignmentCenter;
        _dayLabel.textColor = [UIColor whiteColor];
        _dayLabel.backgroundColor = [UIColor clearColor];
        
        [self addSubview:_dayLabel];
        
        [_dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset(0);
            make.top.offset(5);
        }];
    }
    return _dayLabel;
}

- (UILabel *)monthLabel
{
    if (!_monthLabel) {
        _monthLabel = [[UILabel alloc] init];
        _monthLabel.font = [UIFont defaultFontWithSize:18];
        _monthLabel.textAlignment = NSTextAlignmentCenter;
        _monthLabel.textColor = [UIColor whiteColor];
        _monthLabel.backgroundColor = [UIColor clearColor];
        
        [self addSubview:_monthLabel];
        
        [_monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset(0);
            make.top.equalTo(self.dayLabel.mas_bottom).offset(0);
        }];
    }
    return _monthLabel;
}

- (UILabel *)yearLabel
{
    if (!_yearLabel) {
        _yearLabel = [[UILabel alloc] init];
        _yearLabel.font = [UIFont defaultFontWithSize:15];
        _yearLabel.textColor = [UIColor whiteColor];
        _yearLabel.textAlignment = NSTextAlignmentCenter;
        _yearLabel.backgroundColor = [UIColor clearColor];
        
        [self addSubview:_yearLabel];
        
        [_yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.monthLabel.mas_bottom).offset(5);
            make.left.right.offset(0);
            make.bottom.equalTo(self.titleLabel.mas_top).offset(-5);
        }];
    }
    return _yearLabel;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont defaultFontWithSize:13];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor blackColor];
        
        [self addSubview:_titleLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset(0);
            make.bottom.offset(0);
            make.height.equalTo(@(kZQDataLabelHeight));
        }];
    }
    return _titleLabel;
}

- (CAShapeLayer *)borderLayer
{
    if (!_borderLayer) {
        _borderLayer = [[CAShapeLayer alloc] init];
        
        _borderLayer.fillColor = [UIColor clearColor].CGColor;
        _borderLayer.strokeColor = [UIColor whiteColor].CGColor;
        
        [self.layer addSublayer:_borderLayer];
    }
    return _borderLayer;
}

@end
