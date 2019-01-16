//
//  JFInformationController.m
//  WrongBook
//
//  Created by apple on 2017/7/18.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFInformationController.h"

#import "JFInformationTableCell.h"
#import "JFInformationHeadTableCell.h"

#import "JFInformationHeadModel.h"
#import "JFInformationMainModel.h"

@interface JFInformationController ()<UITableViewDelegate,UITableViewDataSource>{
    
    JFInformationHeadModel *headModel;
}

@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray *modelArray;

@property (nonatomic, strong) NSMutableArray *imageArray;

@property (nonatomic, strong) NSMutableArray *headingArray;

@property (nonatomic, strong) NSMutableArray *contentArray;

@property (nonatomic, strong) NSMutableArray *labelArray;

@end

@implementation JFInformationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_BACKGROUND;
    _imageArray = [[NSMutableArray alloc]initWithArray:@[@"photo1",@"photo2"]];
    _headingArray = [[NSMutableArray alloc]initWithArray:@[@"2017年全国高考改革政策汇总",@"每天精心挑选常见高考题型，让你轻松学数学"]];
    _contentArray = [[NSMutableArray alloc]initWithArray:@[@"今年高考，部分省市对考试的分值做出了相关的调整",@"精心整理了今年以及往届的常考题型"]];
    _labelArray = [[NSMutableArray alloc]initWithArray:@[@"#高考# #热门#",@"#高考#"]];
    
    
    [self creatModel];
    [self setUI];
    
    
    // Do any additional setup after loading the view.
}


- (void)setUI{
    
    self.myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.myTableView.backgroundColor = [UIColor clearColor];
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    [self.myTableView registerNib:[UINib nibWithNibName:@"JFInformationHeadTableCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"JFInformationHeadTableCell"];
    
    [self.view addSubview:self.myTableView];
    
    
    
}



- (void)creatModel{
    
    
    headModel = [[JFInformationHeadModel alloc]init];
    headModel.image = [UIImage imageNamed:@"高考4"];
    headModel.heading = @"高考状元的心得体会，你get到了吗？";
    headModel.subheading = @"为你揭秘各省高考状元的学习之法";
    
    
    _modelArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < _imageArray.count; i++) {
        JFInformationMainModel *model = [[JFInformationMainModel alloc]init];
        model.image = [UIImage imageNamed:_imageArray[i]];
        model.heading = _headingArray[i];
        model.content = _contentArray[i];
        model.label = _labelArray[i];
        
        [_modelArray addObject:model];
    }
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
    }else
        return _modelArray.count;
    return 0;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 240;
    }
    else if (indexPath.section == 1){
        return 150;
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        static NSString *identifier = @"JFInformationHeadTableCell";
        
        
        JFInformationHeadTableCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.imaView.image = headModel.image;
        cell.titleLabel.text = headModel.heading;
        cell.subheadingLabel.text = headModel.subheading;
        
        
        return cell;

    }else if (indexPath.section == 1){
        static NSString *identifier = @"JFInformationTableCell";
        
        UINib *nib = [UINib nibWithNibName:@"JFInformationTableCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:identifier];
        JFInformationTableCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        JFInformationMainModel *model = [[JFInformationMainModel alloc]init];
        model = _modelArray[indexPath.row];
        
        cell.rightImageView.image = model.image;
        cell.title.text = model.heading;
        cell.content.text = model.content;
        cell.label.text = model.label;
        
        if (!cell) {
            nib = [UINib nibWithNibName:@"JFInformationTableCell" bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:identifier];
            //        cell = [[[NSBundle mainBundle] loadNibNamed:@"AlarmTableViewCell" owner:self options:nil]firstObject];
        }

        return cell;
        
    }
    
    
    
    
    
    return nil;
    
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
