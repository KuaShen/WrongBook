//
//  ZXView.h
//  折线图
//
//  Created by iOS on 16/6/28.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,lineDisplaystyle) {
LineDisplaystyleSelf,
 LineDisplaystyleOther,
  LineDisplaystyleAll
};
@interface ZXView : UIView
@property (nonatomic) lineDisplaystyle  lineDisplaystyle;
@property (nonatomic,strong)NSArray * dataArray;
@property (nonatomic,strong)NSArray * horizontalDateArray;
@property (nonatomic,strong)NSArray * verticalDateArray;
// 背景颜色
@property (nonatomic, strong) NSMutableArray *gradientLayerColors;
@property (nonatomic,strong)UIColor * LineColor;
@property (nonatomic,strong)NSArray * lineColorArray;
@property (nonatomic,strong)NSArray * lineNameArray;

- (instancetype)initWithFrame:(CGRect)frame;
@end
