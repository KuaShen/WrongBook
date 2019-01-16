//
//  JFTrendsModel.h
//  WrongBook
//
//  Created by apple on 2017/7/30.
//  Copyright © 2017年 lab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFTrendsModel : NSObject

@property (nonatomic, strong) UIImage *headImage;

@property (nonatomic, strong) NSString *nikename;

@property (nonatomic, strong) NSString *level;

@property (nonatomic, strong) NSString *designation;

@property (nonatomic, strong) NSString *content;

@property (nonatomic, strong) NSString *date;

@property (nonatomic) NSInteger count;

@property (nonatomic, strong) NSMutableArray *imageArray;

@end
