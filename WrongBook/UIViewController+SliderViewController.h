//
//  UIViewController+SliderViewController.h
//  shudaixiongSTU
//
//  Created by apple on 2017/1/30.
//  Copyright © 2017年 lab. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SliderViewController;
@interface UIViewController (SliderViewController)

@property (nonatomic, strong) JFBaseNavigationController *navigationController;

/**
 获取侧滑控制器
 
 @return 侧滑控制器
 */
- (SliderViewController *)sliderViewController;


@end
