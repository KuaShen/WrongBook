//
//  AppDelegate.m
//  WrongBook
//
//  Created by apple on 2017/7/12.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "AppDelegate.h"
#import "JFTabbarController.h"
#import "SliderViewController.h"
#import "UIViewController+SliderViewController.h"
#import "JFLeftViewController.h"
#import "JFRightViewController.h"
//#import "JFFirstViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UIImageView *splashImageView;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    //初始化窗口试图
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    JFLeftViewController *leftVC = [[JFLeftViewController alloc]init];
    JFBaseNavigationController *nav = [[JFBaseNavigationController alloc]initWithRootViewController:leftVC];
    JFRightViewController *rightVC = [[JFRightViewController alloc]init];
    JFTabbarController *tabbar = [[JFTabbarController alloc]init];
//    JFBaseNavigationController *baseNav = [[JFBaseNavigationController alloc]initWithRootViewController:tabbar];
    SliderViewController *sliderVC = [[SliderViewController alloc] initWithMainViewController:tabbar leftViewController:nav rightViewController:nil];
    
    self.window.rootViewController = sliderVC;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    //闪屏模块
    self.window.rootViewController.view.alpha = 0;
    _splashImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"闪屏"]];
    _splashImageView.frame = [UIScreen mainScreen].bounds;
    [self.window addSubview:_splashImageView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.5 animations:^{
            self.window.rootViewController.view.alpha = 1.0;
        } completion:^(BOOL finished) {
            [_splashImageView removeFromSuperview];
        }];
    });
    
    
    
    
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
