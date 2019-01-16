//
//  JFBaseTableViewController.m
//  WrongBook
//
//  Created by apple on 2017/7/13.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "NetBrokenViewController.h"

@interface JFBaseTableViewController ()

@property(nonatomic) NSInteger next_page;//下一页
@property(nonatomic) NSInteger list_count;//总页数
@property (nonatomic, strong) refresh_action header_action;
@property (nonatomic, strong) refresh_action footer_action;


@end

@implementation JFBaseTableViewController

-(id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.showSeparator = YES;
        self.tableStyle = style;
        self.ifrespErr = NO;
        self.isInit = NO;
    }
    return self;
}

-(id)init{
    self = [super init];
    if (self) {
        self.showSeparator = YES;
        self.tableStyle = UITableViewStyleGrouped;
        self.ifrespErr = NO;
        self.isInit = NO;
    }
    return self;
}

- (void)loadView{
    [super loadView];
    
    //tableView 基本初始化
    if (!self.tableview) {
        CGRect vFrame = CGRectMake(0,0,ScreenW,ScreenH);
        vFrame.size.height = self.navigationController.navigationBarHidden?vFrame.size.height:vFrame.size.height-NAV_HEIGHT;
        if(!self.hidesBottomBarWhenPushed){
            vFrame.size.height = self.tabBarController.tabBar.hidden?vFrame.size.height:vFrame.size.height-TAB_HEIGHT;
        }
        self.tableview = [[UITableView alloc] initWithFrame:vFrame style:self.tableStyle];
        self.tableview.rowHeight = UITableViewAutomaticDimension;
        self.tableview.estimatedRowHeight = 44;
        self.tableview.dataSource = self;
        self.tableview.delegate = self;
        self.tableview.backgroundColor = COLOR_BACKGROUND;
        self.tableview.showsVerticalScrollIndicator = NO;
        self.tableview.showsHorizontalScrollIndicator = NO;
        self.tableview.separatorColor = COLOR_BACKGROUND;
        [self.view addSubview:self.tableview];
        /**
         * 去除页面上边距
         */
        self.edgesForExtendedLayout = UIRectEdgeBottom;
    }
    //不显示cell分割线
    if (!self.showSeparator) {
        self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    } else {
        self.tableview.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.extendedLayoutIncludesOpaqueBars = YES;
    if ([self method] !=nil) {
        [self show_footer];
        [self allow_RefreshControl];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(self.isInit){
        [self.tableview reloadData];
    }
}

- (void)addCustomRefresh:(MJRefreshComponentRefreshingBlock)refreshingBlock{
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:refreshingBlock];
    // 设置文字
    [header setTitle:@"下拉可以刷新了" forState:MJRefreshStateIdle];
    [header setTitle:@"松开马上刷新了" forState:MJRefreshStatePulling];
    [header setTitle:@"刷新中。。。" forState:MJRefreshStateRefreshing];
    header.arrowView.image = [UIImage imageNamed:@"ic_refresh"];
    header.lastUpdatedTimeLabel.hidden = YES;
    // 设置字体
    header.stateLabel.font = [UIFont systemFontOfSize:15];
    // 设置颜色
    header.stateLabel.textColor = [UIColor whiteColor];
    // 设置刷新控件
    self.tableview.mj_header = header;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)allow_RefreshControl{
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh_data)];
    // 设置文字
    [header setTitle:@"下拉可以刷新了" forState:MJRefreshStateIdle];
    [header setTitle:@"松开马上刷新了" forState:MJRefreshStatePulling];
    [header setTitle:@"刷新中。。。" forState:MJRefreshStateRefreshing];
    header.arrowView.image = [UIImage imageNamed:@"ic_refresh"];
    header.lastUpdatedTimeLabel.hidden = YES;
    // 设置字体
    header.stateLabel.font = [UIFont systemFontOfSize:15];
    // 设置颜色
    header.stateLabel.textColor = [UIColor blackColor];
    // 设置刷新控件
    self.tableview.mj_header = header;
}

