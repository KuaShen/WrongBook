//
//  JFAnswerView.h
//  WrongBook
//
//  Created by apple on 2017/8/1.
//  Copyright © 2017年 lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFHistoryAnswerModel.h"

@interface JFAnswerView : UIView

@property (nonatomic, strong) JFHistoryAnswerModel *model;

- (void)addData:(JFHistoryAnswerModel *)model;

- (void)showInController:(JFBaseViewController *)rootViewController;

@end
