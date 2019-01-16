//
//  NetBrokenViewController.m
//  CatInsurance
//
//  Created by Reminisce on 16/6/13.
//  Copyright © 2016年 杭州新航线软件科技有限公司. All rights reserved.
//

#import "NetBrokenViewController.h"

@interface NetBrokenViewController ()

@end

@implementation NetBrokenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"网络无法连接";
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 60)];
    label.font = FONT(16);
    label.text = @"    建议按照以下方法检查网络连接：";
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    UILabel *messageL = [[UILabel alloc] initWithFrame:CGRectMake(20, label.frame.size.height, ScreenW-40, 100)];
    messageL.font = FONT(14);
    messageL.text = @"1. 打开手机‘设置’并把‘Wi-Fi’开关保持开启状态；\n\n2. 打开手机‘设置’-‘通用’-‘蜂窝移动网络’，并把‘蜂窝移动网络’开关保持开启状态；\n\n3.如果仍无法连接网络，请检查手机接入的‘Wi-Fi’是否已接入互联网或者咨询网络运营商；";
    messageL.numberOfLines = 0;
    messageL.textAlignment = NSTextAlignmentJustified;
    [self.view addSubview:messageL];
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