#pragma mark -- 加载第一页数据 分页需调用
- (void)show_footer
{
    self.next_page = 1;
    self.list_count = 0;
    self.listData = [[NSMutableArray alloc] init];
    
//    _footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getData)];
    // 设置文字
    [_footer setTitle:@"上拉加载更多" forState:MJRefreshStateIdle];
    [_footer setTitle:@"松开加载更多" forState:MJRefreshStatePulling];
    [_footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    [_footer setTitle:@"没有更多了哦" forState:MJRefreshStateNoMoreData];
    // 设置字体
    _footer.stateLabel.font = FONT(15);
    // 设置颜色
    _footer.stateLabel.textColor = [UIColor blackColor];
    // 设置footer
    self.tableview.mj_footer = _footer;
    _next_page = 1;
//    [self getData];
}

- (void)refresh_data{
    
    if(self.isInit){
        _next_page = 1;
        
        if(!self.tableview.mj_footer){
            
//            _footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getData)];
            // 设置文字
            [_footer setTitle:@"上拉加载更多" forState:MJRefreshStateIdle];
            [_footer setTitle:@"松开加载更多" forState:MJRefreshStatePulling];
            [_footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
            [_footer setTitle:@"没有更多了哦" forState:MJRefreshStateNoMoreData];
            // 设置字体
            _footer.stateLabel.font = FONT(15);
            // 设置颜色
            _footer.stateLabel.textColor = [UIColor blackColor];
            // 设置footer
            self.tableview.mj_footer = _footer;
            
        }
        
        [self.tableview.mj_footer resetNoMoreData];
//        [self getData];
        
    }
    
    if(_header_action){
        _header_action();
    }
}


- (void)turnToPromptPage{
    NetBrokenViewController *brokenVC = [[NetBrokenViewController alloc] init];
    [self.navigationController pushViewController:brokenVC animated:YES];
}

- (UIView *)emptyView{
    if (!_emptyView) {
        _emptyView = [[UIView alloc] initWithFrame:self.tableview.frame];
        _emptyView.backgroundColor = COLOR_BACKGROUND;
        
        [self.tableview addSubview:_emptyView];
    }
    
    return _emptyView;
}

- (UIView *)errView{
    if (!_errView) {
        _errView = [[UIView alloc] initWithFrame:self.tableview.frame];
        _errView.backgroundColor = COLOR_BACKGROUND;
        
        UILabel *errLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 20)];
        errLabel.text = @"网络错误，请点击屏幕重试";
        errLabel.font = FONT(16);
        errLabel.textAlignment = NSTextAlignmentCenter;
        errLabel.textColor = [UIColor blackColor]; //TODO 适当颜色值
        errLabel.center = self.tableview.center;
        
        [_errView addSubview:errLabel];
        [self.tableview addSubview:_errView];
        
        UIGestureRecognizer *tagZer = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(resetLoad)];
        [_errView addGestureRecognizer:tagZer];
    }
    
    return _errView;
}

- (void)hide_footer{
    if(self.tableview.mj_footer){
        self.tableview.mj_footer = nil;
    }
    
}

//重新刷新页面
- (void)resetLoad{
//    [self getData];
}

//////////////////////////////////////////////////////////////////////////////////
#pragma mark - tableview datasource && tableview delegate
//常规表格的数据和委托

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.000001;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 8;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * LOAD_MORE_CELL = @"LOAD_MORE_CELL_IDENTIFITY";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:LOAD_MORE_CELL];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:LOAD_MORE_CELL];
    }
    return cell;
}
// tableView的分割线从零开始
-(void)viewDidLayoutSubviews
{
    if ([self.tableview respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableview setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableview respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableview setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if (tableView == self.tableview) {
        if (_next_page -1 < _list_count && nil != self.method) {
            if (indexPath.section == self.listData.count - 1 || indexPath.row ==self.listData.count - 1) {
//                [self getData];
            }
        }
    }
}


//计算总个数
- (void)calculateListCount:(NSDictionary *)respDic{
    
    _list_count = [respDic[@"pageTotal"] integerValue];
    _next_page = [respDic[@"pageNumber"] integerValue] + 1;
    _object_count = [respDic[@"total"] integerValue];
    
    if (_next_page > _list_count) {
        if (self.tableview.mj_footer) {
            [self.tableview.mj_footer endRefreshingWithNoMoreData];
        }
        if (self.tableview.mj_header) {
            [self.tableview.mj_header endRefreshing];
        }
    }else if(_object_count == 0){
        [self hide_footer];
    }else{
        if (self.tableview.mj_footer) {
            [self.tableview.mj_footer endRefreshing];
        }
        if (self.tableview.mj_header) {
            [self.tableview.mj_header endRefreshing];
        }
    }
}
#pragma mark - 设置分割线从头开始




#pragma mark - 基本方法(需要分页的页面 重写)
- (NSString *)method{
    return nil;
}

- (NSDictionary *)params{
    return nil;
}

//解析返回的数据
- (NSArray *)parseResponse:(NSArray *)respDic
{
    return nil;
}

- (void)set_custom_header_action:(refresh_action)brock{
    self.header_action = brock;
}

- (void)set_custom_footer_action:(refresh_action)brock{
    self.footer_action = brock;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
