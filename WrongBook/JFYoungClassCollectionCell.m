//
//  JFYoungClassCollectionCell.m
//  WrongBook
//
//  Created by apple on 2017/7/18.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFYoungClassCollectionCell.h"

@implementation JFYoungClassCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.contentLabel.numberOfLines = 0;
    
    self.button.layer.cornerRadius = 10;
    self.button.clipsToBounds = YES;
    
    [self.button setBackgroundColor:RGB(255, 192, 93)];
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    
    
    
    // Initialization code
}

@end
