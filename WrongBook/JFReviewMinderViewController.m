//
//  JFReviewMinderViewController.m
//  WrongBook
//
//  Created by apple on 2017/7/24.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFReviewMinderViewController.h"

#import "JFForgetCurve.h"
#import "JFCustomView.h"


@interface JFReviewMinderViewController (){
    
    UIView *curveView;
    UIView *customView;
    JFForgetCurve *forgetCurveView;
    JFCustomView *myCustomView;
    
    UIImageView *curveImageView;
    UIImageView *customImageView;
    
    BOOL curveSelected;
    BOOL customSelected;
}

@end

@implementation JFReviewMinderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_BACKGROUND;
    self.navigationController.navigationBarHidden = NO;
    curveSelected = YES;
    customSelected = NO;
    
    [self setUI];
    
    // Do any additional setup after loading the view.
}

- (void)setUI{
    self.view.backgroundColor = COLOR_BACKGROUND;
    
    curveView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 44)];
    curveView.backgroundColor = [UIColor whiteColor];
    curveView.userInteractionEnabled = YES;
    
    curveImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 12, 20, 20)];
    curveImageView.image = [UIImage imageNamed:@"复习-选中"];
    UILabel *curveLabel = [[UILabel alloc]initWithFrame:CGRectMake(View_X_WIDTH(curveImageView), 10, 200, 24)];
    curveLabel.text = @"艾宾浩斯遗忘定律";
    curveLabel.textColor = [UIColor grayColor];
    [self.view addSubview:curveView];
    [curveView addSubview:curveImageView];
    [curveView addSubview:curveLabel];
//    [self creatForgetCurve];
    forgetCurveView = [[JFForgetCurve alloc]initWithFrame:CGRectMake(0, View_Y_HEIGHT(curveView)-11, ScreenW, 200)];
    
    [self.view addSubview:forgetCurveView];
    
    //轻拍手势
    UITapGestureRecognizer *curveTap = [[UITapGestureRecognizer alloc]init];
    curveTap.numberOfTouchesRequired = 1;//几个手势
    curveTap.numberOfTapsRequired = 1;//设置轻拍几次
    [curveTap addTarget:self action:@selector(curveAction:)];
    [curveView addGestureRecognizer:curveTap];
    
    customView = [[UIView alloc]initWithFrame:CGRectMake(0, 254, ScreenW, 44)];
    customView.backgroundColor = [UIColor whiteColor];
    customView.userInteractionEnabled = YES;
    
    customImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 12, 20, 20)];
    customImageView.image = [UIImage imageNamed:@"复习-未选中"];
    UILabel *customLabel = [[UILabel alloc]initWithFrame:CGRectMake(View_X_WIDTH(customImageView), 10, 200, 24)];
    customLabel.text = @"自定义复习计划";
    customLabel.textColor = [UIColor grayColor];
    
    [self.view addSubview:customView];
    [customView addSubview:customImageView];
    [customView addSubview:customLabel];
    
    myCustomView = [[JFCustomView alloc]initWithFrame:CGRectMake(0, View_Y_HEIGHT(customView)-10, ScreenW, 1)];
    [myCustomView hidden];
    [self.view addSubview:myCustomView];
    [self viewDidAppear:YES];
    
    UITapGestureRecognizer *customTap = [[UITapGestureRecognizer alloc]init];
    customTap.numberOfTouchesRequired = 1;//几个手势
    customTap.numberOfTapsRequired = 1;//设置轻拍几次
    [customTap addTarget:self action:@selector(customAction:)];
    [customView addGestureRecognizer:customTap];
    
    
}


- (void)curveAction:(UITapGestureRecognizer *)tapGes{
    
    
    NSLog(@"curveAction");
    if (curveSelected) {
//        [self creatForgetCurve];
        [UIView animateWithDuration:0.5 animations:^{
            forgetCurveView.frame = CGRectMake(0, View_Y_HEIGHT(curveView)-10, ScreenW, 1);
            customView.frame = CGRectMake(0, 54, ScreenW, 44);
            myCustomView.frame = CGRectMake(0, View_Y_HEIGHT(customView)-9, ScreenW, 120);
            
            [forgetCurveView hidden];
            [myCustomView add];
            
        }];
        
        curveImageView.image = [UIImage imageNamed:@"复习-未选中"];
        customImageView.image = [UIImage imageNamed:@"复习-选中"];
        [self viewDidAppear:YES];
        curveSelected = NO;
        customSelected = YES;
        
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            forgetCurveView.frame = CGRectMake(0, View_Y_HEIGHT(curveView)-9, ScreenW, 200);
            customView.frame = CGRectMake(0, 254, ScreenW, 44);
            myCustomView.frame = CGRectMake(0, View_Y_HEIGHT(customView)-10, ScreenW, 1);
            
            [myCustomView hidden];
            [forgetCurveView add];
            
        }];
        curveImageView.image = [UIImage imageNamed:@"复习-选中"];
        customImageView.image = [UIImage imageNamed:@"复习-未选中"];
        curveSelected = NO;
        customSelected = YES;
    }
    
    
}

- (void)customAction:(UITapGestureRecognizer *)tapGes{
    
    
    NSLog(@"customAction");
    if (customSelected) {
        [UIView animateWithDuration:0.5 animations:^{
            forgetCurveView.frame = CGRectMake(0, View_Y_HEIGHT(curveView)-9, ScreenW, 200);
            customView.frame = CGRectMake(0, 254, ScreenW, 44);
            myCustomView.frame = CGRectMake(0, View_Y_HEIGHT(customView)-10, ScreenW, 1);
                        [myCustomView hidden];
            [forgetCurveView add];
        }];

        [customImageView setImage:[UIImage imageNamed:@"复习-未选中"]];
        [curveImageView setImage:[UIImage imageNamed:@"复习-选中"]];
        [self viewDidAppear:YES];
        curveSelected = YES;
        customSelected = NO;
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            forgetCurveView.frame = CGRectMake(0, View_Y_HEIGHT(curveView)-10, ScreenW, 1);
            customView.frame = CGRectMake(0, 54, ScreenW, 44);
            myCustomView.frame = CGRectMake(0, View_Y_HEIGHT(customView)-9, ScreenW, 120);
            
            [forgetCurveView hidden];
            [myCustomView add];
        }];

        [customImageView setImage:[UIImage imageNamed:@"复习-选中"]];
        [curveImageView setImage:[UIImage imageNamed:@"复习-未选中"]];
        
        customSelected = YES;
        curveSelected = NO;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
