//
//  ZXView.m
//  折线图
//
//  Created by iOS on 16/6/28.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "ZXView.h"
@interface ZXView ()
//@property (nonatomic, strong) CAShapeLayer *lineChartLayer;
@property (nonatomic, strong)UIBezierPath * path1;
/** 渐变背景视图 */
@property (nonatomic, strong) UIView *gradientBackgroundView;
/** 渐变图层 */
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
/** 颜色数组 */
//@property (nonatomic, strong) NSMutableArray *gradientLayerColors;
@property (nonatomic,strong)NSMutableArray * lineChartLayerArray;
@end
@implementation ZXView
static CGFloat bounceX = 30;
static CGFloat bounceY = 60;
static NSInteger countq = 0;
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
     //   self.my
        self.backgroundColor = [UIColor whiteColor];
        self.lineChartLayerArray = [NSMutableArray array];
       // [self createLabelX];
       // [self createLabelY];
                        }
    return self;
}
- (void)setHorizontalDateArray:(NSArray *)horizontalDateArray{
    _horizontalDateArray = horizontalDateArray;
    [self createLabelX];
}
- (void)setVerticalDateArray:(NSArray *)verticalDateArray{
    _verticalDateArray = verticalDateArray;
    [self createLabelY];
  //  [self setLineDash];

}
- (void)setGradientLayerColors:(NSMutableArray *)gradientLayerColors{
    _gradientLayerColors = gradientLayerColors;
    [self drawGradientBackgroundView];
 [self setLineDash];
}
#pragma mark 创建下标的颜色标记
- (void)setLineColorArray:(NSArray *)lineColorArray{
    _lineColorArray = lineColorArray;
    for (NSInteger i = 0; i < lineColorArray.count; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake((self.frame.size.width - bounceX) - (i+1)*10 - 45*(i+1), self.frame.size.height - 13, 10, 10);
        btn.backgroundColor = lineColorArray[i];
        btn.tag = 666+i;
        [btn addTarget:self action:@selector(btnClict:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
    }
}
- (void)setLineNameArray:(NSArray *)lineNameArray{
    _lineNameArray = lineNameArray;
    for (NSInteger i = 0; i < lineNameArray.count; i++) {
        UIButton * btn = (UIButton*)[self viewWithTag:666 + i];
        UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(btn.frame)+2, self.frame.size.height - 15, 1.5*bounceX, 13)];
        nameLabel.text = self.lineNameArray[i];
        nameLabel.font = [UIFont systemFontOfSize:10.0];
        [self addSubview:nameLabel];
    }
}
- (void)btnClict:(UIButton*)btn{
        for (NSInteger lineNumber = 0; lineNumber< self.lineChartLayerArray.count; lineNumber++) {
            
                      for (NSInteger i = 0; i < self.horizontalDateArray.count; i++) {
                UILabel * label = (UILabel*)[self viewWithTag:3000*(lineNumber + 1) + i];
                if (lineNumber == btn.tag - 666) {
                    label.hidden = !label.hidden;
                }
            }
            
            CAShapeLayer *lineChartLayer = self.lineChartLayerArray[lineNumber];
            if (lineNumber == btn.tag - 666) {
                lineChartLayer.hidden = !lineChartLayer.hidden;
            }
        }
}
- (void)drawRect:(CGRect)rect{
       /*******画出坐标轴********/
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextMoveToPoint(context, bounceX, 0);
    CGContextAddLineToPoint(context, bounceX, rect.size.height - bounceY);
    CGContextAddLineToPoint(context,rect.size.width , rect.size.height - bounceY);
    CGContextStrokePath(context);
    
      }

