//
//  JFTrendsTableCell.h
//  WrongBook
//
//  Created by apple on 2017/7/30.
//  Copyright © 2017年 lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFTrendsModel.h"


@interface JFTrendsTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *levelLabel;

@property (weak, nonatomic) IBOutlet UILabel *designationLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UIImageView *goodImageView;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;
//用来放点赞部件的
@property (weak, nonatomic) IBOutlet UIView *backView;

@property (nonatomic, strong) JFTrendsModel *model;

@end
