//
//  JFRecommendController.m
//  WrongBook
//
//  Created by apple on 2017/7/31.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFRecommendController.h"
#import "JFYoungClassCollectionCell.h"

@interface JFRecommendController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *colView;

@property (nonatomic, strong) NSMutableArray *modelArray;

@property (nonatomic, strong) NSMutableArray *imageArray;

@property (nonatomic, strong) NSMutableArray *contentArray;

@property (nonatomic, strong) NSMutableArray *countArray;

@end

@implementation JFRecommendController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageArray = [[NSMutableArray alloc]initWithArray:@[@"高考2",@"高考3",@"高考4",@"高考5"]];
    _contentArray = [[NSMutableArray alloc]initWithArray:@[@"诗歌鉴赏试题答题方法步骤及答题模式",@"考试的时候，你怯场了该怎么办？",@"学习记忆规律，掌握记忆方法",@"做到这十条，作文次次满分！"]];
    _countArray = [[NSMutableArray alloc]initWithArray:@[@"9000",@"7631",@"3078",@"439"]];
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _colView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.colView.backgroundColor = COLOR_BACKGROUND;
    _colView.delegate = self;
    _colView.dataSource = self;
    
    [self.view addSubview:self.colView];
    
    [self creatModel];
    // Do any additional setup after loading the view.
}

- (void)creatModel{
    
    _modelArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < _imageArray.count; i++) {
        JFYoungClassModel *model = [[JFYoungClassModel alloc]init];
        
        model.image = [UIImage imageNamed:_imageArray[i]];
        model.content = _contentArray[i];
        model.count = [_countArray[i] integerValue];
        
        [_modelArray addObject:model];
    }
    
    
}


//配置section数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//配置UICollectionView的每个section的item数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _modelArray.count;
}

//呈现数据
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"JFYoungClassCollectionCell";
    [collectionView registerNib:[UINib nibWithNibName:cellID bundle:nil] forCellWithReuseIdentifier:cellID];
    JFYoungClassModel *model = [[JFYoungClassModel alloc]init];
    model = _modelArray[indexPath.item];
    JFYoungClassCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.imaView.image = model.image;
    cell.contentLabel.text = model.content;
    cell.countLabel.text = [NSString stringWithFormat:@"%ld",model.count];
    [cell.button setTitle:@"加入" forState:UIControlStateNormal];
    [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (void)buttonAction:(UIButton *)sender{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"您已成功加入" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}


//配置每个item的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((ScreenW-60)/2, 220);
}

//配置item的边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 20, 0, 20);
}
//点击item时触发
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"您点击了item" );
    [collectionView cellForItemAtIndexPath:indexPath].backgroundColor = [UIColor redColor];
    
}

//当前ite是否可以点击
- (BOOL) collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (indexPath.row % 2)
    {
        return YES;
    }
    
    return NO;
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