#pragma mark 添加虚线
- (void)setLineDash{

    for (NSInteger i = 0;i < self.verticalDateArray.count; i++ ) {
        CAShapeLayer * dashLayer = [CAShapeLayer layer];
        dashLayer.strokeColor = [UIColor whiteColor].CGColor;
        dashLayer.fillColor = [[UIColor clearColor] CGColor];
        // 默认设置路径宽度为0，使其在起始状态下不显示
        dashLayer.lineWidth = 1.0;
        
        
        UILabel * label1 = (UILabel*)[self viewWithTag:2000 + i];
        
        UIBezierPath * path = [[UIBezierPath alloc]init];
        path.lineWidth = 1.0;
        UIColor * color = [UIColor blueColor];
        
        [color set];
        [path moveToPoint:CGPointMake( 0, label1.frame.origin.y )];
        [path addLineToPoint:CGPointMake(self.frame.size.width - bounceX,label1.frame.origin.y )];
        CGFloat dash[] = {10,10};
        [path setLineDash:dash count:2 phase:10];
        [path stroke];
        dashLayer.path = path.CGPath;
        [self.gradientBackgroundView.layer addSublayer:dashLayer];
    }
}

#pragma mark 创建x轴的数据
- (void)createLabelX{
    CGFloat  month = self.horizontalDateArray.count;
    for (NSInteger i = 0; i < self.horizontalDateArray.count; i++) {
        CGFloat widthlable = (self.frame.size.width - bounceX)/month- 5;
        CGFloat heightlable = widthlable/2;
        UILabel * LabelMonth = [[UILabel alloc]initWithFrame:CGRectMake((self.frame.size.width - bounceX)/month * i + bounceX, self.frame.size.height - bounceY + heightlable*0.5 , widthlable * 0.6, heightlable)];
      //  LabelMonth.backgroundColor = [UIColor greenColor];
        LabelMonth.tag = 1000 + i;
        LabelMonth.text = self.horizontalDateArray[i];
        LabelMonth.font = [UIFont systemFontOfSize:10];
        LabelMonth.transform = CGAffineTransformMakeRotation(M_PI * 0.3);
        [self addSubview:LabelMonth];
    }

}
#pragma mark 创建y轴数据
- (void)createLabelY{
    CGFloat Ydivision = self.verticalDateArray.count - 1;
    for (NSInteger i = 0; i < self.verticalDateArray.count ; i++) {
        UILabel * labelYdivision = [[UILabel alloc]initWithFrame:CGRectMake(0, (self.frame.size.height -  bounceY)/Ydivision *i , bounceX, bounceX/2.0)];
     //   labelYdivision.backgroundColor = [UIColor greenColor];
        labelYdivision.tag = 2000 + i;
       // labelYdivision.text = [NSString stringWithFormat:@"%.0f",(Ydivision - i)*100];
        labelYdivision.text = self.verticalDateArray[i];
         labelYdivision.font = [UIFont systemFontOfSize:10];
        [self addSubview:labelYdivision];
    }
}


#pragma mark 渐变的颜色
- (void)drawGradientBackgroundView {
    // 渐变背景视图（不包含坐标轴）
    self.gradientBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(bounceX, 0, self.bounds.size.width - bounceX, self.bounds.size.height - bounceY)];
    [self addSubview:self.gradientBackgroundView];
    /** 创建并设置渐变背景图层 */
    //初始化CAGradientlayer对象，使它的大小为渐变背景视图的大小
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = self.gradientBackgroundView.bounds;
    //设置渐变区域的起始和终止位置（范围为0-1），即渐变路径
    self.gradientLayer.startPoint = CGPointMake(0, 0.0);
    self.gradientLayer.endPoint = CGPointMake(1.0, 0.0);
    //设置颜色的渐变过程
    
    self.gradientLayer.colors = self.gradientLayerColors;
    //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
    [self.gradientBackgroundView.layer addSublayer:self.gradientLayer];
     //[self.layer addSublayer:self.gradientLayer];
}




