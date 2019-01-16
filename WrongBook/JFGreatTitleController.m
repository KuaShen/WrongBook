//
//  JFGreatTitleController.m
//  WrongBook
//
//  Created by apple on 2017/7/18.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFGreatTitleController.h"

#import "XTTableDataDelegate.h"
#import "UITableViewCell+Extension.h"
#import "JFFirstViewTableCell.h"
#import "JFFirstViewModel.h"

@interface JFGreatTitleController ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSArray *titleArray;
    NSArray *labelArray;
    NSArray *amountArray;
    NSArray *photoArray;
}


@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray *list;
@property (nonatomic,strong) XTTableDataDelegate *tableHandler ;

@end

@implementation JFGreatTitleController

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
    photoArray = @[@"高考4",@"高考1",@"高考3",@"高考2",@"高考5",@"高考4",@"高考1",@"高考6",@"高考3",@"高考6"];
    

    [self.view addSubview:self.myTableView];

    [self setupTableView];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    
//    self.tabBarController.tabBar.hidden = NO;
    
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (UITableView *)myTableView{
    
    if (!_myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
//        _myTableView.tableHeaderView = _headerView;
        _myTableView.backgroundColor = [UIColor whiteColor];
        
        //        [self.view addSubview:_myTableView];
    }
    
    
    return _myTableView;
    
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
