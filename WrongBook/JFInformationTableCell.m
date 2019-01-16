//
//  JFInformationTableCell.m
//  WrongBook
//
//  Created by apple on 2017/7/30.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFInformationTableCell.h"

@implementation JFInformationTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.title.numberOfLines= 2 ;
    
    self.content.numberOfLines = 2;
    
    self.label.numberOfLines = 1;
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
