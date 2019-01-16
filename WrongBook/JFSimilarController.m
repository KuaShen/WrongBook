//
//  JFSimilarController.m
//  WrongBook
//
//  Created by apple on 2017/7/31.
//  Copyright © 2017年 lab. All rights reserved.
//


//History
#import "JFSimilarController.h"

#import "JFTitleView.h"
#import "JFAnswerView.h"
#import "JFHistoryTitleModel.h"
#import "JFHistoryAnswerModel.h"


@interface JFSimilarController ()

@property (nonatomic, strong) JFHistoryTitleModel *titleModel;

@property (nonatomic, strong) JFHistoryAnswerModel *answerModel;

@end

@implementation JFSimilarController


- (void)setUI{
    self.view.backgroundColor = COLOR_BACKGROUND;
    JFTitleView *titleView = [[JFTitleView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH/3)];
    [titleView showInController:self];
    
    JFAnswerView *answerView = [[JFAnswerView alloc]initWithFrame:CGRectMake(0, View_Y_HEIGHT(titleView), ScreenW, ScreenH*2/3-NAV_HEIGHT)];
    [answerView showInController:self];
    
}


- (void)setModel{
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
    [self setUI];
    // Do any additional setup after loading the view.
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
