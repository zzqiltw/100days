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

@interface ZQImageBrowserViewController ()<UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>


@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ZQImageBrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.modalTransitionStyle = UIModalPresentationCustom;
    self.transitioningDelegate = self;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:ZQPageCollectionViewCell.class forCellWithReuseIdentifier:NSStringFromClass(ZQPageCollectionViewCell.class)];
    
    [self.collectionView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanGesture:)]];
}

- (void)onPanGesture:(UIGestureRecognizer *)panGesture
{
    if (panGesture.state == UIGestureRecognizerStateRecognized) {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

- (void)setCurrentPageIndex:(NSInteger)currentPageIndex
{
    if (_currentPageIndex != currentPageIndex) {
        _currentPageIndex = currentPageIndex;
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_currentPageIndex inSection:0];
        
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    }
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
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
        
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.top.offset(0);
        }];
    }
    return _collectionView;
}

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

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    [(ZQPageCollectionViewCell *)cell showAnimation];
}

#pragma mark - 转场
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                   presentingController:(UIViewController *)presenting
                                                                       sourceController:(UIViewController *)source
{
    return self;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return UINavigationControllerHideShowBarDuration * 2;
//    return 1.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    ZQImageBrowserViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ZQImageBrowserViewController *to = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    containerView.backgroundColor = [UIColor whiteColor];
    if ([to isKindOfClass:[ZQImageBrowserViewController class]]) {     // presenting
        to.view.frame = containerView.bounds;
        to.view.alpha = 0.1f;
        [containerView addSubview:to.view];
        
        to.view.transform = CGAffineTransformMakeScale(0.8, 0.8);

        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             to.view.alpha = 1.f;
                             to.view.transform = CGAffineTransformIdentity;
                         }
                         completion:^(BOOL finished) {
                             [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
                             
                         }];
    } else if ([from isKindOfClass:[ZQImageBrowserViewController class]]) { // dismissing
        
        UIView *snapShot = [to.view snapshotViewAfterScreenUpdates:YES];
        snapShot.frame = containerView.bounds;
        [containerView insertSubview:snapShot belowSubview:from.view];
        
        from.view.alpha = 1.f;

        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             from.view.transform = CGAffineTransformMakeScale(1.3, 1.3);
                             from.view.alpha = 0.1f;
                         }
                         completion:^(BOOL finished) {
                             [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
                         }];
    }
}
@end
