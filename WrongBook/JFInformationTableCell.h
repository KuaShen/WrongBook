//
//  JFInformationTableCell.h
//  WrongBook
//
//  Created by apple on 2017/7/30.
//  Copyright © 2017年 lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFInformationTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *content;

@property (weak, nonatomic) IBOutlet UILabel *label;

@end
