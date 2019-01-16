//
//  JFAnalyseView.m
//  WrongBook
//
//  Created by apple on 2017/7/29.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFAnalyseView.h"
#import "SDAutoLayout.h"

@interface JFAnalyseView ()

@property (nonatomic, strong) UILabel *test;

@property (nonatomic, strong) UILabel *wrong;

@property (nonatomic, weak) JFBaseViewController *rootViewController;



@end

@implementation JFAnalyseView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
    
        self.backgroundColor = [UIColor whiteColor];
    
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 8, 5, 25)];
        imageView.image = [UIImage imageNamed:@"分类标记"];
        UILabel *titleL = [[UILabel alloc]initWithFrame:CGRectMake(View_X_WIDTH(imageView), 8, 100, 25)];
        titleL.text = @"学情分析";
        titleL.textColor = [UIColor grayColor];
        titleL.font = FONT(15);
        
        UILabel *testL = [[UILabel alloc]init];
        testL.text = @"常考点：";
        testL.textColor = RGB(255, 192, 93);
        testL.font = FONT(15);
        
        _test = [[UILabel alloc]init];
        _test.textColor = [UIColor grayColor];
        _test.numberOfLines = 0;
        _test.font = FONT(13);
        
        UILabel *wrongL = [[UILabel alloc]init];
        wrongL.text  = @"易错点：";
        wrongL.textColor = RGB(255, 192, 93);
        wrongL.font = FONT(15);
        
        _wrong = [[UILabel alloc]init];
        _wrong.textColor = [UIColor grayColor];
        _wrong.numberOfLines = 0;
        _wrong.font = FONT(13);
        
        [self addSubview:imageView];
        [self addSubview:titleL];
        [self addSubview:testL];
        [self addSubview:_test];
        [self addSubview:wrongL];
        [self addSubview:_wrong];
        
        testL.sd_layout
        .leftSpaceToView(imageView, 17)
        .topSpaceToView(titleL, 15)
        .widthIs(65)
        .heightIs(20);
        
        self.test.sd_layout
        .leftSpaceToView(testL, 0)
        .topEqualToView(testL)
        .rightSpaceToView(self, 20)
        .minHeightIs(20);
        
        wrongL.sd_layout
        .leftEqualToView(testL)
        .topSpaceToView(_test, 10)
        .widthIs(65)
        .heightIs(20);
        
        self.wrong.sd_layout
        .leftSpaceToView(wrongL, 0)
        .topEqualToView(wrongL)
        .rightSpaceToView(self, 20)
        .minHeightIs(20)
        .bottomSpaceToView(self, 20);
        
        
        
        
    }
    
    
    return self;
}

- (void)loadModel:(JFAnalyseModel *)model{
    
    _test.text = model.usualString;
    
    _wrong.text = model.wrongString;
    
    
    
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
