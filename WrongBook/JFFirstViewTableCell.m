//
//  JFFirstViewTableCell.m
//  WrongBook
//
//  Created by apple on 2017/7/13.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFFirstViewTableCell.h"

@implementation JFFirstViewTableCell


- (void)configure:(UITableViewCell *)cell
        customObj:(id)obj
        indexPath:(NSIndexPath *)indexPath
{
    JFFirstViewModel *myObj = (JFFirstViewModel *)obj ;
    JFFirstViewTableCell *mycell = (JFFirstViewTableCell *)cell ;
    mycell.title.text = myObj.title ;
    mycell.label.text = myObj.label;
    mycell.amount.text = myObj.amount;
    mycell.mainImage.image = myObj.mainImage;
    mycell.skanImage.image = myObj.skanImage;
    cell.backgroundColor = [UIColor whiteColor] ;
    
}

+ (CGFloat)getCellHeightWithCustomObj:(id)obj
                            indexPath:(NSIndexPath *)indexPath
{
    return ((JFFirstViewModel *)obj).height ;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
