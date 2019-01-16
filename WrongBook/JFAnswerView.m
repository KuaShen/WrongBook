//
//  JFAnswerView.m
//  WrongBook
//
//  Created by apple on 2017/8/1.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFAnswerView.h"
#import "DrawTouchPointView.h"
#import "DrawBackgoupImageView.h"


@interface JFAnswerView ()<UITextViewDelegate>{
    
    DrawBackgoupImageView *answer;
    
    UIButton *pan;
    UIButton *location;
    UIButton *similar;
    
    UIView *panColorBackview;
    UIView *locationView;
    
    BOOL panSelected;
    BOOL locationSelected;
//    BOOL drawable;
    BOOL touchable;
    BOOL isExistLocationView;
    BOOL canEdit;
    BOOL isExistTextView;
    BOOL locationOn;
    
    CGFloat previousTag;
    NSInteger nowFlagTag;
    NSInteger index;
    NSInteger flagNumber;
    
    NSArray *colorArray;
    CGPoint locationPoint;
    
}

@property (nonatomic, weak) JFBaseViewController *rootViewController;

@end


@implementation JFAnswerView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        panSelected = NO;
        locationSelected = NO;
        touchable = NO;
        isExistLocationView = NO;
        canEdit = NO;
        isExistTextView = NO;
        locationOn = NO;
        
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *answerView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 15, 22, 30)];
        answerView.image = [UIImage imageNamed:@"答案"];
        UILabel *answerLabel = [[UILabel alloc]initWithFrame:CGRectMake(65, 20, 60, 20)];
        answerLabel.backgroundColor = [UIColor clearColor];
        answerLabel.text = @"答案";
        answerLabel.textColor = [UIColor grayColor];
        answer  = [DrawBackgoupImageView initWithImage:[UIImage  imageNamed:@"photo2"] frame:CGRectMake(30, 65, frame.size.width-50, frame.size.height-235) lineWidth:1.5 lineColor:[UIColor clearColor]];
//        answer = [[UIImageView alloc]initWithFrame:CGRectMake(30, 65, frame.size.width-50, frame.size.height-235)];
//        answer.editable = NO;
//        answer.selectable = NO;
//        answer.image = [UIImage imageNamed:@"photo1"];
        answer.userInteractionEnabled = YES;
//        answer.backgroundColor = [UIColor clearColor];
        
        pan = [[UIButton alloc]initWithFrame:CGRectMake(frame.size.width-80, frame.size.height-170+8, 20, 20)];
        [pan setImage:[UIImage imageNamed:@"笔"] forState:UIControlStateNormal];
        [pan addTarget:self action:@selector(getPan) forControlEvents:UIControlEventTouchUpInside];
        
        
        location = [[UIButton alloc]initWithFrame:CGRectMake(frame.size.width-40, frame.size.height-170+8, 15, 20)];
        [location setImage:[UIImage imageNamed:@"标注"] forState:UIControlStateNormal];
        [location addTarget:self action:@selector(getLocation) forControlEvents:UIControlEventTouchUpInside];
        
        similar = [[UIButton alloc]initWithFrame:CGRectMake(frame.size.width/2-120, frame.size.height-110, 240, 30)];
        similar.layer.cornerRadius = 8;
        similar.clipsToBounds = YES;
        [similar setTitle:@"相似题型" forState:UIControlStateNormal];
        [similar setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [similar setBackgroundColor:COLOR_MAIN];
        [similar addTarget:self action:@selector(pushToSimilarController) forControlEvents:UIControlEventTouchUpInside];
        panColorBackview = [[UIView alloc]initWithFrame:CGRectMake(pan.frame.origin.x+20, View_Y_HEIGHT(pan), 0, 20)];
        panColorBackview.layer.cornerRadius = 8;
        panColorBackview.userInteractionEnabled = YES;
        colorArray = @[RGB(225, 0, 64),RGB(234, 90, 56),RGB(255, 243, 77),RGB(0, 142, 52),RGB(0, 0, 0)];
        panColorBackview.backgroundColor = RGB(215, 215, 215);
        
        locationView = [[UIView alloc]init];
        locationView.backgroundColor = [UIColor clearColor];
        
        [self addSubview:answerView];
        [self addSubview:answerLabel];
        [self addSubview:answer];
        [self addSubview:pan];
        [self addSubview:location];
        [self addSubview:similar];
        [self addSubview:panColorBackview];
        [self addSubview:locationView];
        
        previousTag = 2000;
        index  = 0;
        flagNumber = 0;
        nowFlagTag = 1000;
        NSLog(@"touchable == == %d",touchable);
    }
    
    
    return self;
}

