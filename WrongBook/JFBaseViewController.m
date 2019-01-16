//
//  JFBaseViewController.m
//  WrongBook
//
//  Created by apple on 2017/7/13.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFBaseViewController.h"
#import "SliderViewController.h"
#import "UIViewController+SliderViewController.h"

#import "JFLoginViewController.h"

@interface JFBaseViewController ()<MBProgressHUDDelegate,UISearchBarDelegate>{
    MBProgressHUD *progressView;
    
}

@end

@implementation JFBaseViewController

- (void)setSearchBar{
    
    UIView*titleView = [[UIView alloc]initWithFrame:CGRectMake(0,0,ScreenW-140,30)];
    UISearchBar*searchBar = [[UISearchBar alloc]init];
    searchBar.delegate = self;
    searchBar.frame = CGRectMake(0,0,ScreenW-140,30);
    searchBar.layer.cornerRadius = 8;
    searchBar.layer.masksToBounds = YES;
    //边框线粗细
    [searchBar.layer setBorderWidth:8];
    //设置边框为白色是为了盖住UISearchBar上的灰色
    [searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];
    searchBar.placeholder=@"搜索相关题目";
    
    
    UITextField *textfield = [searchBar valueForKey:@"_searchField"];
    [textfield setValue:RGB(210, 210, 210) forKeyPath:@"_placeholderLabel.textColor"];
    [textfield setValue:[UIFont boldSystemFontOfSize:12]forKeyPath:@"_placeholderLabel.font"];
    
    [titleView addSubview:searchBar];
    self.navigationItem.titleView = titleView;
    
    
//    CGRect searchBarFrame = (CGRect){ScreenW/2-100, 5, 200, 34};
//    UISearchBar *searchBar = [[UISearchBar alloc]init];
//    searchBar.frame = searchBarFrame;
//    searchBar.barStyle = UIBarStyleDefault;
//    searchBar.placeholder = @"";
//    searchBar.backgroundColor = [UIColor whiteColor];
//    
//    self.navigationItem.titleView = searchBar;
}

- (void)setLeftItem{


    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"侧栏"] style:UIBarButtonItemStylePlain target:self action:@selector(showLeft)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}
- (void)showLeft{
    NSLog(@"xianshi zuoce ");
    [[self sliderViewController] showLeft];
    
}

- (void)setRightItem{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"在线提问"] style:UIBarButtonItemStylePlain target:self action:@selector(showRight)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)showRight{
    
    
}


- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar

{
    
    NSLog(@"search");
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    if (_isSearch) {
//        [self setSearchBar];
//    }
    
    
    // Do any additional setup after loading the view.
}



#pragma mark -- 加载动画
- (void)loadHUD{
    [self hideHUD];
    if (!progressView) {
        progressView = [[MBProgressHUD alloc] initWithView:self.view];
        progressView.delegate = self;
        progressView.margin = 40;
        
        [self.view addSubview:progressView];
    }
    NSInteger index = 0;
    for (int i = 0; i < self.view.subviews.count; i++) {
        UIView *sView = self.view.subviews[i];
        if ([sView isEqual:progressView]) {
            index = i;
        }
    }
    [self.view exchangeSubviewAtIndex:self.view.subviews.count-1 withSubviewAtIndex:index];
    progressView.mode = MBProgressHUDModeIndeterminate;
    [progressView showAnimated:YES];
}

#pragma mark -- 隐藏动画
- (void)hideHUD{
    if (progressView) {
        [progressView hideAnimated:YES];
    }
}

#pragma mark - 点击屏幕隐藏键盘
- (void)hideKeyboard{
    [self.view endEditing:YES];
}

- (void)createTitleLabel {
    
    //Create custom label for titleView
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 90, 40)];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.adjustsFontSizeToFitWidth = YES;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont systemFontOfSize:17];
    self.navigationItem.titleView = _titleLabel;
}


-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    if(nil != progressView){
        
        [progressView hideAnimated:YES];
        
    }
}

#pragma mark -- HUD 展示text
- (void)textStateHUD:(NSString *)text
{
    if (!progressView) {
        progressView = [[MBProgressHUD alloc] initWithView:self.view];
        progressView.delegate = self;
        [self.view addSubview:progressView];
    }
    progressView.mode = MBProgressHUDModeText;
    progressView.detailsLabel.text = text;
    progressView.detailsLabel.font = [UIFont systemFontOfSize:13.0f];
    //stateHud.labelFont = [UIFont systemFontOfSize:13.0f];
    [progressView showAnimated:YES];
    [progressView hideAnimated:YES afterDelay:1.5];
}
- (void)textStateHUD:(NSString *)text afterDelay:(NSTimeInterval)delay
{
    if (!progressView) {
        progressView = [[MBProgressHUD alloc] initWithView:self.view];
        progressView.delegate = self;
        [self.view addSubview:progressView];
    }
    progressView.mode = MBProgressHUDModeText;
    progressView.detailsLabel.text = text;
    progressView.detailsLabel.font = [UIFont systemFontOfSize:13.0f];
    //stateHud.labelFont = [UIFont systemFontOfSize:13.0f];
    [progressView showAnimated:YES];
    [progressView hideAnimated:YES afterDelay:delay];
}

-(void)imageStateHUD:(NSString *)imageName title:(NSString *)title{
    
    if (!progressView) {
        progressView = [[MBProgressHUD alloc] initWithView:self.view];
        progressView.delegate = self;
        [self.view addSubview:progressView];
    }
    progressView.mode = MBProgressHUDModeCustomView;
    UIImage *image = [UIImage imageNamed:imageName];
    progressView.customView = [[UIImageView alloc] initWithImage:image];
    progressView.square = YES;
    progressView.detailsLabel.text = title;
    progressView.detailsLabel.font = [UIFont systemFontOfSize:13.0f];
    //stateHud.labelFont = [UIFont systemFontOfSize:13.0f];
    [progressView showAnimated:YES];
    [progressView hideAnimated:YES afterDelay:1.5];
    
}

- (void)toLogInView{
    
    JFLoginViewController *loginViewController = [[JFLoginViewController alloc] init];
    
    JFBaseNavigationController *navgationController = [[JFBaseNavigationController alloc] initWithRootViewController:loginViewController];
    
    [self presentViewController:navgationController animated:YES completion:nil];
    
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
