//
//  JFSliderBackground.h
//  WrongBook
//
//  Created by apple on 2017/7/19.
//  Copyright © 2017年 lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFSliderBackground : UIView

@property (nonatomic, strong) UIImage *headImage;

@property (nonatomic, copy) NSString *nikename;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *days;

- (void)setupNikeName:(NSString *)nikename andLV:(NSString *)level andDays:(NSString *)days andHeadImage:(UIImage *)headImage;

@end
