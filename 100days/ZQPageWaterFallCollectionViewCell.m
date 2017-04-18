
//
//  ZQPageWaterFallCollectionViewCell.m
//  100days
//
//  Created by 郑志勤 on 2017/4/18.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "ZQPageWaterFallCollectionViewCell.h"
#import <Masonry/Masonry.h>
#import "UIFont+ZQ.h"

@interface ZQPageWaterFallCollectionViewCell()

@property (nonatomic, strong) UIImageView *photoImageView;
@property (nonatomic, strong) UILabel *dateLabel;

@end

@implementation ZQPageWaterFallCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)setPageModel:(ZQPageModel *)pageModel
{
    _pageModel = pageModel;
    
    self.photoImageView.image = pageModel.thumnailImage;
    self.dateLabel.text = pageModel.dateString;
}

- (UIImageView *)photoImageView
{
    if (!_photoImageView) {
        _photoImageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:_photoImageView];
        
        [_photoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
    }
    return _photoImageView;
}

- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
        
        _dateLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        _dateLabel.font = [UIFont defaultFontWithSize:15];
        _dateLabel.textColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_dateLabel];
        
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.photoImageView.mas_bottom);
            make.height.equalTo(@30);
            make.left.right.offset(0);
        }];
    }
    return _dateLabel;
}

@end
