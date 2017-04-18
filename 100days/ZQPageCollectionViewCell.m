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
        
        [self lineView];
    }
    return self;
}

- (void)hideSubviewForAnimation
{
    self.dateView.hidden = YES;
    self.titleLabel.hidden = YES;
    self.detailLabel.hidden = YES;
    self.lineView.hidden = YES;
}

- (void)showSubviewAfterAnimation
{
    self.dateView.hidden = NO;
    self.titleLabel.hidden = NO;
    self.detailLabel.hidden = NO;
    self.lineView.hidden = NO;
}

- (void)showAnimation
{
    CGFloat duration = 0.6;
    
//    self.bgImageView.alpha = 0.0f;
    
    self.titleLabel.alpha = 0.f;
    self.detailLabel.alpha = 0.f;
    self.dateView.alpha = 0.f;
    
    self.titleLabel.transform = CGAffineTransformMakeTranslation(-10, 0);
    self.detailLabel.transform = CGAffineTransformMakeTranslation(-10, 0);
    self.dateView.transform = CGAffineTransformMakeTranslation(0, -30);
    
    self.lineView.alpha = 0.f;
    self.lineView.transform = CGAffineTransformMakeScale(0.1, 1);
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.bgImageView.alpha = 1.f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.dateView.transform = CGAffineTransformIdentity;
            self.dateView.alpha = 1.f;
        } completion:^(BOOL finished) {
            //        self.bgImageView.layer.mask = self.shapeLayer;

            [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                
                self.lineView.alpha = 1.f;
                self.lineView.transform = CGAffineTransformIdentity;

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
    style.alignment = label.textAlignment ? : NSTextAlignmentLeft;
    
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
            
            make.height.mas_equalTo(0.18 * HEIGHT_SCREEN);
            make.width.equalTo(self.dateView.mas_height).multipliedBy(0.5);
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
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        
        [self.contentView addSubview:_titleLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.equalTo(self.lineView);
            make.bottom.offset(-160);
        }];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
        
        _detailLabel.font = [UIFont defaultFontWithSize:13];
        _detailLabel.textAlignment = NSTextAlignmentLeft;
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

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        
        _lineView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_lineView];
        
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@1.f);
            make.width.equalTo(self.titleLabel.mas_width);
            make.left.offset(30);
        }];
    }
    return _lineView;
}

@end
