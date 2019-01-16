//
//  JFSliderTableCell.m
//  WrongBook
//
//  Created by apple on 2017/7/22.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFSliderTableCell.h"

@implementation JFSliderTableCell


- (void)configure:(UITableViewCell *)cell
        customObj:(id)obj
        indexPath:(NSIndexPath *)indexPath
{
    JFSliderModel *myObj = (JFSliderModel *)obj ;
    JFSliderTableCell *mycell = (JFSliderTableCell *)cell ;
    mycell.cellImage.image = myObj.cellImage;
    mycell.cellTitle.text = myObj.cellTitle;
    cell.backgroundColor = [UIColor whiteColor] ;
    
}

+ (CGFloat)getCellHeightWithCustomObj:(id)obj
                            indexPath:(NSIndexPath *)indexPath
{
    return ((JFSliderModel *)obj).height ;
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
