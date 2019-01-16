//
//  JFTabbarController.m
//  WrongBook
//
//  Created by apple on 2017/7/12.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFTabbarController.h"

#import "JFFirstViewController.h"
#import "JFCircleTableController.h"
#import "JFQuestionBankViewController.h"
//#import "FYLPageViewController.h"
#import "JFBaseNavigationController.h"

#import "JFAnalyseController.h"




@interface JFTabbarController ()<UITabBarControllerDelegate>{
    JFBaseNavigationController *navigationController;
}

@property (nonatomic, strong) NSMutableArray *myViewControllers;

@end

@implementation JFTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController = (JFBaseNavigationController *)navigationController;
    self.tabBar.tintColor = COLOR_MAIN;
    
    // Do any additional setup after loading the view.
}

-(instancetype)init{
    self = [super init];
    
    if (self) {
        [self initSubViewControllers];
    }
    
    return self;
}


-(void)initSubViewControllers{

    
    //首页
    JFFirstViewController *firstView = [[JFFirstViewController alloc]init];
//    UINavigationController *firstNav = [[UINavigationController alloc]initWithRootViewController:firstView];
    JFBaseNavigationController *firstNav = [[JFBaseNavigationController alloc]initWithRootViewController:firstView];
    firstView.tabBarItem = [self tabBarItemWithTitle:@"首页"
                                          TitleColor:[UIColor greenColor]
                                               image:@"主页－未选中"
                                       selectedImage:@"主页－选中"];
    
    //圈子
    JFCircleTableController *circleView = [[JFCircleTableController alloc]init];
//    UINavigationController *circleNav = [[UINavigationController alloc]initWithRootViewController:circleView];
    JFBaseNavigationController *circleNav = [[JFBaseNavigationController alloc]initWithRootViewController:circleView];
    circleView.tabBarItem = [self tabBarItemWithTitle:@"圈子"
                                           TitleColor:[UIColor greenColor]
                                                image:@"圈子－未选中"
                                        selectedImage:@"圈子－选中"];
    
    //题库
    JFQuestionBankViewController *questionBank = [[JFQuestionBankViewController alloc]init];
//    UINavigationController *questionNav = [[UINavigationController alloc]initWithRootViewController:questionBank];
    JFBaseNavigationController *questionNav = [[JFBaseNavigationController alloc]initWithRootViewController:questionBank];
    questionBank.tabBarItem = [self tabBarItemWithTitle:@"题库"
                                             TitleColor:[UIColor greenColor]
                                                  image:@"题库－未选中"
                                          selectedImage:@"题库－选中"];
    
    //分析
//    FYLPageViewController *analyse = [[FYLPageViewController alloc]initWithTitles:@[@"语文",@"数学",@"英语",@"物理",@"化学",@"生物",@"政治",@"历史",@"地理"] viewControllers:_myViewControllers];
    JFAnalyseController *analyse = [[JFAnalyseController alloc]init];
    JFBaseNavigationController *analyseNav = [[JFBaseNavigationController alloc]initWithRootViewController:analyse];
    
    analyse.tabBarItem = [self tabBarItemWithTitle:@"分析"
                                        TitleColor:[UIColor greenColor]
                                             image:@"分析 －未选中"
                                     selectedImage:@"分析 －选中"];
    
    
    self.viewControllers = @[firstNav, questionNav, circleNav, analyseNav];
    
    
    
    
    
    
    self.tabBar.userInteractionEnabled = YES;
    
    self.delegate = self;
}

- (NSMutableArray *)myViewControllers {
    if (!_myViewControllers) {
        _myViewControllers = [NSMutableArray array];
        
        for (int i = 1; i <= 6; i++) {
            JFAnalyseController *vc = [[JFAnalyseController alloc] init];
            
            [_myViewControllers addObject:vc];
        }
        
    }
    return _myViewControllers;
}


#pragma mark UITabBarControllerDelegate
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    //点击某一个tabbar 按钮
    if (item.tag == 1) {
        
        NSLog(@"第一个");
    }
    if (item.tag == 2) {
        
        NSLog(@"第二个");
    }
    if(item.tag == 3){
        
        NSLog(@"第三个");
    }
    
}

- (UITabBarItem*)tabBarItemWithTitle:(NSString*)title
                          TitleColor:(UIColor*)titleColor
                               image:(NSString*)image
                       selectedImage:(NSString*)selectedImage
{
    UITabBarItem *tabBarItem;
    
    tabBarItem = [[UITabBarItem alloc] initWithTitle:title
                                               image:[self renderImageWithName:image]
                                       selectedImage:[self renderImageWithName:selectedImage]];
    
    //改变tabBar字体颜色
    //    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:COLOR_REDTITLE,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    return tabBarItem;
}


- (UIImage*)renderImageWithName:(NSString*)imageName {
    UIImage * image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return image;
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
