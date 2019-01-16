//
//  SliderViewController.h
//  shudaixiongSTU
//
//  Created by apple on 2017/1/30.
//  Copyright © 2017年 lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderViewController : UIViewController

@property (nonatomic, strong, readonly) JFBaseViewController *mainViewController;
@property (nonatomic, strong, readonly) JFBaseViewController *leftViewController;
@property (nonatomic, strong, readonly) JFBaseViewController *rightViewController;

@property (nonatomic, strong, readonly) JFBaseNavigationController *sliderNavigationController; // push所需要的navigationController 只能由mainVC 提供

/**
 初始化侧滑菜单控制器
 
 @param mainVC  默认显示的界面，不可为空
 @param leftVC  左边界面
 @param rightVC 右边界面
 
 @return 带侧滑菜单的控制器
 */
- (instancetype)initWithMainViewController:(JFBaseViewController *)mainVC
                        leftViewController:(JFBaseViewController *)leftVC
                       rightViewController:(JFBaseViewController *)rightVC;

- (void)showLeft;

- (void)hideLeft;

- (void)showRight;

- (void)hideRight;

@end

