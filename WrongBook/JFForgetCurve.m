//
//  JFForgetCurve.m
//  WrongBook
//
//  Created by apple on 2017/8/5.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFForgetCurve.h"

@implementation JFForgetCurve{
    
    UIImageView *curveImageView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        curveImageView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, frame.size.width-80, frame.size.height-40)];
        curveImageView.image = [UIImage imageNamed:@"曲线图"];
        [self addSubview:curveImageView];
        
    }
    
    return self;
}

- (void)hidden{
    
    [curveImageView removeFromSuperview];
    
}
- (void)add{
    
    [self addSubview:curveImageView];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
