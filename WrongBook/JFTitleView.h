//
//  JFTitleView.h
//  WrongBook
//
//  Created by apple on 2017/8/1.
//  Copyright © 2017年 lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFHistoryTitleModel.h"

@interface JFTitleView : UIView

@property (nonatomic, strong) JFHistoryTitleModel *titleModel;

- (void)showInController:(JFBaseViewController *)rootViewController;

- (void)addData:(JFHistoryTitleModel *)model;

@end
