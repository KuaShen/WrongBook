//
//  JFStartToAnswerController.m
//  WrongBook
//
//  Created by apple on 2017/7/31.
//  Copyright © 2017年 lab. All rights reserved.
//


//Review && Today
#import "JFStartToAnswerController.h"
#import "SDAutoLayout.h"



//[A-Z]+\. 匹配选项的正则表达式
@interface JFStartToAnswerController ()

@property (nonatomic, strong) UILabel *titleContentLabel;

@property (nonatomic, strong) NSMutableArray *titleArray;

@property (nonatomic, strong) NSMutableArray *answerArray;



@end

@implementation JFStartToAnswerController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArray = [[NSMutableArray alloc]init];
    _answerArray = [[NSMutableArray alloc]init];
    
    
    [self setUI];
    // Do any additional setup after loading the view.
}

- (void)setUI{
    
    UIImageView *backImageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    backImageView.image = [UIImage imageNamed:@"todayBackImage"];
    
    [self.view addSubview:backImageView];
    
    _titleContentLabel = [[UILabel alloc]init];
    _titleContentLabel.backgroundColor = [UIColor clearColor];
    _titleContentLabel.textColor = [UIColor grayColor];
    _titleContentLabel.numberOfLines = 0;
    _titleContentLabel.font = FONT(15);
    
   
    
    
    
    
    
    
    
     [self.view addSubview:_titleContentLabel];
    self.titleContentLabel.sd_layout
    .leftSpaceToView(self.view, 20)
    .rightSpaceToView(self.view, 20)
    .topSpaceToView(self.view, 25)
    .minHeightIs(20);
    
    
    
    
    
}

- (UIView *)creatItemView:(NSString *)itemString underView:(UIView *)view{
    
    
    UIView *backgroundView = [[UIView alloc]init];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"选择"]];
    UILabel *answerLabel = [[UILabel alloc]init];
    answerLabel.text = itemString;
    answerLabel.numberOfLines = 0;
    answerLabel.font = FONT(15);
    answerLabel.textColor = [UIColor grayColor];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]init];
    tapGesture.numberOfTouchesRequired = 1;//几个手势
    tapGesture.numberOfTapsRequired = 1;//设置轻拍几次
    [tapGesture addTarget:self action:@selector(tapAction: withView:)];
    [backgroundView addGestureRecognizer:tapGesture];
    
    [self.view addSubview:backgroundView];
    [backgroundView addSubview:imageView];
    [backgroundView addSubview:answerLabel];
    
    backgroundView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(view, 5)
    .minHeightIs(20);
    
    imageView.sd_layout
    .leftSpaceToView(backgroundView, 20)
    .topSpaceToView(backgroundView, 0)
    .widthIs(18)
    .heightIs(18);
    
    answerLabel.sd_layout
    .leftSpaceToView(imageView, 10)
    .topSpaceToView(backgroundView, 0)
    .rightSpaceToView(backgroundView, 20)
    .bottomSpaceToView(backgroundView, 10);
    
    
    
    return backgroundView;
}

- (void)tapAction:(UITapGestureRecognizer *)tapGes withView:(UIView *)view{
    


}




- (void)addItem:(NSString *)message underView:(UIView *)view{
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
    
    
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
