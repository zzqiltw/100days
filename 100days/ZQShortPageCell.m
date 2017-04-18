//
//  ZQShortPageCell.m
//  100days
//
//  Created by 郑志勤 on 2017/4/14.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "ZQShortPageCell.h"
#import <Masonry/Masonry.h>



@interface ZQShortPageCell()


@end

@implementation ZQShortPageCell


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.lineView.hidden = NO;
    }
    return self;
}

- (void)layoutUI
{
    [super layoutUI];
    
    self.titleLabel.numberOfLines = 0;
    
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(50);
        make.top.offset(80);
        make.width.mas_equalTo(1.f);
        make.height.equalTo(self.titleLabel.mas_height);
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.lineView.mas_left).offset(-5);
        make.top.equalTo(self.lineView);
    }];

    [self.detailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineView.mas_right).offset(5);
        make.top.equalTo(self.lineView);
    }];
    
    
    [self.dateView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-20);
        make.bottom.offset(-20);
        
        make.height.mas_equalTo(0.18 * HEIGHT_SCREEN);
        make.width.equalTo(self.dateView.mas_height).multipliedBy(0.5);
    }];
}

- (void)bindData:(ZQPageModel *)pageModel
{
    [super bindData:pageModel];
    self.titleLabel.text = pageModel.verticalTitle;
    //    self.detailLabel.text = pageModel.detail;
    
    self.detailLabel.attributedText = [[NSAttributedString alloc] initWithString:pageModel.verticalDetail
                                                                          attributes:[self attributesForLabel:self.detailLabel]];
}

- (void)showAnimation
{
    CGFloat duration = 0.6;
    
    self.bgImageView.alpha = 0.0f;
    
    self.titleLabel.alpha = 0.f;
    self.detailLabel.alpha = 0.f;
    self.dateView.alpha = 0.f;
    
    self.titleLabel.transform = CGAffineTransformMakeTranslation(0, -10);
    self.detailLabel.transform = CGAffineTransformMakeTranslation(0, -10);
    self.dateView.transform = CGAffineTransformMakeTranslation(0, -30);
    
    self.lineView.alpha = 0.f;
    self.lineView.transform = CGAffineTransformMakeScale(1, 0.2);
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



@end


