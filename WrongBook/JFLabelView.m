//
//  JFLabelView.m
//  WrongBook
//
//  Created by apple on 2017/7/16.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFLabelView.h"
@interface JFLabelView(){
    
    
    CGFloat previousTag;
    NSInteger index;
}


@end


@implementation JFLabelView


- (instancetype)initWithArray:(NSArray *)array andFrameY:(CGFloat)y{
//    self = [super init];
    self = [super init];
    if (self) {
        NSInteger section = array.count / 6 + 1;
        
        self.frame = CGRectMake(0, y, ScreenW, 40*section);
        [self creatButtonWithArray:array];
        
        UIButton *button = (UIButton *)[self viewWithTag:400];
        [button setBackgroundColor:RGB(255, 192, 93)];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        previousTag = 400;
    }
    
    
    return self;
}


- (void)creatButtonWithArray:(NSArray *)titleArray{
    CGFloat buttonWidth = (ScreenW-40)/6;
    CGFloat flow = (buttonWidth-40)/2;
    NSInteger mySection = titleArray.count / 6 + 1;
    NSInteger myCount = 0;
    NSInteger allCount = titleArray.count;
    for (int section = 0; section < mySection; section++) {
        if (allCount > 6){
            myCount = 6;
            allCount -= 6;
        }else{
            myCount = allCount % 6;
        }
        _baseTag = 400+100*section;
        for (int count = 0; count < myCount; count++) {
            UIButton *button = [[UIButton alloc]init];
            button.frame = CGRectMake(20+flow+buttonWidth*count, 10+40*section, 40, 20);
            button.tag = _baseTag+count;
            button.layer.cornerRadius = 8;
            button.clipsToBounds = YES;
            button.titleLabel.font = FONT(12);
            
            [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:titleArray[section*6+count] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [self addSubview:button];
            
            NSLog(@"section == %d, count == %d, buttonTag == %ld",section, count, button.tag);
            
        }
        
        

    }
    
}


- (void)clickButton:(UIButton *)button{
    index = 0;
    if (previousTag >= 400) {
        UIButton *previous = (UIButton *)[self viewWithTag:previousTag];
        [previous setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [previous setBackgroundColor:[UIColor clearColor]];
    }
    if (button.tag >= 400) {
        index = button.tag % 100;
    }else if (button.tag >= 500){
        index = button.tag % 100 + 6;
    }else if (button.tag >= 600){
        index = button.tag % 100 + 6 * 2;
    }
    [button setBackgroundColor:RGB(255, 192, 93)];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    previousTag = button.tag;
    
    self.returnIndex(index);
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
