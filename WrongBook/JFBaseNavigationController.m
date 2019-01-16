//
//  JFBaseNavigationController.m
//  WrongBook
//
//  Created by apple on 2017/7/13.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFBaseNavigationController.h"
#import "JFBaseViewController.h"

@interface JFBaseNavigationController ()<UINavigationControllerDelegate>

@end

@implementation JFBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.shadowImage = LOAD_LOCAL_IMG(@"clear");
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(showLeft)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    [self.navigationBar setBackgroundImage:LOAD_LOCAL_IMG(@"clear") forBarMetrics:UIBarMetricsDefaultPrompt];
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:}];
    self.navigationBar.translucent = NO;
    //    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationBar.barTintColor = COLOR_MAIN;
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    //    self.navigationBar.titleTextAttributes = NSDictionary(object: navTitleColor,forKey:NSForegroundColorAttributeName) as? [String : AnyObject]
    //    self.navigationBar.shadowImage = UIImage(named: "clear")
    //    self.navigationBar.setBackgroundImage(UIImage(named: "clear"), forBarMetrics: UIBarMetrics.Default)
    
    
    
    
    
    
    // Do any additional setup after loading the view.
    
}

- (void)showLeft{
    
    
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    
    if([rootViewController isKindOfClass:[JFBaseViewController class]]) {
        
        self = [super init];
        
        JFBaseViewController *viewController = (JFBaseViewController *) rootViewController;
        
        viewController.navigationController = self;
        
        [super pushViewController:rootViewController animated:YES];
        
    }else{
        
        
        self = [super initWithRootViewController:rootViewController];
    }
    return self;
}

/**
 * 重写跳转方法 改变跳转页面返回按钮效果 添加页面 hidesBottomBarWhenPushed YES 方法
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if(!viewController.navigationController){
        if([viewController isKindOfClass:[JFBaseViewController class]]){
            
            JFBaseViewController *baseViewController = (JFBaseViewController *)viewController;
            baseViewController.navigationController = self;
        }else{
            [[UINavigationController alloc]initWithRootViewController:viewController];
        }
    }
    viewController.hidesBottomBarWhenPushed = NO;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    UIBarButtonItem *uiBarButtonItem = [[UIBarButtonItem alloc]
                                        initWithImage:[UIImage imageNamed:@"ic_back_nav"]
                                        style:UIBarButtonItemStyleDone
                                        target:self
                                        action:@selector(navBackAction:)];
    uiBarButtonItem.tintColor = [UIColor whiteColor];
    [viewController.navigationItem setLeftBarButtonItem:uiBarButtonItem animated:animated];
    [viewController.navigationItem setHidesBackButton:YES animated:animated];
    [super pushViewController:viewController animated:animated];
    
}

-(void)navBackAction:(id)sender{
    
    [super popViewControllerAnimated:YES];
    
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
