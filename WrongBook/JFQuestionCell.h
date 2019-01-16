//
//  JFQuestionCell.h
//  WrongBook
//
//  Created by apple on 2017/7/16.
//  Copyright © 2017年 lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFTitleModel.h"


@interface JFQuestionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *question;

@property (weak, nonatomic) IBOutlet UIView *circleBall;

@property (weak, nonatomic) IBOutlet UILabel *object;



@end
