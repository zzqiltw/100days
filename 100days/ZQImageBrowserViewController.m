//
//  ZQImageBrowserViewController.m
//  100days
//
//  Created by 郑志勤 on 2017/3/31.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "ZQImageBrowserViewController.h"
#import "ZQPageModel.h"
#import "ZQPageCollectionViewCell.h"
#import <Masonry/Masonry.h>

@interface ZQImageBrowserViewController ()

@property (nonatomic, strong) NSArray<ZQPageModel *> *pageModels;

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ZQImageBrowserViewController

- (instancetype)initWithPageModels:(NSArray<ZQPageModel *> *)pageModels {
    if (self = [super init]) {
        self.pageModels = pageModels;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:ZQPageCollectionViewCell.class forCellWithReuseIdentifier:NSStringFromClass(ZQPageCollectionViewCell.class)];
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.bounces = NO;
        _collectionView.pagingEnabled = YES;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgnu"
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
#pragma clang diagnostic pop
        [self.view addSubview:_collectionView];
        
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.top.offset(0);
        }];
    }
    return _collectionView;
}

@end

@interface ZQImageBrowserViewController(UICollectionView)<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation ZQImageBrowserViewController(UICollectionView)

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.pageModels.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, collectionView.bounds.size.height);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZQPageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(ZQPageCollectionViewCell.class) forIndexPath:indexPath];
 
    if (indexPath.row < self.pageModels.count) {
        [cell bindData:self.pageModels[indexPath.row]];
    }
    
    return cell;
}

@end
