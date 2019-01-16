//
//  JFLeftViewController.m
//  WrongBook
//
//  Created by apple on 2017/7/18.
//  Copyright © 2017年 lab. All rights reserved.
//
#import "JFSliderBackground.h"
#import "JFSliderTableCell.h"
#import "SDAutoLayout.h"
#import "JFLeftViewController.h"
#import "XTTableDataDelegate.h"
#import "UITableViewCell+Extension.h"
#import "JFSliderModel.h"
#import "SliderViewController.h"
#import "UIViewController+SliderViewController.h"

#import "JFFirstViewController.h"
#import "JFReviewMinderViewController.h"


@interface JFLeftViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *imageArray;
    NSArray *cellTitleArray;
    
}

@property (nonatomic, strong) NSMutableArray *modelArray;

@property (nonatomic, strong) UITableView *sliderTable;

@property (nonatomic, strong) JFSliderBackground *backgroundView;

@property (nonatomic, strong) UIButton *quitLogin;

@property (nonatomic,strong) XTTableDataDelegate *tableHandler ;

@end

@implementation JFLeftViewController


- (void)quit{
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    imageArray = @[@"个人中心",@"侧栏收藏",@"打印",@"闹钟提醒",@"黑白名单",@"设置"];
    cellTitleArray = @[@"个人中心",@"收藏",@"纸质打印",@"复习提醒",@"黑白名单",@"设置"];
    

    [self loadData];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    
    [self setUI];
    [self setupTableView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI{
    
    self.view.backgroundColor = COLOR_BACKGROUND;
    self.navigationController.navigationBarHidden = YES;
    
    _backgroundView = [[JFSliderBackground alloc]initWithFrame:CGRectMake(0, 0, ScreenW-97, 220)];
    UIImage *headImage = [UIImage imageNamed:@"photo1"];
    [_backgroundView setupNikeName:@"昵称" andLV:@"12" andDays:@"33" andHeadImage:headImage];
    
    _sliderTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 220, ScreenW-97, 265) style:UITableViewStylePlain];
    _sliderTable.backgroundColor = [UIColor whiteColor];
    _sliderTable.scrollEnabled = NO;
//    [self setupTableView];
    
    _quitLogin = [[UIButton alloc]initWithFrame:CGRectMake(20, ScreenH-45, _sliderTable.frame.size.width-40, 35)];
    _quitLogin.backgroundColor = COLOR_MAIN;
    [_quitLogin setTitle:@"退出登录" forState:UIControlStateNormal];
    _quitLogin.layer.cornerRadius = 5;
    _quitLogin.clipsToBounds = YES;
    [_quitLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_quitLogin addTarget:self action:@selector(quit) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_backgroundView];
    [self.view addSubview:_sliderTable];
    [self.view addSubview:_quitLogin];
    

}

- (void)loadData{
    _modelArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < imageArray.count; i++) {
        JFSliderModel *model = [JFSliderModel new];
        model.cellImage = [UIImage imageNamed:imageArray[i]];
        model.cellTitle = cellTitleArray[i];
        model.height = 44;
        [_modelArray addObject:model];
    }
    
    
    
    
}


- (void)setupTableView{
    
    
    TableViewCellConfigureBlock configureCell = ^(NSIndexPath *indexPath, JFSliderModel *obj, UITableViewCell *cell){
        [cell configure:cell
              customObj:obj
              indexPath:indexPath];
        
    };
    
    CellHeightBlock heightBlock = ^CGFloat(NSIndexPath *indexPath, id item) {
        return [JFSliderTableCell getCellHeightWithCustomObj:item
                                                      indexPath:indexPath] ;
    } ;
    
    DidSelectCellBlock selectedBlock = ^(NSIndexPath *indexPath, id item) {
        NSLog(@"click row : %@",@(indexPath.row)) ;
        [[self sliderViewController] hideLeft];
        JFFirstViewController *first = [[JFFirstViewController alloc]init];
//        JFBaseNavigationController *navigationController = [[JFBaseNavigationController alloc]initWithRootViewController:first];
        if (indexPath.row == 3) {
            JFReviewMinderViewController *controller = [[JFReviewMinderViewController alloc]init];
//            [[self sliderViewController].navigationController showViewController:controller sender:self];
            NSLog(@"navigation == %@",first.navigationController);
            [first.navigationController pushViewController:controller animated:YES];
        }
        
        
    } ;
    
    self.tableHandler = [[XTTableDataDelegate alloc] initWithItems:self.modelArray
                                                    cellIdentifier:@"JFSliderTableCell"
                                                configureCellBlock:configureCell
                                                   cellHeightBlock:heightBlock
                                                    didSelectBlock:selectedBlock
                                                    cellRows:self.modelArray.count
                                                    cellSection:1] ;
    
    [self.tableHandler handleTableViewDatasourceAndDelegate:self.sliderTable] ;
    
    
}

// tableView的分割线从零开始
-(void)viewDidLayoutSubviews
{
    if ([self.sliderTable respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.sliderTable setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.sliderTable respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.sliderTable setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
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
