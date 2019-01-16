//
//  JFDegreeView.m
//  WrongBook
//
//  Created by apple on 2017/7/29.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFDegreeView.h"

@interface JFDegreeView()

@property (nonatomic, strong) UILabel *allCount;

@property (nonatomic, strong) UILabel *degree;

@property (nonatomic, strong) UILabel *rate;

@property (nonatomic, weak) JFBaseViewController *rootViewController;


@end

@implementation JFDegreeView


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 8, 5, 25)];
        imageView.image = [UIImage imageNamed:@"分类标记"];
        UILabel *titleL = [[UILabel alloc]initWithFrame:CGRectMake(View_X_WIDTH(imageView), 8, 100, 25)];
        titleL.text = @"学习程度";
        titleL.textColor = [UIColor grayColor];
        titleL.font = FONT(15);
        
        _allCount = [[UILabel alloc]initWithFrame:CGRectMake(30, View_Y_HEIGHT(titleL)+10, ScreenW/2-50, 60)];
        _allCount.textAlignment = NSTextAlignmentCenter;
        _allCount.textColor = COLOR_MAIN;
        _allCount.font = FONT(40);
        UILabel *countL = [[UILabel alloc]initWithFrame:CGRectMake(30, View_Y_HEIGHT(_allCount)-10, ScreenW/2-50, 20)];
        countL.text = @"题目总数";
        countL.textAlignment = NSTextAlignmentCenter;
        countL.font = FONT(15);
        
        
        UILabel *degreeL = [[UILabel alloc]initWithFrame:CGRectMake(ScreenW/2, _allCount.frame.origin.y+10, 80, 20)];
        degreeL.text = @"掌握程度：";
        degreeL.textColor = RGB(255, 192, 93);
        degreeL.font = FONT(15);
        _degree = [[UILabel alloc]initWithFrame:CGRectMake(View_X_WIDTH(degreeL)-10, degreeL.frame.origin.y, 80, 20)];
        _degree.textColor = [UIColor grayColor];
        _degree.font = FONT(15);
        
        UILabel *rateL = [[UILabel alloc]initWithFrame:CGRectMake(degreeL.frame.origin.x, View_Y_HEIGHT(_degree), 65, 20)];
        rateL.text = @"错误率：";
        rateL.textColor = RGB(255, 192, 93);
        rateL.font = FONT(15);
        _rate = [[UILabel alloc]initWithFrame:CGRectMake(View_X_WIDTH(rateL)-10, rateL.frame.origin.y, 80, 20)];
        _rate.textColor = [UIColor grayColor];
        _rate.font = FONT(15);
        
        [self addSubview:imageView];
        [self addSubview:titleL];
        [self addSubview:_allCount];
        [self addSubview:countL];
        [self addSubview:degreeL];
        [self addSubview:_degree];
        [self addSubview:rateL];
        [self addSubview:_rate];
        
    }
    
    
    return self;
}


- (void)loadModel:(JFDegreeModel *)model{
    
    _allCount.text = model.titleConut;
    
    _rate.text = [NSString stringWithFormat:@"%.2f%%",[model.wrongCount floatValue]/[model.titleConut floatValue]*100];
    
    _degree.text = [NSString stringWithFormat:@"%.2f%%",(1-[model.wrongCount floatValue]/[model.titleConut floatValue])*100];
    
}


- (void)showInController:(JFBaseViewController *)rootViewController{
    
    _rootViewController = rootViewController;
    
    [_rootViewController.view addSubview:self];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
