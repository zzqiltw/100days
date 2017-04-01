//
//  ZQPageCollectionViewCell.m
//  100days
//
//  Created by 郑志勤 on 2017/3/31.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "ZQPageCollectionViewCell.h"
#import "UIImage+ZQ.h"
#import <Masonry/Masonry.h>

static CGFloat const kZQPageImageViewWH = 140;

@interface ZQPageCollectionViewCell()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, strong) UIImageView *visiableImageView;

@end

@implementation ZQPageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self bgImageView];

        [self titleLabel];
        
        [self detailLabel];
        
        [self visiableImageView];
        
        self.layer.shouldRasterize = YES;
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    }
    return self;
}

- (void)bindData:(ZQPageModel *)pageModel
{
    self.titleLabel.text = pageModel.title;
    self.detailLabel.text = pageModel.detail;
    self.bgImageView.image = [pageModel.image stackBlur:70];
    self.visiableImageView.image = pageModel.image;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        
//        _titleLabel.textColor = [UIColor redColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        
        [self.contentView addSubview:_titleLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
            
            make.top.equalTo(self.visiableImageView.mas_bottom).offset(30);
        }];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
        
//        _detailLabel.textColor = [UIColor redColor];
        _detailLabel.font = [UIFont systemFontOfSize:16];
        
        [self.contentView addSubview:_detailLabel];
        
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
        
        [self.contentView insertSubview:_bgImageView atIndex:0];
        
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.offset(0);
        }];
    }
    return _bgImageView;
}

- (UIImageView *)visiableImageView
{
    if (!_visiableImageView) {
        _visiableImageView = [[UIImageView alloc] init];
        
        _visiableImageView.layer.borderWidth = 2.f;
        _visiableImageView.layer.masksToBounds = YES;
        _visiableImageView.layer.cornerRadius = kZQPageImageViewWH * 0.5;
        _visiableImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        
        [self.contentView addSubview:_visiableImageView];
        
        [_visiableImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(100);
            
            make.centerX.offset(0);
            
            make.width.height.equalTo(@(kZQPageImageViewWH));
        }];
    }
    return _visiableImageView;
}
@end
