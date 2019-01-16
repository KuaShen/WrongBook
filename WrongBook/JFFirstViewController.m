//
//  JFFirstViewController.m
//  WrongBook
//
//  Created by apple on 2017/7/12.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFFirstViewController.h"
#import "PGBanner.h"

#import "XTTableDataDelegate.h"
#import "UITableViewCell+Extension.h"
#import "JFFirstViewTableCell.h"
#import "JFFirstViewModel.h"

#import "JFReviewMinderViewController.h"
#import "JFTodayTableController.h"
#import "JFReviewPlanController.h"
#import "JFHistoryController.h"

#import "JFReviewMinderViewController.h"

@interface JFFirstViewController ()<UITableViewDelegate,UITableViewDataSource, PGBannerDelegate>{
    
    NSArray *titleArray;
    NSArray *labelArray;
    NSArray *amountArray;
    NSArray *photoArray;
}

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UIView *backImageView;
@property (nonatomic, strong) UIView *questionsView;
@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) NSMutableArray *list;
@property (nonatomic,strong) XTTableDataDelegate *tableHandler ;


@end

@implementation JFFirstViewController

- (NSMutableArray *)list{
    
    if (!_list)
    {
        _list = [@[] mutableCopy] ;
        for (int i = 0; i < 10; i++)
        {
            JFFirstViewModel *obj = [[JFFirstViewModel alloc] init] ;
            obj.title = titleArray[i] ;
            obj.label = labelArray[i] ;
            obj.amount = amountArray[i];
            obj.mainImage = [UIImage imageNamed:photoArray[i]];
            obj.skanImage = [UIImage imageNamed:@"浏览人数"];
            obj.height = 90;
            [_list addObject:obj] ;
        }
    }
    return _list ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    titleArray = @[@"高考备考：高校自主招生自荐信要怎么写",@"修改病句的方法",@"清华北大五百名学霸的经典学习方法",@"备考2016高考：只有1%的高三学生知道这样做!",@"清华学生总结：高三一年时间如何冲刺重本（实用版）",@"学习记忆规律，掌握记忆方法",@"考试的时候，你怯场了该怎么办？",@"做到这十条，作文次次满分！",@"学生一定要看的20部励志电影",@"诗歌鉴赏试题答题方法步骤及答题模式"];
    labelArray = @[@"#高考##招生#",@"#语文#",@"#高考##学霸#",@"#高考##方法#",@"#高三##冲刺#",@"#学习##方法#",@"#考试##情感#",@"#考试##语文#",@"#励志#",@"#考试##方法##语文#"];
    amountArray = @[@"49000",@"4355",@"2648",@"356",@"332",@"213",@"108",@"32",@"12",@"2"];
    photoArray = @[@"高考2",@"高考5",@"高考4",@"高考4",@"高考1",@"高考3",@"高考1",@"高考6",@"高考3",@"高考6"];
    
    
//    self.tabBarController.tabBar.hidden = NO;
    [self.view addSubview:self.backImageView];
    [self.view addSubview:self.questionsView];
    [self.view addSubview:self.myTableView];
    [self.view addSubview:self.headerView];
    [self setUI];
    [self setupTableView];
    
//     [self toLogInView];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = NO;
    
    
    
//    [self setUI];
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_topics_n"] style:UIBarButtonItemStylePlain target:self action:@selector(showLeftView)];
//    self.navigationItem.leftBarButtonItem = leftItem;
//    
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_topics_n"] style:UIBarButtonItemStylePlain target:self action:@selector(showRightView)];
//    self.navigationItem.rightBarButtonItem = rightItem;
    
    
}

