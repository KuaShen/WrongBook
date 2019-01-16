//
//  JFCurveView.h
//  WrongBook
//
//  Created by apple on 2017/7/29.
//  Copyright © 2017年 lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFCurveModel.h"

@interface JFCurveView : UIView

- (void)loadModel:(JFCurveModel *)model;

- (void)addChartData:(NSArray *)horizontalDateArray andDataArray:(NSArray *)dataArray;

- (void)showInController:(JFBaseViewController *)rootViewController;

@end
