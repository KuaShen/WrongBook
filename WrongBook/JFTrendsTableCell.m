//
//  JFTrendsTableCell.m
//  WrongBook
//
//  Created by apple on 2017/7/30.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFTrendsTableCell.h"
#import "SDAutoLayout.h"

#import "PhotosContainerView.h"

@implementation JFTrendsTableCell{
    PhotosContainerView *_photosContainer;
}

- (void)awakeFromNib {
//    [super awakeFromNib];

    self.designationLabel.backgroundColor = RGB(255, 192, 93);
    self.designationLabel.textColor = [UIColor whiteColor];
    self.designationLabel.font = FONT(12);
    self.designationLabel.layer.cornerRadius = 7.5;
    self.designationLabel.layer.masksToBounds = YES;
    
    self.headImageView.layer.cornerRadius = 20;
    self.headImageView.layer.masksToBounds = YES;
    
    self.levelLabel.textColor = RGB(255, 192, 93);
    self.levelLabel.textAlignment = NSTextAlignmentCenter;
    
    self.titleLabel.font = FONT(14);
    
    self.contentLabel.font = FONT(15);
    
    self.dateLabel.font = FONT(13);
    
    self.contentLabel.font = FONT(14);
    
    PhotosContainerView *photosContainer = [[PhotosContainerView alloc] initWithMaxItemsCount:9];
    _photosContainer = photosContainer;
    [self.contentView addSubview:photosContainer];
    
//    self.contentLabel.font = [UIFont systemFontOfSize:15];
    self.contentLabel.textColor = [UIColor grayColor];
    
    self.headImageView.sd_layout
    .leftSpaceToView(self.contentView, 25)
    .topSpaceToView(self.contentView, 10)
    .widthIs(40)
    .heightEqualToWidth();
    
    self.titleLabel.sd_layout
    .leftSpaceToView(self.headImageView, 10)
    .topEqualToView(self.headImageView)
    .heightIs(30)
    .rightSpaceToView(self.contentView, 30);
    
    self.levelLabel.sd_layout
    .leftEqualToView(self.titleLabel)
    .topSpaceToView(self.titleLabel, 0)
    .heightIs(20)
    .widthIs(45);
    
    self.designationLabel.sd_layout
    .leftSpaceToView(self.levelLabel, 0)
    .topSpaceToView(self.titleLabel, 0)
    .widthIs(40)
    .heightIs(15);
    
    self.contentLabel.sd_layout
    .leftEqualToView(self.titleLabel)
    .topSpaceToView(self.levelLabel, 20)
    .rightSpaceToView(self.contentView, 25)
    .autoHeightRatio(0);
    
    _photosContainer.sd_layout
    .leftEqualToView(self.contentLabel)
    .rightEqualToView(self.contentLabel)
    .topSpaceToView(self.contentLabel, 10); // 高度自适应了，不需要再设置约束
    
    self.dateLabel.sd_layout
    .bottomSpaceToView(self.contentView, 15)
    .leftEqualToView(self.titleLabel)
    .heightIs(20);
    [self.dateLabel setSingleLineAutoResizeWithMaxWidth:150];
    
    self.backView.sd_layout
    .rightSpaceToView(self.contentView, 25)
    .bottomEqualToView(self.dateLabel)
    .widthIs(66)
    .heightIs(22);
    
    self.goodImageView.sd_layout
    .leftEqualToView(self.backView)
    .topEqualToView(self.backView)
    .bottomEqualToView(self.backView)
    .widthIs(22);
    
    self.countLabel.sd_layout
    .rightEqualToView(self.backView)
    .topEqualToView(self.backView)
    .bottomEqualToView(self.backView)
    .leftEqualToView(self.goodImageView);
    
    // Initialization code
}

- (void)setModel:(JFTrendsModel *)model{
    
    _model = model;
    _headImageView.image = model.headImage;
    _titleLabel.text = model.nikename;
    _levelLabel.text = model.level;
    _designationLabel.text = model.designation;
    _contentLabel.text = model.content;
    _dateLabel.text = model.date;
    _countLabel.text = [NSString stringWithFormat:@"%ld",model.count];
    
    
    UIView *bottomView = _contentLabel;
    
    _photosContainer.photoNamesArray = model.imageArray;
    if (model.imageArray.count > 0) {
        _photosContainer.hidden = NO;
        bottomView = _photosContainer;
    } else {
        _photosContainer.hidden = YES;
    }
    
    
    [self setupAutoHeightWithBottomView:bottomView bottomMargin:50];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
