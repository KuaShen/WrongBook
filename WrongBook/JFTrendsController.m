//
//  JFTrendsController.m
//  WrongBook
//
//  Created by apple on 2017/7/18.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFTrendsController.h"

#import "JFTrendsModel.h"
#import "JFTrendsTableCell.h"
#import "SDAutoLayout.h"

@interface JFTrendsController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray *modelsArray;

@end

@implementation JFTrendsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_BACKGROUND;
    
    [self creatModels];
    [self setupTableView];
    
    // Do any additional setup after loading the view.
}

- (void)setupTableView{
    
    self.myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.myTableView.backgroundColor = COLOR_BACKGROUND;
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"JFTrendsTableCell" bundle:nil] forCellReuseIdentifier:@"JFTrendsTableCell"];
    
    [self.view addSubview:self.myTableView];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
}

- (void)creatModels{
    
    if (!_modelsArray) {
        _modelsArray = [NSMutableArray new];
        
        
        JFTrendsModel *model = [[JFTrendsModel alloc]init];
        model.headImage = [UIImage imageNamed:@"photo1"];
        model.nikename = @"叫我霸霸";
        model.level = @"Lv1";
        model.designation = @"学霸";
        model.content = @"在前进的路上，只有我们愿意努力才会看见明天的朝阳,建军节快乐";
        model.date = @"2017-8-1";
        model.count = 50;
        
        [_modelsArray addObject:model];
        
        
    }
    
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.modelsArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JFTrendsTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JFTrendsTableCell"];
    
    cell.model = self.modelsArray[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JFTrendsModel *model = self.modelsArray[indexPath.row];
    
    return [self.myTableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[JFTrendsTableCell class] contentViewWidth:[self cellContentViewWith]];
    
    /*
     *  第二种返回cell高度的方法，此方法不需要设置keyPath，适合一个cell与多个model的情况
     
     AutoCellHeightDataSettingBlock dataSetting = ^(UITableViewCell *cell) {
     DemoVC14Cell *myCell = (DemoVC14Cell *)cell;
     myCell.model = demoVC14Modelodel;
     };
     
     return [self.tableView cellHeightForIndexPath:indexPath
     cellClass:[DemoVC14Cell class]
     cellContentViewWidth:[UIScreen mainScreen].bounds.size.width cellDataSetting:dataSetting];
     */
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}

- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
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
