//
//  JFAnalyseController.m
//  WrongBook
//
//  Created by apple on 2017/7/29.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFAnalyseController.h"

#import "JFDegreeView.h"
#import "JFAnalyseView.h"
#import "JFCurveView.h"
#import "FYLSegmentView.h"

@interface JFAnalyseController ()<FYLSegmentViewDelegate>

@property (nonatomic,strong)FYLSegmentView *viewSegment;

@property (nonatomic, strong) NSMutableArray *degreeModelArray;

@property (nonatomic, strong) NSMutableArray *analyseModelArray;

@property (nonatomic, strong) NSMutableArray *curveModelArray;

@property (nonatomic, strong) NSMutableArray *titleArray;

@property (nonatomic, strong) NSMutableArray *wrongCountArray;

@property (nonatomic, strong) NSMutableArray *usualArray;

@property (nonatomic, strong) NSMutableArray *wrongArray;

@end

@implementation JFAnalyseController{
    
    JFDegreeView *degreeView;
    
    JFAnalyseView *analyseView;
    
    JFCurveView *curveView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_BACKGROUND;
    
    
    
    [self setSearchBar];
    [self setLeftItem];
    [self setRightItem];
    
    [self loadModel];
    [self setUI];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = NO;
}

- (void)setUI{

    FYLSegmentView *segmentView = [[FYLSegmentView alloc]initWithTitles:@[@"语文",@"数学",@"英语",@"物理",@"化学",@"生物",@"政治",@"历史",@"地理"]];
    _viewSegment = segmentView;
    segmentView.delegate = self;
    [self.view addSubview:segmentView];
    //!!!!不能省略
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    degreeView = [[JFDegreeView alloc]initWithFrame:CGRectMake(0, View_Y_HEIGHT(segmentView), ScreenW, 150)];
    analyseView = [[JFAnalyseView alloc]initWithFrame:CGRectMake(0, View_Y_HEIGHT(degreeView), ScreenW, 130)];
    curveView = [[JFCurveView alloc]initWithFrame:CGRectMake(0, View_Y_HEIGHT(analyseView), ScreenW, ScreenW-View_Y_HEIGHT(analyseView)-TAB_HEIGHT-NAV_HEIGHT)];
    
    [degreeView showInController:self];
    [analyseView showInController:self];
    [curveView showInController:self];
    
    [degreeView loadModel:_degreeModel];
    [analyseView loadModel:_analyseModel];
    [curveView loadModel:_curveModel];
    
    
}

- (void)loadModel{
    
    _degreeModel = [[JFDegreeModel alloc]init];
    _degreeModel.titleConut = @"718";
    _degreeModel.wrongCount = @"50";
    
    _analyseModel = [[JFAnalyseModel alloc]init];
    _analyseModel.usualString = @"选词填空、阅读理解、古诗文填空、词义辨析";
    _analyseModel.wrongString = @"古诗文填空、成语辨析、语病辨析";
    
    _curveModel = [[JFCurveModel alloc]init];
    _curveModel.horizontalDateArray = [[NSMutableArray alloc]initWithArray: @[@"7.1",@"7.2",@"7.3",@"7.4",@"7.5",@"7.6",@"7.7"]];
    NSArray *nowArray = @[@"30",@"50",@"80",@"100",@"140",@"30",@"20"];
    NSArray *allArray = @[@"130",@"110",@"80",@"100",@"140",@"50",@"120"];
    _curveModel.dataArray = [[NSMutableArray alloc]initWithArray:@[nowArray,allArray]];
    
    
    
    
    
}
#pragma mark - FYLSegmentViewDelegate
- (void)FYLSegmentView:(FYLSegmentView *)segmentView didClickTagAtIndex:(NSInteger)index{
    
    __weak typeof(JFAnalyseController *)weakSelf = self;
    [weakSelf.viewSegment setOffsetOfIndexView:0 withCurrentIndex:index];
    NSLog(@"click %ld",(long)index);
   
    _degreeModel.titleConut = @"435";
    _degreeModel.wrongCount = @"79";
    
    _analyseModel = [[JFAnalyseModel alloc]init];
    _analyseModel.usualString = @"词义辨析、短语搭配、从句辨析";
    _analyseModel.wrongString = @"阅读理解、短语搭配";
    
    _curveModel = [[JFCurveModel alloc]init];
    _curveModel.horizontalDateArray = [[NSMutableArray alloc]initWithArray: @[@"7.1",@"7.2",@"7.3",@"7.4",@"7.5",@"7.6",@"7.7"]];
    NSArray *nowArray = @[@"50",@"80",@"20",@"10",@"110",@"70",@"20"];
    NSArray *allArray = @[@"130",@"100",@"20",@"50",@"140",@"150",@"40"];
    _curveModel.dataArray = [[NSMutableArray alloc]initWithArray:@[nowArray,allArray]];

   
   
   
    [degreeView loadModel:_degreeModel];
    [analyseView loadModel:_analyseModel];
    [curveView loadModel:_curveModel];
   
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
