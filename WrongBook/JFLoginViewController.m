//
//  JFLoginViewController.m
//  WrongBook
//
//  Created by apple on 2017/7/27.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFLoginViewController.h"
#import "JFLoginView.h"

@interface JFLoginViewController ()

@property (nonatomic, strong) JFLoginView *logInView;

@end

@implementation JFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
//    self.tabBarController.tabBar.hidden = YES;
    _logInView =  [[JFLoginView alloc]initWithFrame:self.view.bounds];
    
//    self.view = _logInView;
    [_logInView showInController:self];
    
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = YES;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// _titleShowLabel.attributedText=[self createSearchKeyWord:_keyword originalString:topic.title withTextColor:HexRGB(0x545454) keywordsColor:GETFOURFIVECOLOR];

//- (NSMutableAttributedString *)createSearchKeyWord:(NSString *)keyWord originalString:(NSString *)oString withTextColor:(UIColor *)color keywordsColor:(UIColor *)keyColor
//{
//    
//    if ([oString length] < 1 || oString == nil) {
//        return nil;
//    }
//    
//    
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:oString];
//    
//    [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0,oString.length)];
//    
//    
//    NSMutableArray *keyWordArray2 = [NSMutableArray arrayWithCapacity:100];
//    NSInteger strLength = [keyWord length];
//    for (int i =0; i < strLength; i++) {
//        [keyWordArray2 addObject:[keyWord substringWithRange:NSMakeRange(i, 1)]];
//    }
//    
//    for (int i =0; i < [keyWordArray2 count] ; i++) {
//        NSRange range = [[oString lowercaseString] rangeOfString:[[keyWordArray2 objectAtIndex:i] lowercaseString]];//判断字符串是否包含
//        [attributedString addAttribute:NSForegroundColorAttributeName value:keyColor range:NSMakeRange(range.location,range.length)];
//        
//    }
//    
//    
//    return attributedString;
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
