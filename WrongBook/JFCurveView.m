//
//  JFCurveView.m
//  WrongBook
//
//  Created by apple on 2017/7/29.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFCurveView.h"
#import "ZXView.h"

@interface JFCurveView ()

@property (nonatomic, weak) JFBaseViewController *rootViewController;


@end

@implementation JFCurveView{
    ZXView * zx;
}


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
    
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 8, 5, 25)];
        imageView.image = [UIImage imageNamed:@"分类标记"];
        UILabel *titleL = [[UILabel alloc]initWithFrame:CGRectMake(View_X_WIDTH(imageView), 8, 100, 25)];
        titleL.text = @"学习曲线";
        titleL.textColor = [UIColor grayColor];
        titleL.font = FONT(15);
        
//        UIView *blueLine = [[UIView alloc]initWithFrame:CGRectMake(ScreenW/2, View_Y_HEIGHT(titleL)+5, 15, 2)];
//        blueLine.backgroundColor = [UIColor blueColor];
//        UILabel *blueLabel = [[UILabel alloc]initWithFrame:CGRectMake(View_X_WIDTH(blueLine)-5, View_Y_HEIGHT(titleL), 40, 20)];
//        blueLabel.text = @"今日题目";
//        
//        UIView *greenLine = [[UIView alloc]initWithFrame:CGRectMake(View_X_WIDTH(blueLabel), View_Y_HEIGHT(titleL)+5, 15, 2)];
//        greenLine.backgroundColor = [UIColor greenColor];
//        UILabel *greenLabel = [[UILabel alloc]initWithFrame:CGRectMake(View_X_WIDTH(greenLine)-5, View_Y_HEIGHT(titleL), 40, 20)];
//        greenLabel.text = @"掌握题目";
        
        
        zx = [[ZXView alloc]initWithFrame:CGRectMake(50, View_Y_HEIGHT(titleL), ScreenW-100, frame.size.height-titleL.frame.origin.y-titleL.frame.size.height-10)];
    
        
        [self addSubview:imageView];
        [self addSubview:titleL];
        [self addSubview:zx];
        
        
        
        
    }
    
    
    return self;
}

- (void)addChartData:(NSArray *)horizontalDateArray andDataArray:(NSArray *)dataArray{
    
    //横纵坐标赋值
    zx.horizontalDateArray = horizontalDateArray;
    zx.verticalDateArray = @[@"144",@"120",@"96",@"72",@"48",@"24",@"0"];
    //背景颜色
    zx.gradientLayerColors = [NSMutableArray arrayWithArray:@[(__bridge id)[UIColor colorWithRed:255 / 255.0 green:255 / 255.0 blue:255 / 255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:255 / 255.0 green:255 / 255.0 blue:255 / 255.0 alpha:1.0].CGColor]];
    //    [self.view addSubview:zx];
    //    zx.gradientLayerColors = [NSMutableArray arrayWithArray:@[(__bridge id)[UIColor blueColor].CGColor,(__bridge id)[UIColor whiteColor].CGColor]];
    
    //设置折线颜色
    //  zx.LineColor = [UIColor greenColor];
    zx.lineColorArray = @[RGB(207, 244, 241),RGB(107, 222, 213)];
    
    //设置折线的数据源
    zx.dataArray = dataArray;
    
    //设置line名称
    zx.lineNameArray = @[@"今日题目",@"掌握题目"];
    
}

- (void)loadModel:(JFCurveModel *)model{
    //横纵坐标赋值
    zx.horizontalDateArray = model.horizontalDateArray;
    zx.verticalDateArray = @[@"144",@"120",@"96",@"72",@"48",@"24",@"0"];
    //背景颜色
    zx.gradientLayerColors = [NSMutableArray arrayWithArray:@[(__bridge id)[UIColor colorWithRed:255 / 255.0 green:255 / 255.0 blue:255 / 255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:255 / 255.0 green:255 / 255.0 blue:255 / 255.0 alpha:1.0].CGColor]];
    //    [self.view addSubview:zx];
    //    zx.gradientLayerColors = [NSMutableArray arrayWithArray:@[(__bridge id)[UIColor blueColor].CGColor,(__bridge id)[UIColor whiteColor].CGColor]];
    
    //设置折线颜色
    //  zx.LineColor = [UIColor greenColor];
    zx.lineColorArray = @[ [UIColor greenColor],[UIColor blueColor]];
    
    //设置折线的数据源
    zx.dataArray = model.dataArray;
    
    //设置line名称
    zx.lineNameArray = @[@"今日题目",@"掌握题目"];

    
    
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
