//
//  JFReviewPlanController.m
//  WrongBook
//
//  Created by apple on 2017/7/29.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFReviewPlanController.h"

#import "XTTableDataDelegate.h"
#import "UITableViewCell+Extension.h"

#import "JFQuestionCell.h"
#import "JFTitleModel.h"

#import "JFStartToAnswerController.h"

@interface JFReviewPlanController (){
    NSArray *questionArray;
    NSArray *objectArray;
    
}

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *list;
@property (nonatomic,strong) XTTableDataDelegate *tableHandler ;


@end

@implementation JFReviewPlanController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController.tabBar.hidden = YES;
    
    questionArray = @[@"During the Second World War, once before, the U-boats had been _____ because of air attack.    A.  in trouble B.  in the trouble C.  for trouble D.  within trouble",
                      @"下列词语书写没有错别字的一项是  A．首屈一指   毛骨耸然   义愤填膺    劳动锻练 B．励行节约   一枕黄梁   妄费心机    通宵达旦 C．堰苗助长   结局园满   不可思议    一劳永逸 D.记忆犹新   乔装打扮   顷刻之间    罄竹难书",
                      @"设nS是等差数列na的前n项和，已知23a，611a，则7S等于  A．13               B．35               C．49                D． 63 ",
                      @"元旦这一天，太阳直射点： A．在南半球并向南移动             B．在南半球但向北移动 C．在北半球并向北移动              D．在北半球但向南移动",
                      @"—I knocked over my coffee cup. It went right over _____ keyboard. —You shouldn’t put drinks near _____ computer.   A.  the; / B.  the; a C.  a; / D.  a; a",
                      @"下面不属于科学家们所称的地球上存在生命物质“金锁链条件”的是  A.大量的液态水                 B.适宜的温度范围 C.比较厚的大气层和大气成分     D.稳定的太阳光照",
                      @"A group of American soldiers were walking along the road in Irap when a bomb was _____, three of whom were killed.    A.  set about B.  set out C.  set up D.  set off",
                      @"关于南极洲冰冻线的叙述，正确的是：（   ）A．永久冰冻线的范围比南极大陆还大，说明南极大陆表面全部都是冰川 B．长城站在永久冰冻线之外，说明此处的温度很高，不会发生冰冻现象 C．4月份与10月份相比较，10月份冰冻的范围要比4月份小些 D．当南极洲冰冻范围达最小值时，我国天山雪线的海拔高度升到最高值",
                      @"The reason _____ he was late for the meeting is _____ his car broke down on the road.    A.  why; that B.  why; because C.  that; that D.  for which; because",
                      @"下列文学常识中有误的一项是：（  ）A、《孟子》一书共分为七篇，其中多数为论辩文章。孟子的文章富于雄辩，气势充沛，感情强烈，同时他又善于运用比喻等手法，将抽象道理具体化，使文章引人入胜，具有很高的文学价值。B、曹雪芹，中国清代小说家，字梦阮，号雪芹。他创作的《红楼梦》原名《石头记》是我国古代长篇小说中现实主义的高峰。《红楼梦》共120回，前80回为曹雪芹所写，后40回为高鹗所续。C、《祝福》选自《呐喊》，作者是鲁迅，他的另两部小说集是《彷徨》《故事新编》，散文集是《朝花夕拾》，散文诗集是《野草》，还有杂文17部。 D、海明威是美国现代作家。代表作有《太阳照常升起》、《永别了，武器》、《丧钟为谁而鸣》、《老人与海》等。在《老人与海》中，作者通过主人公桑地亚哥塑造了“硬汉”性格。"];
    objectArray = @[@"英语",@"语文",@"数学",@"地理",@"英语",@"地理",@"英语",@"地理",@"英语",@"语文"];
    [self loadData];
    
    // Do any additional setup after loading the view.
}

- (void)setUI{

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    //    titleLabel.backgroundColor = [UIColor grayColor];
    //    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"复习计划";
    self.navigationItem.titleView = titleLabel;
    
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, HEIGHT_EQUAL(self.view)-TAB_HEIGHT) style:UITableViewStyleGrouped];
    //        _myTableView.tableHeaderView = _headerView;
    self.myTableView.backgroundColor = COLOR_BACKGROUND;
//    _myTableView.sectionHeaderHeight = 0;
    
    [self.view addSubview:self.myTableView];
    
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 60)];
    footView.backgroundColor = [UIColor clearColor];
    UIButton *start = [[UIButton alloc]initWithFrame:CGRectMake(ScreenW/2-120, 15, 240, 30)];
    start.layer.cornerRadius = 8;
    start.clipsToBounds = YES;
    [start setTitle:@"开始复习" forState:UIControlStateNormal];
    [start setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [start setBackgroundColor:COLOR_MAIN];
    [start addTarget:self action:@selector(startToReview) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:start];
    
    self.myTableView.tableHeaderView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, CGFLOAT_MIN)];
    self.myTableView.tableFooterView = footView;
//    UIView *headView = [UIView new];
    
    
}

- (void)startToReview{
    JFStartToAnswerController *controller = [[JFStartToAnswerController alloc]init];
    
    [self.navigationController pushViewController:controller animated:YES];
    
    
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
    
}
- (void)viewWillAppear:(BOOL)animated{
    
    
    
    [self setUI];
    [self setupTableView];
    
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
    
    self.tableHandler = [[XTTableDataDelegate alloc] initWithItems:self.list
                                                    cellIdentifier:@"JFQuestionCell"
                                                configureCellBlock:configureCell
                                                   cellHeightBlock:heightBlock
                                                    didSelectBlock:selectedBlock
                                                          cellRows:1
                                                       cellSection:self.list.count] ;


    [self.tableHandler handleTableViewDatasourceAndDelegate:self.myTableView] ;
    
    
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
