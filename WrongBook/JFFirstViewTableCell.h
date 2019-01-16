//
//  JFFirstViewTableCell.h
//  WrongBook
//
//  Created by apple on 2017/7/13.
//  Copyright © 2017年 lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFFirstViewModel.h"

@interface JFFirstViewTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *mainImage;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIImageView *skanImage;

@property (weak, nonatomic) IBOutlet UILabel *amount;


@end
