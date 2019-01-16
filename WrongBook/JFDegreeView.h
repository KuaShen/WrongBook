//
//  JFDegreeView.h
//  WrongBook
//
//  Created by apple on 2017/7/29.
//  Copyright © 2017年 lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFDegreeModel.h"

@interface JFDegreeView : UIView

- (void) loadModel:(JFDegreeModel *)model;

- (void)showInController:(JFBaseViewController *)rootViewController;

@end
