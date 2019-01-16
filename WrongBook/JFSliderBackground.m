//
//  JFSliderBackground.m
//  WrongBook
//
//  Created by apple on 2017/7/19.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFSliderBackground.h"
#import "SDAutoLayout.h"
#import "GPUImage.h"

@interface JFSliderBackground(){
    
    UIImageView *attendance;
    
    UILabel *attendanceL;
    
}

@property (nonatomic, strong) UIImageView *backgroundImageView;

@property (nonatomic, strong) UIImageView *headImageView;

@property (nonatomic, strong) UILabel *nikeName;

@property (nonatomic, strong) UIView *clickView;


 

@end

@implementation JFSliderBackground


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
        [self autoLayout];
    }
    return self;
}


- (void)buildUI{
    
    
    [self setupBackgroundImageView];
    [self setupHeadImageView];
    [self setupNikeName];
    [self setupClickView];
    
    [self addSubview:_backgroundImageView];
//    [self addSubview:visualEffectView];
    [self addSubview:_headImageView];
    [self addSubview:_nikeName];
    [self addSubview:_clickView];
    
    
}

- (void)autoLayout{

    self.backgroundImageView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topEqualToView(self)
    .bottomEqualToView(self);
    
    self.headImageView.sd_layout
    .centerXEqualToView(self)
    .centerYEqualToView(self)
    .widthIs(100)
    .heightEqualToWidth();
    
    self.nikeName.sd_layout
    .centerXEqualToView(self.headImageView)
    .topSpaceToView(_headImageView, 3)
    .heightIs(20);
    [_nikeName setSingleLineAutoResizeWithMaxWidth:150];
    
    self.clickView.sd_layout
    .bottomSpaceToView(self, 7)
    .rightEqualToView(self)
    .heightIs(20)
    .widthIs(80);
    
}

- (void)setupBackgroundImageView{
    _backgroundImageView = [[UIImageView alloc]init];
    _backgroundImageView.backgroundColor = [UIColor clearColor];
    
}

- (void)setupHeadImageView{
    _headImageView = [[UIImageView alloc]init];
    _headImageView.backgroundColor = [UIColor clearColor];
    
    _headImageView.layer.cornerRadius = 50;
    _headImageView.clipsToBounds = YES;
  
}


- (void)setupNikeName{
    _nikeName = [[UILabel alloc]init];
    _nikeName.backgroundColor = [UIColor clearColor];
    _nikeName.textColor = [UIColor whiteColor];
    
    

}

- (void)setupClickView{
    _clickView = [[UIView alloc]init];
    _clickView.backgroundColor = [UIColor clearColor];
    attendance = [[UIImageView alloc]init];
    attendanceL = [[UILabel alloc]init];
    attendanceL.font = FONT(12);
    
    
    [_clickView addSubview:attendance];
    [_clickView addSubview:attendanceL];
    
    attendance.sd_layout
    .leftEqualToView(_clickView)
    .heightIs(20)
    .widthIs(20)
    .topEqualToView(_clickView);
    
    attendanceL.sd_layout
    .rightEqualToView(_clickView)
    .bottomEqualToView(_clickView)
    .heightIs(20);
    [attendanceL setSingleLineAutoResizeWithMaxWidth:100];
    
    
}


- (void)setupNikeName:(NSString *)nikename andLV:(NSString *)level andDays:(NSString *)days andHeadImage:(UIImage *)headImage{
    NSString *string = [NSString stringWithFormat:@"打卡%@天",days];
    attendanceL.text = string;
    attendanceL.textColor = RGB(249, 227, 124);
    attendance.image = [UIImage imageNamed:@"打卡"];
    
    NSString *nikeString = [NSString stringWithFormat:@"%@Lv%@",nikename,level];
    NSMutableAttributedString *nikeMutable = [[NSMutableAttributedString alloc]initWithString:nikeString];
    [nikeMutable addAttribute:NSForegroundColorAttributeName value:RGB(249, 227, 124) range:NSMakeRange([nikeString rangeOfString:@"L"].location, 2+level.length)];
    _nikeName.attributedText = nikeMutable;
    
    _headImageView.image = headImage;
    
    // 高斯模糊
    GPUImageGaussianBlurFilter * blurFilter = [[GPUImageGaussianBlurFilter alloc] init];
    blurFilter.blurRadiusInPixels = 0.8;
    UIImage *blurredImage = [blurFilter imageByFilteringImage:headImage];
    _backgroundImageView.image = blurredImage;

    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
