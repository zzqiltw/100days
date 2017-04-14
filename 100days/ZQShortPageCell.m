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

@property (nonatomic, strong) UIView *lineView;

@end

@implementation ZQShortPageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self lineView];
    }
    return self;
}

- (void)layoutUI
{
    [super layoutUI];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.lineView.mas_top).offset(-5);
        make.left.equalTo(self.lineView.mas_left);
    }];
    
    [self.detailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom).offset(5);
        make.left.equalTo(self.lineView.mas_left);
    }];
    
    [self.dateView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-10);
        make.top.offset(10);
    }];
}

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        
        _lineView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_lineView];
        
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(30);
            make.height.equalTo(@1.f);
            make.width.equalTo(@20);
        }];
    }
    return _lineView;
}

@end


