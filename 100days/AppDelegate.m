//
//  AppDelegate.m
//  100days
//
//  Created by 郑志勤 on 2017/3/30.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "AppDelegate.h"
#import "ZQImageBrowserViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    NSMutableArray *tmp = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; ++i) {
        ZQPageModel *pageModel = [ZQPageModel new];
        pageModel.title = [NSString stringWithFormat:@"title%ld", i];
        pageModel.detail = [NSString stringWithFormat:@"detail%ld", i];
        pageModel.image = [UIImage imageNamed:@"Background"];
        [tmp addObject:pageModel];
    }
    
    ZQImageBrowserViewController *controller = [[ZQImageBrowserViewController alloc] initWithPageModels:[tmp copy]];
    self.window.rootViewController = controller;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
