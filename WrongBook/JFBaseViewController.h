//
//  JFBaseViewController.h
//  WrongBook
//
//  Created by apple on 2017/7/13.
//  Copyright © 2017年 lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "JFBaseNavigationController.h"

@interface JFBaseViewController : UIViewController

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic, strong) JFBaseNavigationController *navigationController;

@property (nonatomic) BOOL isSearch;

- (void)setSearchBar;
- (void)setLeftItem;
- (void)setRightItem;

- (void)textStateHUD:(NSString *)text;
-(void)imageStateHUD:(NSString *)imageName title:(NSString *)title;
- (void)textStateHUD:(NSString *)text afterDelay:(NSTimeInterval)delay;

- (void)toLogInView;


@end
