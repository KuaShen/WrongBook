//
//  JFQuestionCell.m
//  WrongBook
//
//  Created by apple on 2017/7/16.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFQuestionCell.h"

@implementation JFQuestionCell

- (void)configure:(UITableViewCell *)cell
        customObj:(id)obj
        indexPath:(NSIndexPath *)indexPath
{
    JFTitleModel *myObj = (JFTitleModel *)obj ;
    JFQuestionCell *mycell = (JFQuestionCell *)cell ;
    mycell.question.text = myObj.question ;
    mycell.circleBall.backgroundColor = myObj.circleBallColor;
    mycell.object.text = myObj.object;
    if ([myObj.object isEqualToString:@"语文"]) {
        [mycell.circleBall setBackgroundColor:[UIColor redColor]];
        [mycell.object setTextColor:[UIColor redColor]];
    }else if ([myObj.object isEqualToString:@"数学"]) {
        [mycell.circleBall setBackgroundColor:[UIColor blueColor]];
        [mycell.object setTextColor:[UIColor blueColor]];
    }else if ([myObj.object isEqualToString:@"英语"]) {
        [mycell.circleBall setBackgroundColor:[UIColor purpleColor]];
        [mycell.object setTextColor:[UIColor purpleColor]];
    }else if ([myObj.object isEqualToString:@"地理"]) {
        [mycell.circleBall setBackgroundColor:[UIColor brownColor]];
        [mycell.object setTextColor:[UIColor brownColor]];
    }
    
    cell.backgroundColor = [UIColor whiteColor] ;
    
}

+ (CGFloat)getCellHeightWithCustomObj:(id)obj
                            indexPath:(NSIndexPath *)indexPath
{
    return ((JFTitleModel *)obj).height ;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    self.circleBall.layer.cornerRadius = 4;
    self.circleBall.clipsToBounds = YES;
    self.question.numberOfLines = 3;
//    self.question.preferredMaxLayoutWidth = 40;
    
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