#pragma mark 点击重新绘制折线和背景
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    countq++;
    if (countq%2 == 0) {
        for (NSInteger lineNumber = 0; lineNumber< self.lineChartLayerArray.count; lineNumber++) {
            CAShapeLayer *lineChartLayer = self.lineChartLayerArray[lineNumber];
            [lineChartLayer removeFromSuperlayer];
            for (NSInteger i = 0; i < self.horizontalDateArray.count; i++) {
                UILabel * label = (UILabel*)[self viewWithTag:3000*(lineNumber + 1) + i];
                [label removeFromSuperview];
            }
            
        }
        [self.lineChartLayerArray removeAllObjects];
    }else{
        
        [self dravLine];
        for (NSInteger i = 0; i< self.lineChartLayerArray.count; i++) {
            
            CAShapeLayer *lineChartLayer = self.lineChartLayerArray[i];
            lineChartLayer.lineWidth = 2;
            CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            pathAnimation.duration = 3;
            pathAnimation.repeatCount = 1;
            pathAnimation.removedOnCompletion = YES;
            pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
            pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
            // 设置动画代理，动画结束时添加一个标签，显示折线终点的信息
            pathAnimation.delegate = self;
            [lineChartLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
            //[self setNeedsDisplay];
        }
    }
}

#pragma mark 画折线图
- (void)dravLine{
    CGFloat MaxY ;

            CGFloat firstdate = [[NSString stringWithFormat:@"%@",self.verticalDateArray[0]] floatValue] ;
            CGFloat lastdate = [[NSString stringWithFormat:@"%@",[self.verticalDateArray lastObject]] floatValue];

                 MaxY = firstdate - lastdate;

       for(NSInteger LineNumber = 0; LineNumber < 2; LineNumber++){
        
        UILabel * label = (UILabel*)[self viewWithTag:1000];
        UIBezierPath * path = [[UIBezierPath alloc]init];
        path.lineWidth = 1.0;
        UIColor * color = [UIColor greenColor];
        [color set];
                             NSArray *array = self.dataArray[LineNumber];
                             CGFloat arc1 = [[NSString stringWithFormat:@"%@",array[0]] floatValue];
        [path moveToPoint:CGPointMake( label.frame.origin.x - bounceX + 3, (MaxY -arc1 + lastdate) /MaxY * (self.frame.size.height - bounceY )  )];
        
        //创建折现点标记
        for (NSInteger i = 1; i< self.horizontalDateArray.count; i++) {
            UILabel * label1 = (UILabel*)[self viewWithTag:1000 + i];
            NSArray *array = self.dataArray[LineNumber];
            CGFloat arc =[[NSString stringWithFormat:@"%@",array[i]] floatValue];

            [path addLineToPoint:CGPointMake(label1.frame.origin.x - bounceX,  (MaxY -arc + lastdate) /MaxY * (self.frame.size.height - bounceY ) )];
            UILabel * falglabel = [[UILabel alloc]initWithFrame:CGRectMake(label1.frame.origin.x  , (MaxY -arc +lastdate) /MaxY * (self.frame.size.height - bounceY )  , 30, 15)];
            falglabel.tag = 3000 * (LineNumber + 1)+ i;
            falglabel.text = [NSString stringWithFormat:@"%.1f",arc];
            falglabel.font = [UIFont systemFontOfSize:8.0];
            falglabel.textColor = self.lineColorArray[LineNumber];
            [self addSubview:falglabel];
        }
        
        CAShapeLayer *lineChartLayer = [CAShapeLayer layer];
        
        lineChartLayer.path = path.CGPath;
        UIColor * linecolors = (UIColor*)self.lineColorArray[LineNumber];
        lineChartLayer.strokeColor = linecolors.CGColor;
        lineChartLayer.fillColor = [[UIColor clearColor] CGColor];
        // 默认设置路径宽度为0，使其在起始状态下不显示
        lineChartLayer.lineWidth = 0;
        lineChartLayer.lineCap = kCALineCapRound;
        lineChartLayer.lineJoin = kCALineJoinRound;
        [self.lineChartLayerArray addObject:lineChartLayer];
        [self.gradientBackgroundView.layer addSublayer:lineChartLayer];//直接添加导视图上
        //   self.gradientBackgroundView.layer.mask = self.lineChartLayer;//添加到渐变图层

    }
    
    
}

- (void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"开始®");
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"停止~~~~~~~~");
}
@end
