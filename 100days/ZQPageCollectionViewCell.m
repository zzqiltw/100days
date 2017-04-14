//
//  ZQPageCollectionViewCell.m
//  100days
//
//  Created by 郑志勤 on 2017/3/31.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "ZQPageCollectionViewCell.h"
#import "UIImage+ZQ.h"
#import "ZQDateView.h"
#import <Masonry/Masonry.h>

#import "UIFont+ZQ.h"

@interface ZQPageCollectionViewCell()

@property (nonatomic, strong) ZQPageModel *pageModel;

@end

@implementation ZQPageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self bgImageView];
        
        [self dateView];
        
        [self titleLabel];
        
        [self detailLabel];
        
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

- (void)layoutUI
{
    
}

- (void)bindData:(ZQPageModel *)pageModel
{
    if (pageModel != _pageModel) {
        _pageModel = pageModel;
        
        self.titleLabel.text = pageModel.title;
        //    self.detailLabel.text = pageModel.detail;
        
        self.detailLabel.attributedText = [[NSAttributedString alloc] initWithString:pageModel.detail
                                                                          attributes:[self attributesForLabel:self.detailLabel]];
        self.bgImageView.image = [pageModel.image stackBlur:10];
        
        self.dateView.date = pageModel.date;
        self.dateView.title = pageModel.title;
    }
    
    [self layoutUI];
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

- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [UIImageView new];
        
        [self.contentView insertSubview:_bgImageView atIndex:0];
        
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.offset(0);
        }];
    }
    return _bgImageView;
}

- (ZQDateView *)dateView
{
    if (!_dateView) {
        _dateView = [[ZQDateView alloc] init];
        
        [self.contentView addSubview:_dateView];
        
        [_dateView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
            make.centerY.offset(-64);
            
            make.width.equalTo(@(0.2*WIDTH_SCREEN));
            make.height.equalTo(@(0.2*HEIGHT_SCREEN));
        }];
    }
    return _dateView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        
        _titleLabel.font = [UIFont defaultFontWithSize:15];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:_titleLabel];
        
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
        
        [self.contentView addSubview:_detailLabel];
        
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
            
            make.top.equalTo(self.titleLabel.mas_bottom).offset(30);
        }];
    }
    return _detailLabel;
}


@end
