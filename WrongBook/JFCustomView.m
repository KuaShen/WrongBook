//
//  JFCustomView.m
//  WrongBook
//
//  Created by apple on 2017/8/5.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFCustomView.h"

@interface JFCustomView ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *firstTF;

@property (nonatomic, strong) UITextField *secondTF;

@property (nonatomic, strong) UITextField *thirdTF;

@end


@implementation JFCustomView{
    UILabel *firstLabel;
    UILabel *later;
    UILabel *secondLabel;
    UILabel *later1;
    UILabel *thirdLabel;
    UILabel *later2;
    
}


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor whiteColor];
        
        firstLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 20, 80, 20)];
        firstLabel.text = @"第一阶段";
        firstLabel.textColor = [UIColor grayColor];
        _firstTF = [[UITextField alloc]initWithFrame:CGRectMake(View_X_WIDTH(firstLabel), Y_EQUAL(firstLabel), 40, 20)];
        _firstTF.layer.borderWidth = 0.5;
        _firstTF.layer.borderColor = [UIColor grayColor].CGColor;
        _firstTF.layer.masksToBounds = YES;
        later = [[UILabel alloc]initWithFrame:CGRectMake(View_X_WIDTH(_firstTF), Y_EQUAL(firstLabel), 40, 20)];
        later.text = @"天后";
        later.textColor = [UIColor grayColor];
        [self addSubview:firstLabel];
        [self addSubview:_firstTF];
        [self addSubview:later];
        
        
        
        
        secondLabel = [[UILabel alloc]initWithFrame:CGRectMake(X_EQUAL(firstLabel), View_Y_HEIGHT(firstLabel), 80, 20)];
        secondLabel.text = @"第二阶段";
        secondLabel.textColor = [UIColor grayColor];
        _secondTF = [[UITextField alloc]initWithFrame:CGRectMake(View_X_WIDTH(secondLabel), Y_EQUAL(secondLabel), 40, 20)];
        _secondTF.layer.borderWidth = 0.5;
        _secondTF.layer.borderColor = [UIColor grayColor].CGColor;
        _secondTF.layer.masksToBounds = YES;
        later1 = [[UILabel alloc]initWithFrame:CGRectMake(View_X_WIDTH(_secondTF), Y_EQUAL(secondLabel), 40, 20)];
        later1.text = @"天后";
        later1.textColor = [UIColor grayColor];
        [self addSubview:secondLabel];
        [self addSubview:_secondTF];
        [self addSubview:later1];

        
        thirdLabel = [[UILabel alloc]initWithFrame:CGRectMake(X_EQUAL(firstLabel), View_Y_HEIGHT(secondLabel), 80, 20)];
        thirdLabel.text = @"第三阶段";
        thirdLabel.textColor = [UIColor grayColor];
        _thirdTF = [[UITextField alloc]initWithFrame:CGRectMake(View_X_WIDTH(thirdLabel), Y_EQUAL(thirdLabel), 40, 20)];
        _thirdTF.layer.borderWidth = 0.5;
        _thirdTF.layer.borderColor = [UIColor grayColor].CGColor;
        _thirdTF.layer.masksToBounds = YES;
        later2 = [[UILabel alloc]initWithFrame:CGRectMake(View_X_WIDTH(_thirdTF), Y_EQUAL(thirdLabel), 40, 20)];
        later2.text = @"天后";
        later2.textColor = [UIColor grayColor];
        [self addSubview:thirdLabel];
        [self addSubview:_thirdTF];
        [self addSubview:later2];

        _firstTF.delegate = self;
        _secondTF.delegate = self;
        _thirdTF.delegate = self;
        
        
    }
    
    return self;
}

- (void)hidden{
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (void)add{
    
    [self addSubview:firstLabel];
    [self addSubview:_firstTF];
    [self addSubview:later];
    
    [self addSubview:secondLabel];
    [self addSubview:_secondTF];
    [self addSubview:later1];
    
    [self addSubview:thirdLabel];
    [self addSubview:_thirdTF];
    [self addSubview:later2];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self endEditing:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"textFieldShouldReturn");
    [textField resignFirstResponder];
    return YES;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
