//
//  JFFirstViewModel.h
//  WrongBook
//
//  Created by apple on 2017/7/14.
//  Copyright © 2017年 lab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFFirstViewModel : NSObject

@property (nonatomic, strong) UIImage *mainImage;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *label;

@property (nonatomic, strong) UIImage *skanImage;

@property (nonatomic, copy) NSString *amount;

@property (nonatomic) CGFloat height;

@end
