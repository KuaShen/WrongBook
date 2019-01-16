//
//  JFSchoolController.m
//  WrongBook
//
//  Created by apple on 2017/7/16.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFSchoolController.h"

#import "XTTableDataDelegate.h"
#import "UITableViewCell+Extension.h"

#import "JFQuestionCell.h"
#import "JFTitleModel.h"
#import "JFLabelView.h"

@interface JFSchoolController (){
    JFLabelView *examView;
    NSInteger index;
    CGFloat oldY;
    NSArray *questionArray;
    NSArray *objectArray;
    NSArray *array1;
    
    NSString *nowObject;
    
}

@property (nonatomic) CGFloat oldOffset;

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *list;
@property (nonatomic, strong) NSMutableArray *actulArray;
@property (nonatomic,strong) XTTableDataDelegate *tableHandler ;

@end

@implementation JFSchoolController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    array1 = @[@"全部",@"语文",@"数学",@"英语",@"政治",@"历史",@"地理",@"生物",@"化学",@"物理"];
    
    questionArray = @[
    @"如果从60°N某地以每小时1670KM的速度向东旅行，则旅行者须将时钟（   ）A．每小时拔快一小时 B．每小时拔快二小时 C．每小时拔快半小时 D．每小时拔慢一小时",
    @"During the Second World War, once before, the U-boats had been _____ because of air attack.    A.  in trouble B.  in the trouble C.  for trouble D.  within trouble",
    @"下列词语书写没有错别字的一项是  A．首屈一指   毛骨耸然   义愤填膺    劳动锻练 B．励行节约   一枕黄梁   妄费心机    通宵达旦 C．堰苗助长   结局园满   不可思议    一劳永逸 D.记忆犹新   乔装打扮   顷刻之间    罄竹难书",
    @"设nS是等差数列na的前n项和，已知23a，611a，则7S等于  A．13               B．35               C．49                D． 63 ",
    @"元旦这一天，太阳直射点： A．在南半球并向南移动             B．在南半球但向北移动 C．在北半球并向北移动              D．在北半球但向南移动",
    @"下列函数中,在区间[0,+∞)上为增函数的是()\nA. y=−x2	B. y=(x−1)2 \nC. y=1x	D. y=13x",
    @"Drive _____ until you come to the small town, which lies about 100 kilometers _____ London.    A.  north; to the east B.  north; east of C.  to north; east of D.  to north; in the east",
    @"关于南极洲冰冻线的叙述，正确的是：（   ）A．永久冰冻线的范围比南极大陆还大，说明南极大陆表面全部都是冰川 B．长城站在永久冰冻线之外，说明此处的温度很高，不会发生冰冻现象 C．4月份与10月份相比较，10月份冰冻的范围要比4月份小些 D．当南极洲冰冻范围达最小值时，我国天山雪线的海拔高度升到最高值",
    @"The reason _____ he was late for the meeting is _____ his car broke down on the road.    A.  why; that B.  why; because C.  that; that D.  for which; because"];
    objectArray = @[@"地理",@"英语",@"语文",@"数学",@"地理",@"数学",@"英语",@"地理",@"英语"];
    [self loadData];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated{
    
    [self setUI];
    [self setupTableView];
    
}

- (void)loadData{
    self.list = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < questionArray.count; i++) {
        JFTitleModel *model = [JFTitleModel new];
        model.question = questionArray[i];
        model.object = objectArray[i];
        model.height = 90;
        [self.list addObject:model];
    }
    
    _actulArray = [[NSMutableArray alloc]initWithArray:_list];
}

- (void)setUI{
    
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, HEIGHT_EQUAL(self.view)-TAB_HEIGHT) style:UITableViewStyleGrouped];
    //        _myTableView.tableHeaderView = _headerView;
    self.myTableView.backgroundColor = COLOR_BACKGROUND;
    
    [self.view addSubview:self.myTableView];
    
    
    examView = [[JFLabelView alloc]initWithArray:array1 andFrameY:0];
    oldY = examView.frame.size.height;
    examView.backgroundColor = [UIColor whiteColor];
    examView.returnIndex = ^(NSInteger myIndex) {
        index = myIndex;
        NSLog(@"This is %ld",(long)myIndex);
        
        nowObject = array1[myIndex];
        
        [self reloadData];
    };
    //    NSLog(@"This is %ld",(long)index);
    //    [self.view addSubview:examView];
    
    self.myTableView.tableHeaderView = examView;
    //    self.myTableView.tableFooterView = examView;
    
}


- (void)setupTableView{
    
    
    TableViewCellConfigureBlock configureCell = ^(NSIndexPath *indexPath, JFTitleModel *obj, UITableViewCell *cell){
        [cell configure:cell
              customObj:obj
              indexPath:indexPath];
        
    };
    
    CellHeightBlock heightBlock = ^CGFloat(NSIndexPath *indexPath, id item) {
        return [JFQuestionCell getCellHeightWithCustomObj:item
                                                indexPath:indexPath] ;
    } ;
    
    DidSelectCellBlock selectedBlock = ^(NSIndexPath *indexPath, id item) {
        NSLog(@"click row : %@",@(indexPath.row)) ;
        //        JFLoginViewController *controller = [[JFLoginViewController alloc]init];
        ////        controller.hidesBottomBarWhenPushed = YES;
        //        [self.navigationController pushViewController:controller animated:YES];
    } ;
    
    self.tableHandler = [[XTTableDataDelegate alloc] initWithItems:self.actulArray
                                                    cellIdentifier:@"JFQuestionCell"
                                                configureCellBlock:configureCell
                                                   cellHeightBlock:heightBlock
                                                    didSelectBlock:selectedBlock
                                                          cellRows:1
                                                       cellSection:self.actulArray.count] ;
    
    [self.tableHandler handleTableViewDatasourceAndDelegate:self.myTableView] ;
    //    self.tableview.delegate = self;
    
}


- (void)reloadData{
    
    [_actulArray removeAllObjects];
    if ([nowObject isEqualToString:@"全部"]) {
        self.actulArray = _list;
    }
    for (JFTitleModel *model in _list) {
        if ([nowObject isEqualToString:model.object]) {
            [self.actulArray addObject:model];
        }
        
    }
    //    dispatch_async(dispatch_get_main_queue(), ^{
    //
    //        [self.myTableView reloadData];
    //    });
    [self setupTableView];
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --------not success---------

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSLog(@"scrollViewDidScroll");
    if (scrollView.contentOffset.y > _oldOffset) {//如果当前位移大于缓存位移，说明scrollView向上滑动
        
        [UIView animateWithDuration:0.2 animations:^{
            examView.frame = CGRectMake(0, 0, ScreenW, 0);
        }];
        
        
    }else{
        
        [UIView animateWithDuration:0.2 animations:^{
            examView.frame = CGRectMake(0, 0, ScreenW, oldY);
        }];
    }
    
    _oldOffset = scrollView.contentOffset.y;//将当前位移变成缓存位移
    
}


@end
