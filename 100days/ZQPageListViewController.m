//
//  ZQPageListViewController.m
//  100days
//
//  Created by 郑志勤 on 2017/4/5.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "ZQPageListViewController.h"

#import "ZQImageBrowserViewController.h"
#import <CHTCollectionViewWaterfallLayout/CHTCollectionViewWaterfallLayout.h>
#import "ZQPageWaterFallCollectionViewCell.h"

static NSString * const kZQPageListCellIdentifier = @"cell";

@interface ZQPageListViewController ()<CHTCollectionViewDelegateWaterfallLayout, UICollectionViewDataSource, UICollectionViewDelegate>

//@property (nonatomic, strong) UITableView *listTableView;
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) ZQImageBrowserViewController *imageBrowserViewController;

@end

@implementation ZQPageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:ZQPageWaterFallCollectionViewCell.class forCellWithReuseIdentifier:NSStringFromClass(ZQPageWaterFallCollectionViewCell.class)];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.pageModels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZQPageWaterFallCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(ZQPageWaterFallCollectionViewCell.class) forIndexPath:indexPath];
    cell.pageModel = self.pageModels[indexPath.item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZQPageModel *pageModel = self.pageModels[indexPath.item];
    
    return pageModel.thumnailImage.size;
}

- (void)openBrowserForIndexPath:(NSIndexPath *)indexPath
{
    ZQImageBrowserViewController *imageBrowserViewController = [[ZQImageBrowserViewController alloc] init];
    
    imageBrowserViewController.pageModels = self.pageModels;
    imageBrowserViewController.currentPageIndex = indexPath.row;
    
    [self presentViewController:imageBrowserViewController animated:YES completion:^{
        
    }];
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

@end