- (void)setupTableView{
    
    
    TableViewCellConfigureBlock configureCell = ^(NSIndexPath *indexPath, JFFirstViewModel *obj, UITableViewCell *cell){
        [cell configure:cell
              customObj:obj
              indexPath:indexPath];
        
    };
    
    CellHeightBlock heightBlock = ^CGFloat(NSIndexPath *indexPath, id item) {
        return [JFFirstViewTableCell getCellHeightWithCustomObj:item
                                                      indexPath:indexPath] ;
    } ;
    
    DidSelectCellBlock selectedBlock = ^(NSIndexPath *indexPath, id item) {
        NSLog(@"click row : %@",@(indexPath.row)) ;
        JFReviewMinderViewController *controller = [[JFReviewMinderViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    } ;
    
    self.tableHandler = [[XTTableDataDelegate alloc] initWithItems:self.list
                                                    cellIdentifier:@"JFFirstViewTableCell"
                                                configureCellBlock:configureCell
                                                   cellHeightBlock:heightBlock
                                                    didSelectBlock:selectedBlock
                                                    cellRows:self.list.count
                                                    cellSection:1] ;
    
    [self.tableHandler handleTableViewDatasourceAndDelegate:self.myTableView] ;
    
    
}


- (void)showLeftView{
    
    
    
}


- (void)showRightView{
    
    
    
}

- (UIView *)headerView{
    
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, _myTableView.frame.origin.y-20, ScreenW, 30)];
        _headerView.backgroundColor = [UIColor whiteColor];
        UILabel*label = [[UILabel alloc]init];
        label.frame = CGRectMake(8, 5, 200, 20);
        label.text = @"精选推荐>>";
        label.textColor = [UIColor grayColor];
        label.font = FONT(12);
        [_headerView addSubview:label];
        
    }
    
    
    return _headerView;
}

- (UIView *)backImageView{
    
    if(!_backImageView){
        _backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 150)];
        _backImageView.backgroundColor = [UIColor grayColor];
//        [self.view addSubview:_backImageView];
    }
    
    return _backImageView;
    
}

- (UIView *)questionsView{
    if (!_questionsView) {
        _questionsView  = [[UIView alloc]initWithFrame:CGRectMake(0, View_Y_HEIGHT(_backImageView), ScreenW, 100)];
        CGFloat width = (ScreenW-40)/4;
        CGFloat flow = (width-50)/2;
        _questionsView.backgroundColor = [UIColor whiteColor];
        NSArray *labelArray = @[@"今日题目",@"复习题目",@"已做题目",@"历史题目"];
        NSArray *titleArray = @[@"30",@"10",@"0",@"123"];
        for (int i = 0; i < 4; i++) {
            UIButton *button =  [[UIButton alloc]init];
            button.frame = CGRectMake(20+flow+width*i, 10, 50, 50);
            button.layer.cornerRadius = 25;
            button.layer.borderWidth = 1.5;
            button.layer.borderColor = [COLOR_MAIN CGColor];
            button.clipsToBounds  = YES;
            button.tag = 400+i;
            [button setTitleColor:COLOR_MAIN forState:UIControlStateNormal];
            [button setTitle:titleArray[i] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(changeButtonState:) forControlEvents:UIControlEventTouchUpInside];
            UILabel *label = [[UILabel alloc]init];
            label.frame = CGRectMake(X_EQUAL(button), View_Y_HEIGHT(button)-5, 50, 20);
            label.font = FONT(12);
            label.textColor = [UIColor grayColor];
            label.text = labelArray[i];
            [_questionsView addSubview:button];
            [_questionsView addSubview:label];
        }
        
        
        
    }
    
    return _questionsView;

    
}




