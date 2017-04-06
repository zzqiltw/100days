//
//  ZQPageListViewController.m
//  100days
//
//  Created by 郑志勤 on 2017/4/5.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "ZQPageListViewController.h"

#import "ZQImageBrowserViewController.h"

static NSString * const kZQPageListCellIdentifier = @"cell";

@interface ZQPageListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *listTableView;
@property (nonatomic, strong) ZQImageBrowserViewController *imageBrowserViewController;

@end

@implementation ZQPageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.listTableView registerClass:UITableViewCell.class forCellReuseIdentifier:kZQPageListCellIdentifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.pageModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kZQPageListCellIdentifier];
    
    ZQPageModel *pageModel = self.pageModels[indexPath.row];
    
    cell.textLabel.text = pageModel.title;
    cell.detailTextLabel.text = pageModel.detail;
    cell.imageView.image = pageModel.image;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.imageBrowserViewController.pageModels = self.pageModels;
    
    self.imageBrowserViewController.currentPageIndex = indexPath.row;
    
    [self.navigationController pushViewController:self.imageBrowserViewController animated:YES];
}

- (ZQImageBrowserViewController *)imageBrowserViewController
{
    if (!_imageBrowserViewController) {
        _imageBrowserViewController = [[ZQImageBrowserViewController alloc] init];
    }
    return _imageBrowserViewController;
}

- (UITableView *)listTableView
{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        
        [self.view addSubview:_listTableView];
    }
    return _listTableView;
}

@end