- (void)pan:(UIButton *)sender{
    NSLog(@"buttonClick");
//    drawable = YES;
    if (sender.tag >= 2000) {
         UIButton *previous = (UIButton *)[self viewWithTag:previousTag];
        previous.layer.borderWidth = 0;
        sender.layer.borderWidth = 1.5;
    }
    
    [answer setStrokeColor:colorArray[sender.tag%2000]];
    
    previousTag = sender.tag;
    
}

- (void)getPan{

    if (panSelected) {
        panSelected = NO;
        [pan setImage:[UIImage imageNamed:@"笔"] forState:UIControlStateNormal];
        [self hidePanColor];
    }else{
        panSelected = YES;
        [pan setImage:[UIImage imageNamed:@"笔－选中"] forState:UIControlStateNormal];
        [self showPanColor];
        
    }
    
}

- (void)showPanColor{

    
    [answer setStrokeColor:RGBA(225, 0, 64, 1.0)];
    [UIView animateWithDuration:0.5 animations:^{
        [panColorBackview setFrame:CGRectMake(pan.frame.origin.x-120, View_Y_HEIGHT(pan), 140, 20)];
        
    }];
    
    [self creatDrawButtons];
    
}

- (void)hidePanColor{
    
    
    [answer setStrokeColor:RGBA(0, 0, 0, 0)];
    
    [UIView animateWithDuration:0.5 animations:^{
        [panColorBackview setFrame:CGRectMake(pan.frame.origin.x+20, View_Y_HEIGHT(pan), 0, 20)];
        [panColorBackview.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        NSLog(@"hide Information --------------  %@",panColorBackview.subviews);
    }];
    
    
}



- (void)creatDrawButtons{
    
    for (int i = 0; i < 5; i++) {
        
        UIButton *draw = [[UIButton alloc]initWithFrame:CGRectMake(15+15*i+9*i+7.5, 2.5+7.5, 0, 0)];
        draw.backgroundColor = colorArray[i];
        draw.tag = 2000+i;
        
        [draw addTarget:self action:@selector(pan:) forControlEvents:UIControlEventTouchUpInside];
        [panColorBackview addSubview:draw];
        NSLog(@"drawTag == %ld",(long)draw.tag);
        NSLog(@"%@",draw);
        
    }
    for (int i = 0; i < 5; i++) {
        [UIView animateWithDuration:1 animations:^{
            UIButton *draw = (UIButton *)[self viewWithTag:2000+i];
            draw.frame = CGRectMake(15+15*i+9*i, 2.5, 15, 15);
            draw.layer.cornerRadius = 7.5;
            draw.clipsToBounds = YES;
            if (draw.tag == 2000) {
                draw.layer.borderWidth = 1.5;
            }
            draw.layer.borderColor = [UIColor whiteColor].CGColor;
        }];
        
    }

}



- (void)getLocation{
    if (locationSelected) {
        locationSelected = NO;
//        touchable = NO;
        isExistLocationView = NO;
        [location setImage:[UIImage imageNamed:@"标注"] forState:UIControlStateNormal];
//        locationView.frame = CGRectMake(0, 0, 0, 0);
        [self cancelPutting];
    }else{
        locationSelected = YES;
        isExistLocationView = YES;
        
        [location setImage:[UIImage imageNamed:@"已标注"] forState:UIControlStateNormal];
        
        locationView.frame = answer.frame;
        
        [self putLocationFlag];
    }
    
}


- (void)putLocationFlag{
    NSLog(@"putLocationFlag");
    
    locationOn = YES;
    touchable = YES;
    
    NSLog(@"touchable == == %d",touchable);
    
}


- (void)cancelPutting{
    NSLog(@"cancelPutting");
    locationOn = NO;
    touchable = NO;
    NSLog(@"touchable == == %d",touchable);
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    if (!touchable) {
        
//        for (int i = 0; i < flagNumber; i++) {
//            UIButton *button = (UIButton *)[self viewWithTag:1000+i];
//            button.enabled = YES;
//        }
        [self endEditing:YES];
        return;
    }

    for (int i = 0; i < flagNumber; i++) {
        UIButton *button = (UIButton *)[self viewWithTag:1000+i];
        button.enabled = NO;
        button.backgroundColor = COLOR_DISABLE_BG;
        NSLog(@"button.tag   ==== %ld",(long)button.tag);
    }
    UITouch *touch = [touches anyObject];
    NSLog(@"touch now == %@",touch);
    if (touch) {
        locationPoint = [touch locationInView:locationView];
        NSLog(@"touch point == (%f,%f)",locationPoint.x,locationPoint.y);
//        NSLog(@"answer's view is %@",locationView);
        UIButton *flag = [[UIButton alloc]initWithFrame:CGRectMake(locationPoint.x-15/2, locationPoint.y-20, 15, 20)];
        [flag setImage:[UIImage imageNamed:@"已标注"] forState:UIControlStateNormal];
        [flag addTarget:self action:@selector(showFlagTextView:) forControlEvents:UIControlEventTouchUpInside];
        flag.tag = flagNumber+1000;
        
        NSLog(@"flag.tag =====  %ld",(long)flag.tag);
        nowFlagTag = flag.tag;
        flagNumber++;
        isExistTextView = NO;
        if (locationOn) {
            touchable = NO;
        }else
            touchable = NO;
        
        canEdit = NO;
        [locationView addSubview:flag];
        NSLog(@"touchable == == %d",touchable);
    }
    
}


- (void)showFlagTextView:(UIButton *)sender{
    
    
    if (!isExistTextView) {
        UITextView *flagTextView = [[UITextView alloc]initWithFrame:CGRectMake(sender.frame.origin.x+15/2+30, sender.frame.origin.y+20+65, 80, 80)];
        flagTextView.font = FONT(10);
        flagTextView.layer.cornerRadius = 3;
        flagTextView.layer.masksToBounds = YES;
        NSLog(@"flagTextView == %@",flagTextView);
        flagTextView.tag = sender.tag-200;
        flagTextView.backgroundColor = RGB(255, 198, 109);
        flagTextView.delegate = self;
        [self addSubview:flagTextView];
        
        isExistTextView = YES;

    }else{
        
        if (!canEdit) {
            
            
            CGRect preFrame = sender.frame;
            sender.frame = CGRectMake(preFrame.origin.x, preFrame.origin.y, 10, 10);
            sender.layer.cornerRadius = 5;
            sender.clipsToBounds = YES;
            sender.backgroundColor = RGB(255, 198, 109);
//            sender.layer.cornerRadius = 0;
//            sender.clipsToBounds = NO;
            [sender setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            
            sleep(0.2);
            UITextView *flagTextView = (UITextView *)[self viewWithTag:sender.tag-200];
            [flagTextView setHidden:YES];
            
            for (int i = 0; i < flagNumber; i++) {
                UIButton *button = (UIButton *)[self viewWithTag:1000+i];
                button.enabled = YES;
                button.backgroundColor = RGB(255, 198, 109);
//                NSLog(@"button.tag   ==== %ld",(long)button.tag);
            }
            if (locationOn)
                touchable = YES;
            else
                touchable = NO;
            canEdit = YES;
            NSLog(@"touchable == == %d",touchable);
            
        }else{
            
            
            CGRect preFrame = sender.frame;
            sender.frame = CGRectMake(preFrame.origin.x, preFrame.origin.y, 15, 20);
            //            sender.layer.cornerRadius = 5;
            //            sender.clipsToBounds = YES;
            sender.backgroundColor = [UIColor clearColor];
            sender.layer.cornerRadius = 0;
            sender.clipsToBounds = NO;
            [sender setImage:[UIImage imageNamed:@"已标注"] forState:UIControlStateNormal];

            sleep(0.2);
            UITextView *flagTextView = (UITextView *)[self viewWithTag:sender.tag-200];
            [flagTextView setHidden:NO];

            
            canEdit = NO;
            if (locationOn)
                touchable = NO;
            else
                touchable = NO;
            NSLog(@"touchable == == %d",touchable);
        }
        
        
        
    }
    
    
    
    nowFlagTag = sender.tag;
    
}






- (void)pushToSimilarController{
    
    
}

- (void)addData:(JFHistoryAnswerModel *)model{
    _model = model;
    
//    answer.text = model.answer;
    
}



- (void)showInController:(JFBaseViewController *)rootViewController{
    
    _rootViewController = rootViewController;
    
    [_rootViewController.view addSubview:self];
    
}

#pragma ---------------  TextView  Delegate----------------------

- (void)textViewDidEndEditing:(UITextView *)textView{
    
    UIButton *button = (UIButton *)[self viewWithTag:nowFlagTag];
    CGRect preFrame = button.frame;
    button.frame = CGRectMake(preFrame.origin.x, preFrame.origin.y, 10, 10);
    button.layer.cornerRadius = 5;
    button.clipsToBounds = YES;
    button.backgroundColor = RGB(255, 198, 109);
    //            sender.layer.cornerRadius = 0;
    //            sender.clipsToBounds = NO;
    [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    sleep(0.2);
    UITextView *flagTextView = (UITextView *)[self viewWithTag:button.tag-200];
    [flagTextView setHidden:YES];
    
    if (locationOn)
        touchable = YES;
    else
        touchable = NO;
//    canEdit = YES;
    NSLog(@"touchable == == %d",touchable);
//    return YES;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
