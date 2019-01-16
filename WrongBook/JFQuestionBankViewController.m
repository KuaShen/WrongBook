//
//  JFQuestionBankViewController.m
//  WrongBook
//
//  Created by apple on 2017/7/13.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFQuestionBankViewController.h"

#import "JFExaminationController.h"
#import "JFSchoolController.h"
#import "JFOnlineController.h"

@interface JFQuestionBankViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UISegmentedControl *segmentCtrl;
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) JFExaminationController *firstVC;
@property (nonatomic, strong) JFSchoolController *secondVC;
@property (nonatomic, strong) JFOnlineController *thirdVC;

@end


@implementation JFQuestionBankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setSearchBar];
    [self setLeftItem];
    [self setRightItem];
    [self settingSrollerView];
    [self settingSegmentCtrl];
    // Do any additional setup after loading the view.
}

- (void)settingSrollerView{
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, ScreenW,ScreenH )];
    scrollView.delegate = self;
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.directionalLockEnabled = YES;
    scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);  // 内边距
    scrollView.contentSize = CGSizeMake(ScreenW*3, ScreenH);
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
    // 将三个视图加入scrollerView
    self.firstVC = [[JFExaminationController alloc] init];
    self.firstVC.view.frame = CGRectMake(0, 0, ScreenW, ScreenH-64-44);
    self.secondVC = [[JFSchoolController alloc] init];
    self.secondVC.view.frame = CGRectMake(ScreenW, 0, ScreenW, ScreenH-64-44);
    self.thirdVC = [[JFOnlineController alloc] init];
    self.thirdVC.view.frame = CGRectMake(ScreenW*2, 0, ScreenW, ScreenH-64-44);
    [self addChildViewController:self.firstVC];
    [self addChildViewController:self.secondVC];
    [self addChildViewController:self.thirdVC];
    [scrollView addSubview:self.firstVC.view];
    [scrollView addSubview:self.secondVC.view];
    [scrollView addSubview:self.thirdVC.view];

    
    _scrollView = scrollView;
}

#pragma mark -- scrollerView 代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.x;
    self.segmentCtrl.selectedSegmentIndex = offset/ScreenW;
}

-(void)settingSegmentCtrl{
    UISegmentedControl *segmentCtrl = [[UISegmentedControl alloc] initWithItems:@[@"高考题库",@"学校题库",@"在线题库"]];
    [self.view addSubview:segmentCtrl];
    segmentCtrl.frame = CGRectMake(0, 0, ScreenW, 44);
    segmentCtrl.selectedSegmentIndex = 0;
    // 设置test空间的颜色为透明
    segmentCtrl.tintColor = [UIColor clearColor];
    // 定义未选中状态下的样式normal,类型为字典
    NSDictionary *normal = @{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:COLOR_TITLE};
    // 定位选中状态下的样式selected，类型为字典
    NSDictionary *selected = @{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:COLOR_MAIN};
    // 通过setTitleTextAttributes: forState: 方法来给test控件设置文字内容的格式
    [segmentCtrl setTitleTextAttributes:normal forState:UIControlStateNormal];
    [segmentCtrl setTitleTextAttributes:selected forState:UIControlStateSelected];
    [segmentCtrl addTarget:self action:@selector(segmentBtnClick) forControlEvents:UIControlEventValueChanged];
    
    _segmentCtrl = segmentCtrl;
}

// 点击segmentCtrl 调用方法
- (void)segmentBtnClick{
    NSLog(@"点击");
    self.scrollView.contentOffset = CGPointMake(self.segmentCtrl.selectedSegmentIndex * self.view.frame.size.width, 0);
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = NO;
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
