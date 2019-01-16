//
//  JFTitleView.m
//  WrongBook
//
//  Created by apple on 2017/8/1.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFTitleView.h"

@interface JFTitleView (){
    
    UILabel *titleLabel;
    UIButton *inquiryButton;
    UIButton *addtionButton;
    UIButton *collectionButton;
    
    BOOL addtionSelected;
    BOOL collectionSelected;
    
}


@property (nonatomic, weak) JFBaseViewController *rootViewController;

@end


@implementation JFTitleView
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        addtionSelected = NO;
        collectionSelected = NO;
        self.backgroundColor = [UIColor whiteColor];
        titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, frame.size.width-30, frame.size.height-55)];
        titleLabel.numberOfLines = 0;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor grayColor];
        
        UIView *buttonView = [[UIView alloc]initWithFrame:CGRectMake(15+frame.size.width-130, frame.size.height-35, 115, 25)];
        buttonView.backgroundColor = [UIColor clearColor];
        
        inquiryButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [inquiryButton setImage:[UIImage imageNamed:@"提问"] forState:UIControlStateNormal];
        [inquiryButton addTarget:self action:@selector(pushToInquiry) forControlEvents:UIControlEventTouchUpInside];
        
        
        addtionButton = [[UIButton alloc]initWithFrame:CGRectMake(35, 0, 20, 20)];
        [addtionButton setImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
        [addtionButton addTarget:self action:@selector(addtionAction) forControlEvents:UIControlEventTouchUpInside];
        
        
        collectionButton = [[UIButton alloc]initWithFrame:CGRectMake(70, 0, 20, 20)];
        [collectionButton setImage:[UIImage imageNamed:@"收藏"] forState:UIControlStateNormal];
        [collectionButton addTarget:self action:@selector(collectionAction) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:titleLabel];
        [self addSubview:buttonView];
        [buttonView addSubview:inquiryButton];
        [buttonView addSubview:addtionButton];
        [buttonView addSubview:collectionButton];
    }
    
    
    return self;
}

- (void)addData:(JFHistoryTitleModel *)model{
    _titleModel = model;
    
    titleLabel.text = model.title;
    
    
}

- (void)pushToInquiry{
    
    
    
}

- (void)addtionAction{
    
    if (addtionSelected) {
        addtionSelected = NO;
        [addtionButton setImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
    }else{
        addtionSelected = YES;
        [addtionButton setImage:[UIImage imageNamed:@"已添加"] forState:UIControlStateNormal];
    }
    
}


- (void)collectionAction{
    if (collectionSelected) {
        collectionSelected = NO;
        [collectionButton setImage:[UIImage imageNamed:@"收藏"] forState:UIControlStateNormal];
    }else{
        collectionSelected = YES;
        [collectionButton setImage:[UIImage imageNamed:@"已收藏"] forState:UIControlStateNormal];
    }
    
    
}


- (void)showInController:(JFBaseViewController *)rootViewController{
    
    _rootViewController = rootViewController;
    
    [_rootViewController.view addSubview:self];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
