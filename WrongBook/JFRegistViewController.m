//
//  JFRegistViewController.m
//  WrongBook
//
//  Created by apple on 2017/7/28.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFRegistViewController.h"
#import "JFRegistView.h"

@interface JFRegistViewController ()

@property (nonatomic, strong) JFRegistView *registView;

@end

@implementation JFRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    //    titleLabel.backgroundColor = [UIColor grayColor];
    //    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"注册";
    self.navigationItem.titleView = titleLabel;
    
    _registView = [[JFRegistView alloc]initWithFrame:self.view.bounds];
    
    [_registView showInController:self];
    
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
