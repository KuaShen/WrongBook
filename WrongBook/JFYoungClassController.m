//
//  JFYoungClassController.m
//  WrongBook
//
//  Created by apple on 2017/7/18.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFYoungClassController.h"

#import "JFRecommendController.h"
#import "JFMineController.h"

//#import "JFCircleTableController.h"


@interface JFYoungClassController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UISegmentedControl *segmentCtrl;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) JFRecommendController *firstVC;
@property (nonatomic, strong) JFMineController *secondVC;

//@property (nonatomic, strong) JFCircleTableController *rootViewController;

@end

@implementation JFYoungClassController

- (void)viewDidLoad{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self setRightItem];
    [self settingSrollerView];
    [self settingSegmentCtrl];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [self setRightItem];
}

//获取当前屏幕显示的viewcontroller
- (JFBaseViewController *)getCurrentVC
{
    JFBaseViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[JFBaseViewController class]])
        result = nextResponder;
    else
        result = (JFBaseViewController *)window.rootViewController;
    
    return result;
}

//- (void)setRightItem{
//    JFBaseViewController *controller = [self getCurrentVC];
//    
//    NSLog(@"controller == %@",[self getCurrentVC]);
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_topics_s"] style:UIBarButtonItemStylePlain target:self action:@selector(showRight)];
//
//    controller.navigationItem.rightBarButtonItem = rightItem;
//}

- (void)showRight{
    
    
}
- (void)settingSrollerView{
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, ScreenW,ScreenH )];
    scrollView.delegate = self;
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.directionalLockEnabled = YES;
    scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);  // 内边距
    scrollView.contentSize = CGSizeMake(ScreenW*2, ScreenH);
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
    // 将三个视图加入scrollerView
    self.firstVC = [[JFRecommendController alloc] init];
    self.firstVC.view.frame = CGRectMake(0, 0, ScreenW, ScreenH-64-44);
    self.secondVC = [[JFMineController alloc] init];
    self.secondVC.view.frame = CGRectMake(ScreenW, 0, ScreenW, ScreenH-64-44);
    
    [self addChildViewController:self.firstVC];
    [self addChildViewController:self.secondVC];
//    [self addChildViewController:self.thirdVC];
    [scrollView addSubview:self.firstVC.view];
    [scrollView addSubview:self.secondVC.view];
//    [scrollView addSubview:self.thirdVC.view];
    
    
    _scrollView = scrollView;
}

#pragma mark -- scrollerView 代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.x;
    self.segmentCtrl.selectedSegmentIndex = offset/ScreenW;
}

-(void)settingSegmentCtrl{
    UISegmentedControl *segmentCtrl = [[UISegmentedControl alloc] initWithItems:@[@"推荐班级",@"我的班级"]];
    [self.view addSubview:segmentCtrl];
    segmentCtrl.frame = CGRectMake(0, 0, ScreenW, 44);
    segmentCtrl.selectedSegmentIndex = 0;
    // 设置test空间的颜色为透明
    segmentCtrl.tintColor = [UIColor clearColor];
    // 定义未选中状态下的样式normal,类型为字典
    NSDictionary *normal = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:COLOR_TITLE};
    // 定位选中状态下的样式selected，类型为字典
    NSDictionary *selected = @{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:COLOR_MAIN};
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



@end
