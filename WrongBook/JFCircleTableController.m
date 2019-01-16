//
//  JFCircleTableController.m
//  WrongBook
//
//  Created by apple on 2017/7/13.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFCircleTableController.h"
#import "DWSegmentedControl.h"

#import "JFTrendsController.h"
#import "JFGreatTitleController.h"
#import "JFInformationController.h"
#import "JFYoungClassController.h"

#import "JFYoungClassCollectionCell.h"


@interface JFCircleTableController ()<UIScrollViewDelegate,DWSegmentedControlDelegate>

@property (nonatomic, strong) DWSegmentedControl *segmentCtrl;
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) JFTrendsController *firstVC;
@property (nonatomic, strong) JFYoungClassController *secondVC;
@property (nonatomic, strong) JFInformationController *thirdVC;
@property (nonatomic, strong) JFGreatTitleController *forthVC;


@end

@implementation JFCircleTableController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setSearchBar];
    [self setLeftItem];
    [self setRightItem];
    [self settingSrollerView];
    [self settingSegmentCtrl];
    
}

- (void)settingSrollerView{
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, ScreenW,ScreenH )];
    scrollView.delegate = self;
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.directionalLockEnabled = YES;
    scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);  // 内边距
    scrollView.contentSize = CGSizeMake(ScreenW*4, ScreenH);
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
    // 将三个视图加入scrollerView
    self.firstVC = [[JFTrendsController alloc] init];
    self.firstVC.view.frame = CGRectMake(0, 0, ScreenW, ScreenH-64-44);
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.secondVC = [[JFYoungClassController alloc] init];
    self.secondVC.view.frame = CGRectMake(ScreenW, 0, ScreenW, ScreenH-64-44);
    self.thirdVC = [[JFInformationController alloc] init];
    self.thirdVC.view.frame = CGRectMake(ScreenW*2, 0, ScreenW, ScreenH-64-44);
    self.forthVC = [[JFGreatTitleController alloc]init];
    self.forthVC.view.frame = CGRectMake(ScreenW*3, 0, ScreenW, ScreenH-64-44);
    [self addChildViewController:self.firstVC];
    [self addChildViewController:self.secondVC];
    [self addChildViewController:self.thirdVC];
    [self addChildViewController:self.forthVC];
    [scrollView addSubview:self.firstVC.view];
    [scrollView addSubview:self.secondVC.view];
    [scrollView addSubview:self.thirdVC.view];
    [scrollView addSubview:self.forthVC.view];
    
    _scrollView = scrollView;
}

#pragma mark -- scrollerView 代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.x;
    [_segmentCtrl sclectedIndex:offset/ScreenW];
}

-(void)settingSegmentCtrl{
//    UISegmentedControl *segmentCtrl = [[UISegmentedControl alloc] initWithItems:@[@"动态",@"小班",@"资讯",@"好题"]];
    DWSegmentedControl *segmentCtrl = [[DWSegmentedControl alloc] initWithFrame:CGRectMake(5, 80, self.view.frame.size.width-5, 30)];
    segmentCtrl.backgroundColor = [UIColor whiteColor];
    segmentCtrl.selectedViewColor = COLOR_MAIN;
    segmentCtrl.normalLabelColor = COLOR_MAIN;
    segmentCtrl.delegate = self;
    segmentCtrl.titles = @[@"动态",@"小班",@"资讯",@"好题"];
    [self.view addSubview:segmentCtrl];
    segmentCtrl.frame = CGRectMake(0, 0, ScreenW, 44);
    segmentCtrl.tintColor = [UIColor clearColor];
    
    
    _segmentCtrl = segmentCtrl;
}

- (void)setRightItem{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"加号"] style:UIBarButtonItemStylePlain target:self action:@selector(showRight)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)showRight{
    
    
}

//// 点击segmentCtrl 调用方法
//- (void)segmentBtnClick{
//    NSLog(@"点击");
//    self.scrollView.contentOffset = CGPointMake(self.segmentCtrl.selectedSegmentIndex * self.view.frame.size.width, 0);
//    
//}

-(void)dw_segmentedControl:(DWSegmentedControl *)control didSeletRow:(NSInteger)row{
    
    self.scrollView.contentOffset = CGPointMake(row * self.view.frame.size.width, 0);
    NSLog(@"你选择了第%ld个",(long)row);
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