- (void)changeButtonState:(UIButton *)button{
    
    NSLog(@"tag == %ld",(long)button.tag);
    if (400 == button.tag) {
//        [button setTitle:@"30" forState:UIControlStateNormal];
        JFTodayTableController *controller = [[JFTodayTableController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (401 == button.tag){
//        [button setTitle:@"10" forState:UIControlStateNormal];
        JFReviewPlanController *controller = [[JFReviewPlanController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
        
    }else if (402 == button.tag){
//        [button setTitle:@"0" forState:UIControlStateNormal];
        JFReviewMinderViewController *controller = [[JFReviewMinderViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (403 == button.tag){
//        [button setTitle:@"123" forState:UIControlStateNormal];
        JFHistoryController *controller = [[JFHistoryController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }
    
    [button setTitleColor:COLOR_MAIN forState:UIControlStateNormal];
}


/*
- (UIView *)questionsView{
    if (!_questionsView) {
        _questionsView  = [[UIView alloc]initWithFrame:CGRectMake(0, View_Y_HEIGHT(_backImageView), ScreenW, 100)];
        CGFloat width = (ScreenW-40)/4;
        CGFloat flow = (width-50)/2;
        _questionsView.backgroundColor = [UIColor whiteColor];
        UIButton *today =  [[UIButton alloc]init];
        today.frame = CGRectMake(20+flow, 10, 50, 50);
        today.layer.cornerRadius = 25;
        today.layer.borderWidth = 1;
        today.layer.borderColor = [COLOR_MAIN CGColor];
        today.clipsToBounds  = YES;
        UILabel *todayLabel = [[UILabel alloc]init];
        todayLabel.frame = CGRectMake(X_EQUAL(today), View_Y_HEIGHT(today)-5, 50, 20);
        todayLabel.font = FONT(12);
        todayLabel.textColor = [UIColor grayColor];
        todayLabel.text = @"今日题目";
        
        UIButton *review =  [[UIButton alloc]init];
        review.frame = CGRectMake(20+flow+width*1, 10, 50, 50);
        review.layer.cornerRadius = 25;
        review.layer.borderWidth = 1;
        review.layer.borderColor = [COLOR_MAIN CGColor];
        review.clipsToBounds  = YES;
        UILabel *reviewLabel = [[UILabel alloc]init];
        reviewLabel.frame = CGRectMake(X_EQUAL(review), View_Y_HEIGHT(review)-5, 50, 20);
        reviewLabel.font = FONT(12);
        reviewLabel.textColor = [UIColor grayColor];
        reviewLabel.text = @"复习题目";
        
        UIButton *already =  [[UIButton alloc]init];
        already.frame = CGRectMake(20+flow+width*2, 10, 50, 50);
        already.layer.cornerRadius = 25;
        already.layer.borderWidth = 1;
        already.layer.borderColor = [COLOR_MAIN CGColor];
        already.clipsToBounds  = YES;
        UILabel *alreadyLabel = [[UILabel alloc]init];
        alreadyLabel.frame = CGRectMake(X_EQUAL(already), View_Y_HEIGHT(already)-5, 50, 20);
        alreadyLabel.font = FONT(12);
        alreadyLabel.textColor = [UIColor grayColor];
        alreadyLabel.text = @"已做题目";
        
        UIButton *history =  [[UIButton alloc]init];
        history.frame = CGRectMake(20+flow+width*3, 10, 50, 50);
        history.layer.cornerRadius = 25;
        history.layer.borderWidth = 1;
        history.layer.borderColor = [COLOR_MAIN CGColor];
        history.clipsToBounds  = YES;
        UILabel *historyLabel = [[UILabel alloc]init];
        historyLabel.frame = CGRectMake(X_EQUAL(history), View_Y_HEIGHT(history)-5, 50, 20);
        historyLabel.font = FONT(12);
        historyLabel.textColor = [UIColor grayColor];
        historyLabel.text = @"历史题目";
        
        
        [_questionsView addSubview:today];
        [_questionsView addSubview:todayLabel];
        [_questionsView addSubview:review];
        [_questionsView addSubview:reviewLabel];
        [_questionsView addSubview:already];
        [_questionsView addSubview:alreadyLabel];
        [_questionsView addSubview:history];
        [_questionsView addSubview:historyLabel];
    }
    
    return _questionsView;
}*/


- (UITableView *)myTableView{
    
    if (!_myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, View_Y_HEIGHT(_questionsView)+20, ScreenW, ScreenH-_questionsView.frame.origin.y-_questionsView.frame.size.height-10-TAB_HEIGHT) style:UITableViewStylePlain];
        _myTableView.tableHeaderView = _headerView;
        _myTableView.backgroundColor = [UIColor whiteColor];
        
//        [self.view addSubview:_myTableView];
    }
    
    
    return _myTableView;
    
}

// tableView的分割线从零开始
-(void)viewDidLayoutSubviews
{
    if ([self.myTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.myTableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.myTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.myTableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)setUI{
    self.view.backgroundColor = COLOR_BACKGROUND;
    [self setSearchBar];
    [self setLeftItem];
    [self setRightItem];
    
    
    PGBanner *banner = [[PGBanner alloc]initImageViewWithFrame:_backImageView.bounds imageList:@[@"photo1", @"photo2", @"photo3"] timeInterval:3.0];
    banner.delegate = self;
    [_backImageView addSubview:banner];
    
}


#pragma mark - PGBannerDelegate

- (void)selectAction:(NSInteger)didSelectAtIndex didSelectView:(id)view {
    NSLog(@"index = %ld  view = %@", didSelectAtIndex, view);
    
    
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
